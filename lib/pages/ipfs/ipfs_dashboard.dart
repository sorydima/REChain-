import 'package:flutter/material.dart';
import '../../features/integration/integration_manager.dart';
import '../../features/ipfs/ipfs_service.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import '../../features/blockchain/api/blockchain_service_manager.dart';
import '../../features/ipfs/ipfs_crypto.dart';

class IpfsDashboard extends StatefulWidget {
  final IntegrationManager integrationManager;
  const IpfsDashboard({Key? key, required this.integrationManager}) : super(key: key);

  @override
  State<IpfsDashboard> createState() => _IpfsDashboardState();
}

class _IpfsDashboardState extends State<IpfsDashboard> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<String> _providers;
  String? _selectedProvider;
  bool _isLoading = false;
  String? _error;
  List<IpfsFileInfo> _files = [];
  IpfsProviderStatus? _status;
  final List<Map<String, dynamic>> _logs = [];
  String _searchQuery = '';
  String _sortBy = 'name';
  String _filterType = 'all';
  bool _encryptUploads = false;

  @override
  void initState() {
    super.initState();
    _providers = widget.integrationManager.availableIpfsProviders;
    _selectedProvider = widget.integrationManager.currentIpfsProvider ?? _providers.first;
    _tabController = TabController(length: _providers.length, vsync: this);
    _loadProvider(_selectedProvider!);
  }

  Future<void> _loadProvider(String provider) async {
    setState(() { _isLoading = true; _error = null; });
    try {
      // For demo: use dummy config, in real app use secure config
      final config = await _getProviderConfig(provider);
      await widget.integrationManager.switchIpfsProvider(provider, config);
      await _refreshFiles();
      await _refreshStatus();
    } catch (e) {
      setState(() { _error = e.toString(); });
    } finally {
      setState(() { _isLoading = false; });
    }
  }

  Future<Map<String, dynamic>> _getProviderConfig(String provider) async {
    // TODO: Replace with secure config management
    if (provider == 'pinata') {
      return {'apiKey': 'your-pinata-api-key', 'secretApiKey': 'your-pinata-secret'};
    } else if (provider == 'web3storage') {
      return {'apiToken': 'your-web3storage-token'};
    }
    return {};
  }

  Future<void> _refreshFiles() async {
    final files = await widget.integrationManager.listIpfsPinnedFiles();
    setState(() { _files = files ?? []; });
  }

  Future<void> _refreshStatus() async {
    final status = await widget.integrationManager.getIpfsStatus();
    setState(() { _status = status; });
  }

  void _onProviderTab(int index) {
    final provider = _providers[index];
    setState(() { _selectedProvider = provider; });
    _loadProvider(provider);
  }

  List<IpfsFileInfo> get _filteredFiles {
    var files = _files;
    if (_searchQuery.isNotEmpty) {
      files = files.where((f) => f.fileName.toLowerCase().contains(_searchQuery.toLowerCase()) || f.cid.contains(_searchQuery)).toList();
    }
    if (_filterType != 'all') {
      files = files.where((f) {
        final ext = f.fileName.split('.').last.toLowerCase();
        if (_filterType == 'image') return ["jpg","jpeg","png","gif","bmp","webp"].contains(ext);
        if (_filterType == 'text') return ["txt","md","json","csv","log"].contains(ext);
        if (_filterType == 'audio') return ["mp3","wav","ogg"].contains(ext);
        if (_filterType == 'video') return ["mp4","webm","mov","avi"].contains(ext);
        return false;
      }).toList();
    }
    if (_sortBy == 'name') {
      files.sort((a, b) => a.fileName.compareTo(b.fileName));
    } else if (_sortBy == 'date') {
      files.sort((a, b) => (b.createdAt ?? DateTime(0)).compareTo(a.createdAt ?? DateTime(0)));
    } else if (_sortBy == 'size') {
      files.sort((a, b) => (b.size ?? 0).compareTo(a.size ?? 0));
    }
    return files;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IPFS Dashboard'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _providers.map((p) => Tab(text: p.toUpperCase())).toList(),
          onTap: _onProviderTab,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await _refreshFiles();
              await _refreshStatus();
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              : Column(
                  children: [
                    _buildStatusCard(),
                    Expanded(child: _buildFileManager()),
                    _buildLogsPanel(),
                  ],
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showQuickActions,
        icon: const Icon(Icons.add),
        label: const Text('Quick Actions'),
      ),
    );
  }

  Widget _buildStatusCard() {
    if (_status == null) return const SizedBox.shrink();
    final used = _status!.storageUsed;
    final limit = _status!.storageLimit;
    final fileCount = _files.length;
    final avgSize = fileCount > 0 ? (_files.map((f) => f.size ?? 0).reduce((a, b) => a + b) ~/ fileCount : 0;
    final largest = _files.isNotEmpty ? _files.map((f) => f.size ?? 0).reduce((a, b) => a > b ? a : b) : 0;
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        leading: Icon(_status!.isHealthy ? Icons.check_circle : Icons.error, color: _status!.isHealthy ? Colors.green : Colors.red),
        title: Text('${_status!.providerName} Status'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_status!.isHealthy ? 'Healthy' : 'Unavailable'),
            if (used != null) Text('Storage Used: $used bytes'),
            if (limit != null) Text('Storage Limit: $limit bytes'),
            Text('Files: $fileCount'),
            Text('Avg Size: $avgSize bytes'),
            Text('Largest: $largest bytes'),
            if (_status!.extra != null)
              ..._status!.extra!.entries.map((e) => Text('${e.key}: ${e.value}')),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () async {
            await _refreshStatus();
            await _refreshFiles();
          },
        ),
      ),
    );
  }

  Widget _buildFileManager() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search files...',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (v) => setState(() => _searchQuery = v),
                ),
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _sortBy,
                items: const [
                  DropdownMenuItem(value: 'name', child: Text('Name')),
                  DropdownMenuItem(value: 'date', child: Text('Date')),
                  DropdownMenuItem(value: 'size', child: Text('Size')),
                ],
                onChanged: (v) => setState(() => _sortBy = v!),
                hint: const Text('Sort'),
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _filterType,
                items: const [
                  DropdownMenuItem(value: 'all', child: Text('All')),
                  DropdownMenuItem(value: 'image', child: Text('Images')),
                  DropdownMenuItem(value: 'text', child: Text('Text')),
                  DropdownMenuItem(value: 'audio', child: Text('Audio')),
                  DropdownMenuItem(value: 'video', child: Text('Video')),
                ],
                onChanged: (v) => setState(() => _filterType = v!),
                hint: const Text('Filter'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredFiles.length,
            itemBuilder: (context, i) {
              final file = _filteredFiles[i];
              return Card(
                child: ListTile(
                  leading: FutureBuilder<Widget>(
                    future: _buildFilePreview(file),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                        return snapshot.data!;
                      }
                      return const Icon(Icons.insert_drive_file);
                    },
                  ),
                  title: Text(file.fileName),
                  subtitle: Text('CID: ${file.cid}\nSize: ${file.size ?? 'N/A'} bytes\nDate: ${file.createdAt ?? 'N/A'}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () => _downloadFile(file),
                      ),
                      IconButton(
                        icon: const Icon(Icons.push_pin),
                        onPressed: () => _pinFile(file),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () => _unpinFile(file),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share),
                        tooltip: 'Share to Matrix',
                        onPressed: () => _shareToMatrix(file),
                      ),
                      IconButton(
                        icon: const Icon(Icons.link),
                        tooltip: 'Record on Blockchain',
                        onPressed: () => _recordOnBlockchain(file),
                      ),
                    ],
                  ),
                  onTap: () => _showFilePreviewDialog(file),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<Widget> _buildFilePreview(IpfsFileInfo file) async {
    final ext = file.fileName.split('.').last.toLowerCase();
    final bytes = await widget.integrationManager.downloadFromIpfs(file.cid);
    if (bytes == null) return const Icon(Icons.insert_drive_file);
    if (["jpg", "jpeg", "png", "gif", "bmp", "webp"].contains(ext)) {
      return Image.memory(Uint8List.fromList(bytes), width: 40, height: 40, fit: BoxFit.cover);
    } else if (["txt", "md", "json", "csv", "log"].contains(ext)) {
      final text = utf8.decode(bytes, allowMalformed: true);
      return Icon(Icons.description, color: Colors.blue);
    } else if (["mp3", "wav", "ogg"].contains(ext)) {
      return Icon(Icons.audiotrack, color: Colors.green);
    } else if (["mp4", "webm", "mov", "avi"].contains(ext)) {
      return Icon(Icons.videocam, color: Colors.red);
    }
    return const Icon(Icons.insert_drive_file);
  }

  void _showFilePreviewDialog(IpfsFileInfo file) async {
    final ext = file.fileName.split('.').last.toLowerCase();
    final bytes = await widget.integrationManager.downloadFromIpfs(file.cid);
    if (bytes == null) return;
    showDialog(
      context: context,
      builder: (context) {
        if (["jpg", "jpeg", "png", "gif", "bmp", "webp"].contains(ext)) {
          return Dialog(child: Image.memory(Uint8List.fromList(bytes)));
        } else if (["txt", "md", "json", "csv", "log"].contains(ext)) {
          final text = utf8.decode(bytes, allowMalformed: true);
          return Dialog(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(text.length > 1000 ? text.substring(0, 1000) + '...' : text),
            ),
          );
        } else if (["mp3", "wav", "ogg"].contains(ext)) {
          final player = AudioPlayer();
          player.play(BytesSource(bytes));
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                const Text('Audio Preview'),
                IconButton(
                  icon: const Icon(Icons.stop),
                  onPressed: () => player.stop(),
                ),
              ],
            ),
          );
        } else if (["mp4", "webm", "mov", "avi"].contains(ext)) {
          final controller = VideoPlayerController.memory(Uint8List.fromList(bytes));
          controller.initialize().then((_) => controller.play());
          return Dialog(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          );
        }
        return Dialog(child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text('No preview available for this file type.'),
        ));
      },
    );
  }

  Widget _buildLogsPanel() {
    if (_logs.isEmpty) return const SizedBox.shrink();
    return Container(
      height: 100,
      color: Colors.black12,
      child: ListView(
        children: _logs.map((log) => Text('[${log['level']}] ${log['message']}')).toList(),
      ),
    );
  }

  void _showQuickActions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.upload_file),
            title: const Text('Upload File'),
            onTap: _uploadFile,
          ),
          ListTile(
            leading: Icon(_encryptUploads ? Icons.lock : Icons.lock_open),
            title: Text(_encryptUploads ? 'Disable Encryption' : 'Enable Encryption'),
            onTap: () {
              setState(() => _encryptUploads = !_encryptUploads);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Upload Identity'),
            onTap: _uploadIdentityFile,
          ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: const Text('Refresh Files'),
            onTap: () async {
              Navigator.pop(context);
              await _refreshFiles();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _uploadFile() async {
    Navigator.pop(context);
    String? password;
    if (_encryptUploads) {
      password = await _promptPassword('Enter password to encrypt file(s)');
      if (password == null) return;
    }
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: true);
      if (result != null && result.files.isNotEmpty) {
        int successCount = 0;
        for (final file in result.files) {
          if (file.bytes != null) {
            try {
              final bytes = _encryptUploads ? IpfsCrypto.encryptFile(file.bytes!, password!) : file.bytes!;
              final cid = await widget.integrationManager.uploadToIpfs(
                fileBytes: bytes,
                fileName: file.name,
              );
              setState(() {
                _logs.add({'level': 'success', 'message': 'Uploaded ${file.name} to IPFS: $cid${_encryptUploads ? ' (encrypted)' : ''}'});
              });
              successCount++;
            } catch (e) {
              setState(() {
                _logs.add({'level': 'error', 'message': 'Upload failed for ${file.name}: $e'});
              });
            }
          }
        }
        await _refreshFiles();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Batch Upload Complete'),
            content: Text('Successfully uploaded $successCount of ${result.files.length} files.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        setState(() {
          _logs.add({'level': 'info', 'message': 'File selection cancelled'});
        });
      }
    } catch (e) {
      setState(() {
        _logs.add({'level': 'error', 'message': 'Batch upload failed: $e'});
      });
    }
  }

  Future<void> _uploadIdentityFile() async {
    Navigator.pop(context);
    final identityTypes = ['DID', 'Avatar', 'Credential'];
    String selectedType = identityTypes.first;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Identity Type'),
        content: DropdownButton<String>(
          isExpanded: true,
          value: selectedType,
          items: identityTypes.map((type) => DropdownMenuItem(
            value: type,
            child: Text(type),
          )).toList(),
          onChanged: (type) => selectedType = type!,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Next'),
          ),
        ],
      ),
    );
    try {
      final result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.bytes != null) {
        final file = result.files.single;
        final cid = await widget.integrationManager.uploadToIpfs(
          fileBytes: file.bytes!,
          fileName: file.name,
        );
        // Link the CID to the user profile (pseudo-code, replace with your actual profile service)
        // await UserProfileService.instance.linkIdentityFile(selectedType, cid);
        setState(() {
          _logs.add({'level': 'success', 'message': 'Uploaded $selectedType identity file to IPFS: $cid'});
        });
        await _refreshFiles();
      } else {
        setState(() {
          _logs.add({'level': 'info', 'message': 'Identity file selection cancelled'});
        });
      }
    } catch (e) {
      setState(() {
        _logs.add({'level': 'error', 'message': 'Identity upload failed: $e'});
      });
    }
  }

  Future<void> _downloadFile(IpfsFileInfo file) async {
    String? password;
    if (_encryptUploads) {
      password = await _promptPassword('Enter password to decrypt file');
      if (password == null) return;
    }
    try {
      final bytes = await widget.integrationManager.downloadFromIpfs(file.cid);
      if (bytes == null) throw Exception('Download failed');
      final data = _encryptUploads ? IpfsCrypto.decryptFile(Uint8List.fromList(bytes), password!) : bytes;
      // TODO: Save file to device or open preview
      setState(() {
        _logs.add({'level': 'success', 'message': 'Downloaded ${file.fileName}${_encryptUploads ? ' (decrypted)' : ''}'});
      });
    } catch (e) {
      setState(() {
        _logs.add({'level': 'error', 'message': 'Download failed for ${file.fileName}: $e'});
      });
    }
  }

  Future<String?> _promptPassword(String title) async {
    String? password;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          obscureText: true,
          autofocus: true,
          onChanged: (v) => password = v,
          decoration: const InputDecoration(labelText: 'Password'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    return password;
  }

  Future<void> _pinFile(IpfsFileInfo file) async {
    final result = await widget.integrationManager.pinIpfsFile(file.cid);
    setState(() { _logs.add({'level': 'info', 'message': 'Pin ${file.fileName}: $result'}); });
  }

  Future<void> _unpinFile(IpfsFileInfo file) async {
    final result = await widget.integrationManager.unpinIpfsFile(file.cid);
    setState(() { _logs.add({'level': 'info', 'message': 'Unpin ${file.fileName}: $result'}); });
  }

  Future<void> _recordOnBlockchain(IpfsFileInfo file) async {
    final blockchains = ['Ethereum', 'TON'];
    String? selectedChain = blockchains.first;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Record on Blockchain'),
        content: DropdownButton<String>(
          isExpanded: true,
          value: selectedChain,
          items: blockchains.map((chain) => DropdownMenuItem(
            value: chain,
            child: Text(chain),
          )).toList(),
          onChanged: (chain) => selectedChain = chain,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Record'),
          ),
        ],
      ),
    );
    if (selectedChain != null) {
      try {
        final blockchainService = BlockchainServiceManager.getService(selectedChain);
        final txHash = await blockchainService.recordIpfsHash(file.cid, fileName: file.fileName);
        setState(() {
          _logs.add({'level': 'success', 'message': 'Recorded ${file.cid} on $selectedChain: $txHash'});
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Transaction Sent'),
            content: Text('Transaction hash: $txHash'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
              TextButton(
                onPressed: () => _openExplorer(selectedChain!, txHash),
                child: const Text('View on Explorer'),
              ),
            ],
          ),
        );
      } catch (e) {
        setState(() {
          _logs.add({'level': 'error', 'message': 'Blockchain record failed: $e'});
        });
      }
    }
  }

  void _openExplorer(String chain, String txHash) {
    // Implement logic to open the transaction in a block explorer
    // For example, use url_launcher to open etherscan or tonviewer
  }
} 