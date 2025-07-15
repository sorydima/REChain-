import 'package:flutter/material.dart';

import '../hyip/ton_investment_service.dart';
import '../wallet/ton_wallet_service.dart';
import '../models/ton_models.dart';

class TonInvestmentScreen extends StatefulWidget {
  final TonInvestmentPool pool;

  const TonInvestmentScreen({
    Key? key,
    required this.pool,
  }) : super(key: key);

  @override
  State<TonInvestmentScreen> createState() => _TonInvestmentScreenState();
}

class _TonInvestmentScreenState extends State<TonInvestmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  
  bool _isLoading = false;
  bool _acceptedRisks = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pool.name),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildPoolInfoCard(),
            const SizedBox(height: 24),
            _buildInvestmentForm(),
            const SizedBox(height: 24),
            _buildRiskWarning(),
            const SizedBox(height: 24),
            _buildInvestButton(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPoolInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.pool.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getRiskLevelColor(widget.pool.riskLevel),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.pool.riskLevelText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              widget.pool.description,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _InfoItem(
                    label: 'Expected APR',
                    value: widget.pool.formattedApr,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: _InfoItem(
                    label: 'Lock Period',
                    value: widget.pool.lockPeriodText,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _InfoItem(
                    label: 'Total Value Locked',
                    value: widget.pool.formattedTvl,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: _InfoItem(
                    label: 'Participants',
                    value: widget.pool.participantCount.toString(),
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInvestmentForm() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Investment Amount',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Amount (TON)',
                suffixText: 'TON',
                helperText: 'Min: ${widget.pool.minInvestment} TON, Max: ${widget.pool.maxInvestment} TON',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                
                final amount = double.tryParse(value);
                if (amount == null || amount <= 0) {
                  return 'Please enter a valid amount';
                }
                
                if (amount < widget.pool.minInvestment) {
                  return 'Minimum investment is ${widget.pool.minInvestment} TON';
                }
                
                if (amount > widget.pool.maxInvestment) {
                  return 'Maximum investment is ${widget.pool.maxInvestment} TON';
                }
                
                final wallet = TonWalletService.instance.activeWallet;
                if (wallet != null && amount > wallet.balance) {
                  return 'Insufficient balance';
                }
                
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildProjectedReturns(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProjectedReturns() {
    final amountText = _amountController.text;
    final amount = double.tryParse(amountText);
    
    if (amount == null || amount <= 0) {
      return const SizedBox.shrink();
    }
    
    final years = widget.pool.lockPeriod.inDays / 365.0;
    final expectedReturn = amount * (1 + (widget.pool.expectedApr / 100) * years);
    final profit = expectedReturn - amount;
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projected Returns',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Investment:'),
              Text('${amount.toStringAsFixed(2)} TON'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Expected Return:'),
              Text(
                '${expectedReturn.toStringAsFixed(2)} TON',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Profit:'),
              Text(
                '+${profit.toStringAsFixed(2)} TON',
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildRiskWarning() {
    return Card(
      color: Colors.orange.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.orange[700],
                ),
                const SizedBox(width: 8),
                Text(
                  'Risk Warning',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _getRiskWarningText(),
              style: TextStyle(
                color: Colors.orange[700],
              ),
            ),
            const SizedBox(height: 12),
            CheckboxListTile(
              value: _acceptedRisks,
              onChanged: (value) {
                setState(() => _acceptedRisks = value ?? false);
              },
              title: const Text(
                'I understand and accept the risks involved',
                style: TextStyle(fontSize: 14),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildInvestButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading || !_acceptedRisks ? null : _invest,
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
            : const Text('Invest Now'),
      ),
    );
  }
  
  Future<void> _invest() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptedRisks) return;
    
    final wallet = TonWalletService.instance.activeWallet;
    if (wallet == null) {
      _showError('Please create a wallet first');
      return;
    }
    
    final amount = double.parse(_amountController.text);
    
    final confirmed = await _showConfirmationDialog(
      'Confirm Investment',
      'Are you sure you want to invest ${amount.toStringAsFixed(2)} TON in ${widget.pool.name}?\n\nThis amount will be locked for ${widget.pool.lockPeriodText}.',
    );
    
    if (!confirmed) return;
    
    try {
      setState(() => _isLoading = true);
      
      final investment = await TonInvestmentService.instance.createInvestment(
        poolId: widget.pool.id,
        amount: amount,
        walletAddress: wallet.address,
        privateKey: '', // This would need to be retrieved securely
      );
      
      if (!mounted) return;
      
      // Show success dialog
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Investment Successful'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Your investment has been created successfully!'),
              const SizedBox(height: 8),
              Text('Investment ID: ${investment.id}'),
              Text('Amount: ${investment.formattedAmount}'),
              Text('Expected Return: ${investment.formattedReturn}'),
              Text('Maturity Date: ${investment.maturityDate.toString().split(' ')[0]}'),
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
      _showError('Failed to create investment: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  
  Future<bool> _showConfirmationDialog(String title, String message) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    
    return result ?? false;
  }
  
  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
  
  Color _getRiskLevelColor(InvestmentRiskLevel level) {
    switch (level) {
      case InvestmentRiskLevel.low:
        return Colors.green;
      case InvestmentRiskLevel.medium:
        return Colors.orange;
      case InvestmentRiskLevel.high:
        return Colors.red;
      case InvestmentRiskLevel.extreme:
        return Colors.purple;
    }
    return Colors.grey; // default color to avoid missing return
  }
  
  String _getRiskWarningText() {
    switch (widget.pool.riskLevel) {
      case InvestmentRiskLevel.low:
        return 'This is a low-risk investment with stable returns. However, all investments carry some risk and past performance does not guarantee future results.';
      case InvestmentRiskLevel.medium:
        return 'This is a medium-risk investment. While it offers higher potential returns, there is increased risk of loss. Only invest what you can afford to lose.';
      case InvestmentRiskLevel.high:
        return 'This is a high-risk investment with potential for significant gains or losses. Market volatility can greatly affect returns. Invest with caution.';
      case InvestmentRiskLevel.extreme:
        return 'This is an extremely high-risk investment. You could lose your entire investment. Only experienced investors should consider this option.';
    }
    return 'Investment risk warning'; // Default fallback
  }
  
  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _InfoItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
