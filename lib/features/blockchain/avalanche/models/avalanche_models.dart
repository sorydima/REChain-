import '../../common/interfaces/blockchain_service.dart';

class AvalancheBridgeTransaction extends BridgeTransaction {
  final String bridgeContract;
  final int nonce;
  final String sourceSubnet;

  const AvalancheBridgeTransaction({
    required this.bridgeContract,
    required this.nonce,
    required this.sourceSubnet,
    required String txHash,
    required String fromAddress,
    required String toAddress,
    required double amount,
    required int timestamp,
  }) : super(
          txHash: txHash,
          fromAddress: fromAddress,
          toAddress: toAddress,
          amount: amount,
          timestamp: timestamp,
        );

  @override
  Map<String, dynamic> toJson() {
    return {
      'bridgeContract': bridgeContract,
      'nonce': nonce,
      'sourceSubnet': sourceSubnet,
      'txHash': txHash,
      'fromAddress': fromAddress,
      'toAddress': toAddress,
      'amount': amount,
      'timestamp': timestamp,
    };
  }
}

class AvalancheInvestmentStats extends InvestmentStats {
  final double totalInvested;
  final double currentValue;

  AvalancheInvestmentStats({
    required this.totalInvested,
    required this.currentValue,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'totalInvested': totalInvested,
      'currentValue': currentValue,
    };
  }
}

class AvalancheStakingStats extends StakingStats {
  final double totalStaked;
  final double rewardsEarned;

  AvalancheStakingStats({
    required this.totalStaked,
    required this.rewardsEarned,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'totalStaked': totalStaked,
      'rewardsEarned': rewardsEarned,
    };
  }
}

class AvalancheNetworkStats {
  final int pChainHeight;
  final int xChainHeight;

  AvalancheNetworkStats({
    required this.pChainHeight,
    required this.xChainHeight,
  });
}
