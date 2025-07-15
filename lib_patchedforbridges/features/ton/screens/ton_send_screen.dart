import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/ton_config.dart';
import '../wallet/ton_wallet_service.dart';

class TonSendScreen extends StatefulWidget {
  final TonWallet wallet;

  const TonSendScreen({
    Key? key,
    required this.wallet,
  }) : super(key: key);

  @override
  State<TonSendScreen> createState() => _TonSendScreenState();
}

class _TonSendScreenState extends State<TonSendScreen> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _amountController = TextEditingController();
  final _commentController = TextEditingController();
  
  bool _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send TON'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            _buildAddressField(),
            const SizedBox(height: 16),
            _buildAmountField(),
            const SizedBox(height: 16),
            _buildCommentField(),
            const SizedBox(height: 24),
            _buildSendButton(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildBalanceCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Available Balance',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              widget.wallet.formattedBalance,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildAddressField() {
    return TextFormField(
      controller: _addressController,
      decoration: InputDecoration(
        labelText: 'Recipient Address',
        suffixIcon: IconButton(
          icon: const Icon(Icons.paste),
          onPressed: _pasteAddress,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a recipient address';
        }
        if (!TonConfig.isValidTonAddress(value)) {
          return 'Invalid TON address';
        }
        return null;
      },
    );
  }
  
  Widget _buildAmountField() {
    return TextFormField(
      controller: _amountController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(
        labelText: 'Amount (TON)',
        suffixText: 'TON',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an amount';
        }
        
        final amount = double.tryParse(value);
        if (amount == null || amount <= 0) {
          return 'Please enter a valid amount';
        }
        
        if (amount > widget.wallet.balance) {
          return 'Insufficient balance';
        }
        
        if (!TonConfig.isValidAmount(amount)) {
          return 'Amount must be between ${TonConfig.minimumInvestment} and ${TonConfig.maximumInvestment} TON';
        }
        
        return null;
      },
    );
  }
  
  Widget _buildCommentField() {
    return TextFormField(
      controller: _commentController,
      maxLines: 2,
      decoration: const InputDecoration(
        labelText: 'Comment (Optional)',
        hintText: 'Add a message to this transaction',
      ),
    );
  }
  
  Widget _buildSendButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _sendTransaction,
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : const Text('Send TON'),
    );
  }
  
  Future<void> _pasteAddress() async {
    final data = await Clipboard.getData('text/plain');
    if (data?.text != null) {
      _addressController.text = data!.text!;
    }
  }
  
  Future<void> _sendTransaction() async {
    if (!_formKey.currentState!.validate()) return;
    
    try {
      setState(() => _isLoading = true);
      
      final amount = double.parse(_amountController.text);
      final txHash = await TonWalletService.instance.sendTransaction(
        toAddress: _addressController.text,
        amount: amount,
        comment: _commentController.text,
      );
      
      if (!mounted) return;
      
      // Show success dialog
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Transaction Sent'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Transaction has been sent successfully!'),
              const SizedBox(height: 8),
              Text('Hash: ${_formatTxHash(txHash)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      
      // Return to previous screen
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      // Show error dialog
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  
  String _formatTxHash(String hash) {
    if (hash.length <= 16) return hash;
    return '${hash.substring(0, 8)}...${hash.substring(hash.length - 8)}';
  }
  
  @override
  void dispose() {
    _addressController.dispose();
    _amountController.dispose();
    _commentController.dispose();
    super.dispose();
  }
}
