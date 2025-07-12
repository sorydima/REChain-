import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../features/ai/ai_service_manager.dart';
import '../../config/ai_services_config.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/error_dialog.dart';

/// AI Services Dashboard - Main interface for all AI services
class AIServicesDashboard extends StatefulWidget {
  const AIServicesDashboard({super.key});

  @override
  State<AIServicesDashboard> createState() => _AIServicesDashboardState();
}

class _AIServicesDashboardState extends State<AIServicesDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AIServiceManager _aiManager;
  late AIServicesConfig _config;
  
  final TextEditingController _promptController = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();
  
  String _selectedService = 'OpenAI';
  String _selectedModel = '';
  String _selectedTaskType = 'text';
  bool _isLoading = false;
  List<AIResponse> _responses = [];
  Map<String, bool> _serviceStatus = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _aiManager = AIServiceManager.instance;
    _config = AIServicesConfig.instance;
    _loadServiceStatus();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _promptController.dispose();
    _apiKeyController.dispose();
    super.dispose();
  }

  Future<void> _loadServiceStatus() async {
    setState(() {
      _serviceStatus = _config.serviceStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Services Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettingsDialog,
            tooltip: 'Settings',
          ),
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: _showHelpDialog,
            tooltip: 'Help',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.chat), text: 'Chat'),
            Tab(icon: Icon(Icons.image), text: 'Image'),
            Tab(icon: Icon(Icons.code), text: 'Code'),
            Tab(icon: Icon(Icons.analytics), text: 'Analytics'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildChatTab(),
          _buildImageTab(),
          _buildCodeTab(),
          _buildAnalyticsTab(),
        ],
      ),
    );
  }

  Widget _buildChatTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildServiceSelector(),
          const SizedBox(height: 16),
          _buildPromptInput(),
          const SizedBox(height: 16),
          _buildActionButtons(),
          const SizedBox(height: 16),
          Expanded(child: _buildResponsesList()),
        ],
      ),
    );
  }

  Widget _buildImageTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildServiceSelector(taskType: 'image'),
          const SizedBox(height: 16),
          _buildPromptInput(hint: 'Describe the image you want to generate...'),
          const SizedBox(height: 16),
          _buildImageOptions(),
          const SizedBox(height: 16),
          _buildActionButtons(taskType: 'image'),
          const SizedBox(height: 16),
          Expanded(child: _buildImageResponsesList()),
        ],
      ),
    );
  }

  Widget _buildCodeTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildServiceSelector(taskType: 'code'),
          const SizedBox(height: 16),
          _buildPromptInput(hint: 'Describe the code you want to generate...'),
          const SizedBox(height: 16),
          _buildCodeOptions(),
          const SizedBox(height: 16),
          _buildActionButtons(taskType: 'code'),
          const SizedBox(height: 16),
          Expanded(child: _buildCodeResponsesList()),
        ],
      ),
    );
  }

  Widget _buildAnalyticsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildAnalyticsOverview(),
          const SizedBox(height: 16),
          Expanded(child: _buildAnalyticsDetails()),
        ],
      ),
    );
  }

  Widget _buildServiceSelector({String taskType = 'text'}) {
    final services = _getAvailableServices(taskType);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select AI Service',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedService,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Service',
              ),
              items: services.map((service) {
                final isEnabled = _serviceStatus[service] ?? false;
                return DropdownMenuItem(
                  value: service,
                  child: Row(
                    children: [
                      Icon(
                        isEnabled ? Icons.check_circle : Icons.error,
                        color: isEnabled ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(service),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedService = value!;
                  _selectedModel = _getDefaultModel(value, taskType);
                });
              },
            ),
            const SizedBox(height: 8),
            if (_selectedModel.isNotEmpty) ...[
              DropdownButtonFormField<String>(
                value: _selectedModel,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Model',
                ),
                items: _getAvailableModels(_selectedService, taskType)
                    .map((model) => DropdownMenuItem(value: model, child: Text(model)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedModel = value!;
                  });
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPromptInput({String hint = 'Enter your prompt...'}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prompt',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _promptController,
              maxLines: 4,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: hint,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _promptController.clear(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageOptions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Image Options',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: '1024x1024',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Size',
                    ),
                    items: const [
                      DropdownMenuItem(value: '256x256', child: Text('256x256')),
                      DropdownMenuItem(value: '512x512', child: Text('512x512')),
                      DropdownMenuItem(value: '1024x1024', child: Text('1024x1024')),
                      DropdownMenuItem(value: '1024x1792', child: Text('1024x1792')),
                      DropdownMenuItem(value: '1792x1024', child: Text('1792x1024')),
                    ],
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'standard',
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Quality',
                    ),
                    items: const [
                      DropdownMenuItem(value: 'standard', child: Text('Standard')),
                      DropdownMenuItem(value: 'hd', child: Text('HD')),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeOptions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Code Options',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: 'dart',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Language',
              ),
              items: const [
                DropdownMenuItem(value: 'dart', child: Text('Dart')),
                DropdownMenuItem(value: 'python', child: Text('Python')),
                DropdownMenuItem(value: 'javascript', child: Text('JavaScript')),
                DropdownMenuItem(value: 'typescript', child: Text('TypeScript')),
                DropdownMenuItem(value: 'java', child: Text('Java')),
                DropdownMenuItem(value: 'csharp', child: Text('C#')),
                DropdownMenuItem(value: 'go', child: Text('Go')),
                DropdownMenuItem(value: 'rust', child: Text('Rust')),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons({String taskType = 'text'}) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: _isLoading ? null : () => _generateResponse(taskType),
            icon: _isLoading 
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send),
            label: Text(_getButtonText(taskType)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: _isLoading ? null : _clearResponses,
          icon: const Icon(Icons.clear_all),
          tooltip: 'Clear responses',
        ),
        IconButton(
          onPressed: _isLoading ? null : _exportResponses,
          icon: const Icon(Icons.download),
          tooltip: 'Export responses',
        ),
      ],
    );
  }

  Widget _buildResponsesList() {
    if (_responses.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No responses yet',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Enter a prompt and select a service to get started',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _responses.length,
      itemBuilder: (context, index) {
        final response = _responses[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ExpansionTile(
            title: Row(
              children: [
                Icon(
                  _getResponseIcon(response.type),
                  color: _getResponseColor(response.type),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${response.serviceName} - ${response.timestamp.toString().substring(0, 19)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                if (response.cost != null)
                  Chip(
                    label: Text('\$${response.cost!.toStringAsFixed(4)}'),
                    backgroundColor: Colors.green.shade100,
                  ),
              ],
            ),
            subtitle: Text(
              response.content.length > 100 
                  ? '${response.content.substring(0, 100)}...'
                  : response.content,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(response.content),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (response.tokens != null)
                          Text('Tokens: ${response.tokens}'),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () => _copyToClipboard(response.content),
                              tooltip: 'Copy to clipboard',
                            ),
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () => _shareResponse(response),
                              tooltip: 'Share',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageResponsesList() {
    final imageResponses = _responses.where((r) => r.type == AIResponseType.image).toList();
    
    if (imageResponses.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No images generated yet',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: imageResponses.length,
      itemBuilder: (context, index) {
        final response = imageResponses[index];
        return Card(
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                  child: Image.network(
                    response.content,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        response.serviceName ?? 'Unknown',
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.download, size: 16),
                      onPressed: () => _downloadImage(response.content),
                      tooltip: 'Download',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCodeResponsesList() {
    final codeResponses = _responses.where((r) => r.type == AIResponseType.code).toList();
    
    if (codeResponses.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.code_outlined, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No code generated yet',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: codeResponses.length,
      itemBuilder: (context, index) {
        final response = codeResponses[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ExpansionTile(
            title: Row(
              children: [
                const Icon(Icons.code, color: Colors.blue),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${response.serviceName} - ${response.metadata['language'] ?? 'Unknown'}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: SelectableText(
                        response.content,
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () => _copyToClipboard(response.content),
                          tooltip: 'Copy code',
                        ),
                        IconButton(
                          icon: const Icon(Icons.download),
                          onPressed: () => _downloadCode(response),
                          tooltip: 'Download code',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnalyticsOverview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Analytics Overview',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildAnalyticsCard(
                    'Total Requests',
                    _responses.length.toString(),
                    Icons.analytics,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildAnalyticsCard(
                    'Total Cost',
                    '\$${_calculateTotalCost().toStringAsFixed(4)}',
                    Icons.attach_money,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildAnalyticsCard(
                    'Active Services',
                    _serviceStatus.values.where((status) => status).length.toString(),
                    Icons.check_circle,
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsCard(String title, String value, IconData icon, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: color.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service Usage',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _serviceStatus.length,
                itemBuilder: (context, index) {
                  final service = _serviceStatus.keys.elementAt(index);
                  final isEnabled = _serviceStatus[service] ?? false;
                  final usage = _getServiceUsage(service);
                  
                  return ListTile(
                    leading: Icon(
                      isEnabled ? Icons.check_circle : Icons.error,
                      color: isEnabled ? Colors.green : Colors.red,
                    ),
                    title: Text(service),
                    subtitle: Text('${usage['count']} requests, \$${usage['cost'].toStringAsFixed(4)}'),
                    trailing: Text('${usage['tokens']} tokens'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  List<String> _getAvailableServices(String taskType) {
    final allServices = [
      'OpenAI', 'Anthropic', 'Google AI', 'Azure OpenAI', 'Cohere',
      'Hugging Face', 'Replicate', 'Stability AI', 'Midjourney', 'DALL-E',
      'Claude', 'Bard', 'Perplexity', 'You', 'Phind', 'Poe',
      'Character AI', 'Jasper', 'Copy AI', 'Writesonic', 'Etke'
    ];
    
    // Filter based on task type
    switch (taskType) {
      case 'image':
        return ['OpenAI', 'DALL-E', 'Midjourney', 'Stability AI', 'Replicate', 'Etke'];
      case 'code':
        return ['OpenAI', 'Anthropic', 'Claude', 'Phind', 'Cohere', 'Etke'];
      default:
        return allServices;
    }
  }

  String _getDefaultModel(String service, String taskType) {
    final config = _config.getServiceConfig(service);
    if (config == null) return '';
    
    final models = config['models'] as Map<String, dynamic>?;
    if (models == null) return '';
    
    switch (taskType) {
      case 'image':
        return (models['image'] as List?)?.first ?? '';
      case 'code':
        return (models['text'] as List?)?.first ?? '';
      default:
        return (models['text'] as List?)?.first ?? '';
    }
  }

  List<String> _getAvailableModels(String service, String taskType) {
    final config = _config.getServiceConfig(service);
    if (config == null) return [];
    
    final models = config['models'] as Map<String, dynamic>?;
    if (models == null) return [];
    
    switch (taskType) {
      case 'image':
        return List<String>.from(models['image'] ?? []);
      case 'code':
        return List<String>.from(models['text'] ?? []);
      default:
        return List<String>.from(models['text'] ?? []);
    }
  }

  String _getButtonText(String taskType) {
    switch (taskType) {
      case 'image':
        return 'Generate Image';
      case 'code':
        return 'Generate Code';
      default:
        return 'Generate Text';
    }
  }

  IconData _getResponseIcon(AIResponseType type) {
    switch (type) {
      case AIResponseType.text:
        return Icons.text_fields;
      case AIResponseType.image:
        return Icons.image;
      case AIResponseType.code:
        return Icons.code;
      case AIResponseType.chat:
        return Icons.chat;
      case AIResponseType.content:
        return Icons.article;
      case AIResponseType.audio:
        return Icons.audiotrack;
      case AIResponseType.video:
        return Icons.videocam;
    }
  }

  Color _getResponseColor(AIResponseType type) {
    switch (type) {
      case AIResponseType.text:
        return Colors.blue;
      case AIResponseType.image:
        return Colors.green;
      case AIResponseType.code:
        return Colors.orange;
      case AIResponseType.chat:
        return Colors.purple;
      case AIResponseType.content:
        return Colors.teal;
      case AIResponseType.audio:
        return Colors.red;
      case AIResponseType.video:
        return Colors.indigo;
    }
  }

  double _calculateTotalCost() {
    return _responses.fold(0.0, (sum, response) => sum + (response.cost ?? 0.0));
  }

  Map<String, dynamic> _getServiceUsage(String service) {
    final serviceResponses = _responses.where((r) => r.serviceName == service).toList();
    return {
      'count': serviceResponses.length,
      'cost': serviceResponses.fold(0.0, (sum, r) => sum + (r.cost ?? 0.0)),
      'tokens': serviceResponses.fold(0, (sum, r) => sum + (r.tokens ?? 0)),
    };
  }

  // Action methods
  Future<void> _generateResponse(String taskType) async {
    if (_promptController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a prompt')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      List<AIResponse> responses = [];
      
      switch (taskType) {
        case 'image':
          responses = await _aiManager.generateImageMultiService(
            prompt: _promptController.text,
            services: [_selectedService],
          );
          break;
        case 'code':
          responses = await _aiManager.generateCodeMultiService(
            prompt: _promptController.text,
            language: 'dart', // Get from UI
            services: [_selectedService],
          );
          break;
        default:
          responses = await _aiManager.generateTextMultiService(
            prompt: _promptController.text,
            services: [_selectedService],
          );
      }

      setState(() {
        _responses.addAll(responses);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void _clearResponses() {
    setState(() {
      _responses.clear();
    });
  }

  void _exportResponses() {
    // Implementation for exporting responses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Export feature coming soon')),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  void _shareResponse(AIResponse response) {
    // Implementation for sharing responses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Share feature coming soon')),
    );
  }

  void _downloadImage(String imageUrl) {
    // Implementation for downloading images
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download feature coming soon')),
    );
  }

  void _downloadCode(AIResponse response) {
    // Implementation for downloading code
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Download feature coming soon')),
    );
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => const AIServicesSettingsDialog(),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => const AIServicesHelpDialog(),
    );
  }
}

/// AI Services Settings Dialog
class AIServicesSettingsDialog extends StatefulWidget {
  const AIServicesSettingsDialog({super.key});

  @override
  State<AIServicesSettingsDialog> createState() => _AIServicesSettingsDialogState();
}

class _AIServicesSettingsDialogState extends State<AIServicesSettingsDialog> {
  final AIServicesConfig _config = AIServicesConfig.instance;
  Map<String, Map<String, dynamic>> _configurations = {};
  String _selectedService = '';

  @override
  void initState() {
    super.initState();
    _configurations = Map.from(_config.configurations);
    if (_configurations.isNotEmpty) {
      _selectedService = _configurations.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 600,
        height: 500,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AI Services Settings',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedService.isEmpty ? null : _selectedService,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Select Service',
                    ),
                    items: _configurations.keys.map((service) {
                      return DropdownMenuItem(
                        value: service,
                        child: Text(service.replaceAll('_', ' ').toUpperCase()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedService = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _exportConfig,
                  child: const Text('Export'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _importConfig,
                  child: const Text('Import'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _selectedService.isEmpty
                  ? const Center(child: Text('Select a service to configure'))
                  : _buildServiceConfig(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceConfig() {
    final config = _configurations[_selectedService]!;
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildConfigField('API Key', 'api_key', config),
          _buildConfigField('Base URL', 'base_url', config),
          _buildConfigField('Organization', 'organization', config),
          _buildConfigField('Deployment Name', 'deployment_name', config),
          _buildConfigField('API Version', 'api_version', config),
          _buildConfigField('Default Model', 'default_model', config),
          _buildNumberField('Max Tokens', 'max_tokens', config),
          _buildNumberField('Temperature', 'temperature', config),
          _buildSwitchField('Enabled', 'enabled', config),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: _saveConfig,
                child: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildConfigField(String label, String key, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        obscureText: key.contains('key'),
        controller: TextEditingController(text: config[key]?.toString() ?? ''),
        onChanged: (value) {
          config[key] = value;
        },
      ),
    );
  }

  Widget _buildNumberField(String label, String key, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        keyboardType: TextInputType.number,
        controller: TextEditingController(text: config[key]?.toString() ?? ''),
        onChanged: (value) {
          final numValue = double.tryParse(value);
          if (numValue != null) {
            config[key] = numValue;
          }
        },
      ),
    );
  }

  Widget _buildSwitchField(String label, String key, Map<String, dynamic> config) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Switch(
            value: config[key] ?? false,
            onChanged: (value) {
              setState(() {
                config[key] = value;
              });
            },
          ),
        ],
      ),
    );
  }

  void _saveConfig() async {
    await _config.updateServiceConfig(_selectedService, _configurations[_selectedService]!);
    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Configuration saved')),
      );
    }
  }

  void _exportConfig() {
    // Implementation for exporting configuration
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Export feature coming soon')),
    );
  }

  void _importConfig() {
    // Implementation for importing configuration
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Import feature coming soon')),
    );
  }
}

/// AI Services Help Dialog
class AIServicesHelpDialog extends StatelessWidget {
  const AIServicesHelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 500,
        height: 400,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'AI Services Help',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHelpSection(
                      'Getting Started',
                      '1. Configure your API keys in Settings\n'
                      '2. Select an AI service and model\n'
                      '3. Enter your prompt\n'
                      '4. Click Generate to get results',
                    ),
                    _buildHelpSection(
                      'Supported Services',
                      '• OpenAI (GPT-4, DALL-E)\n'
                      '• Anthropic (Claude)\n'
                      '• Google AI (Gemini, Bard)\n'
                      '• Azure OpenAI\n'
                      '• Cohere\n'
                      '• Hugging Face\n'
                      '• And many more...',
                    ),
                    _buildHelpSection(
                      'Features',
                      '• Multi-service text generation\n'
                      '• Image generation\n'
                      '• Code generation\n'
                      '• Usage analytics\n'
                      '• Cost tracking\n'
                      '• Response comparison',
                    ),
                    _buildHelpSection(
                      'Tips',
                      '• Use specific prompts for better results\n'
                      '• Compare responses from different services\n'
                      '• Monitor your usage and costs\n'
                      '• Export responses for later use',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }
} 