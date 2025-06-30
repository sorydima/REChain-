import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

/// Price Ticker Component
class PriceTicker extends StatefulWidget {
  final List<PriceData> prices;
  final bool autoScroll;
  final Duration scrollDuration;
  final Duration updateInterval;
  final VoidCallback? onPriceTap;
  final bool showChange;
  final bool showVolume;

  const PriceTicker({
    Key? key,
    required this.prices,
    this.autoScroll = true,
    this.scrollDuration = const Duration(seconds: 30),
    this.updateInterval = const Duration(seconds: 5),
    this.onPriceTap,
    this.showChange = true,
    this.showVolume = true,
  }) : super(key: key);

  @override
  State<PriceTicker> createState() => _PriceTickerState();
}

class _PriceTickerState extends State<PriceTicker>
    with TickerProviderStateMixin {
  late AnimationController _scrollController;
  late AnimationController _updateController;
  late ScrollController _scrollController2;
  Timer? _updateTimer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    
    _scrollController = AnimationController(
      duration: widget.scrollDuration,
      vsync: this,
    );
    
    _updateController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    
    _scrollController2 = ScrollController();
    
    if (widget.autoScroll && widget.prices.length > 1) {
      _startAutoScroll();
    }
    
    _startPriceUpdates();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _updateController.dispose();
    _scrollController2.dispose();
    _updateTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          _buildScrollButton(Icons.chevron_left, _scrollLeft),
          Expanded(
            child: _buildTickerList(),
          ),
          _buildScrollButton(Icons.chevron_right, _scrollRight),
        ],
      ),
    );
  }

  Widget _buildScrollButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        color: Colors.transparent,
        child: Icon(
          icon,
          color: Colors.grey[600],
          size: 20,
        ),
      ),
    );
  }

  Widget _buildTickerList() {
    return ListView.builder(
      controller: _scrollController2,
      scrollDirection: Axis.horizontal,
      itemCount: widget.prices.length,
      itemBuilder: (context, index) {
        final price = widget.prices[index];
        return _buildPriceItem(price, index);
      },
    );
  }

  Widget _buildPriceItem(PriceData price, int index) {
    final isSelected = index == _currentIndex;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        widget.onPriceTap?.call();
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected 
            ? Theme.of(context).primaryColor.withOpacity(0.1)
            : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected 
              ? Theme.of(context).primaryColor
              : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSymbol(price),
                _buildPrice(price),
              ],
            ),
            if (widget.showChange || widget.showVolume) ...[
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (widget.showChange) _buildChange(price),
                  if (widget.showVolume) _buildVolume(price),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSymbol(PriceData price) {
    return Row(
      children: [
        if (price.icon != null) ...[
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: price.icon!,
          ),
          const SizedBox(width: 4),
        ],
        Text(
          price.symbol,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildPrice(PriceData price) {
    return AnimatedBuilder(
      animation: _updateController,
      builder: (context, child) {
        final animatedPrice = price.price + 
          (price.priceChange * _updateController.value);
        
        return Text(
          '\$${_formatPrice(animatedPrice)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        );
      },
    );
  }

  Widget _buildChange(PriceData price) {
    final isPositive = price.priceChange >= 0;
    final color = isPositive ? Colors.green : Colors.red;
    final icon = isPositive ? Icons.trending_up : Icons.trending_down;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 12,
          color: color,
        ),
        const SizedBox(width: 2),
        Text(
          '${isPositive ? '+' : ''}${price.priceChangePercent.toStringAsFixed(2)}%',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildVolume(PriceData price) {
    return Text(
      'Vol: ${_formatVolume(price.volume)}',
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 11,
      ),
    );
  }

  // Helper methods
  void _startAutoScroll() {
    _scrollController.repeat();
    _scrollController.addListener(() {
      if (widget.prices.length > 1) {
        final progress = _scrollController.value;
        final targetIndex = (progress * widget.prices.length).floor();
        if (targetIndex != _currentIndex && targetIndex < widget.prices.length) {
          setState(() {
            _currentIndex = targetIndex;
          });
          _scrollToIndex(targetIndex);
        }
      }
    });
  }

  void _startPriceUpdates() {
    _updateTimer = Timer.periodic(widget.updateInterval, (timer) {
      _updateController.forward(from: 0);
    });
  }

  void _scrollLeft() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _scrollToIndex(_currentIndex);
    }
  }

  void _scrollRight() {
    if (_currentIndex < widget.prices.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _scrollToIndex(_currentIndex);
    }
  }

  void _scrollToIndex(int index) {
    if (_scrollController2.hasClients) {
      _scrollController2.animateTo(
        index * 216.0, // 200 width + 16 margin
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  String _formatPrice(double price) {
    if (price >= 1000) {
      return price.toStringAsFixed(2);
    } else if (price >= 1) {
      return price.toStringAsFixed(4);
    } else {
      return price.toStringAsFixed(6);
    }
  }

  String _formatVolume(double volume) {
    if (volume >= 1000000000) {
      return '${(volume / 1000000000).toStringAsFixed(1)}B';
    } else if (volume >= 1000000) {
      return '${(volume / 1000000).toStringAsFixed(1)}M';
    } else if (volume >= 1000) {
      return '${(volume / 1000).toStringAsFixed(1)}K';
    } else {
      return volume.toStringAsFixed(0);
    }
  }
}

/// Price Data Model
class PriceData {
  final String symbol;
  final String name;
  final double price;
  final double priceChange;
  final double priceChangePercent;
  final double volume;
  final double marketCap;
  final Widget? icon;
  final DateTime lastUpdated;

  PriceData({
    required this.symbol,
    required this.name,
    required this.price,
    required this.priceChange,
    required this.priceChangePercent,
    required this.volume,
    required this.marketCap,
    this.icon,
    required this.lastUpdated,
  });

  /// Create a copy with updated values
  PriceData copyWith({
    String? symbol,
    String? name,
    double? price,
    double? priceChange,
    double? priceChangePercent,
    double? volume,
    double? marketCap,
    Widget? icon,
    DateTime? lastUpdated,
  }) {
    return PriceData(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      price: price ?? this.price,
      priceChange: priceChange ?? this.priceChange,
      priceChangePercent: priceChangePercent ?? this.priceChangePercent,
      volume: volume ?? this.volume,
      marketCap: marketCap ?? this.marketCap,
      icon: icon ?? this.icon,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

/// Price Ticker Service
class PriceTickerService {
  static final PriceTickerService _instance = PriceTickerService._internal();
  factory PriceTickerService() => _instance;
  PriceTickerService._internal();

  final StreamController<List<PriceData>> _priceController = 
      StreamController<List<PriceData>>.broadcast();
  
  Timer? _updateTimer;
  List<PriceData> _currentPrices = [];

  /// Get price stream
  Stream<List<PriceData>> get priceStream => _priceController.stream;

  /// Get current prices
  List<PriceData> get currentPrices => List.unmodifiable(_currentPrices);

  /// Start price updates
  void startUpdates({Duration interval = const Duration(seconds: 5)}) {
    _updateTimer?.cancel();
    _updateTimer = Timer.periodic(interval, (timer) {
      _updatePrices();
    });
  }

  /// Stop price updates
  void stopUpdates() {
    _updateTimer?.cancel();
  }

  /// Update prices (mock implementation)
  void _updatePrices() {
    // Mock price updates - in real app, would fetch from API
    final updatedPrices = _currentPrices.map((price) {
      final change = (math.Random().nextDouble() - 0.5) * 0.1; // ±5% change
      final newPrice = price.price * (1 + change);
      final newChange = newPrice - price.price;
      final newChangePercent = (newChange / price.price) * 100;
      
      return price.copyWith(
        price: newPrice,
        priceChange: newChange,
        priceChangePercent: newChangePercent,
        lastUpdated: DateTime.now(),
      );
    }).toList();

    _currentPrices = updatedPrices;
    _priceController.add(updatedPrices);
  }

  /// Set initial prices
  void setPrices(List<PriceData> prices) {
    _currentPrices = prices;
    _priceController.add(prices);
  }

  /// Dispose resources
  void dispose() {
    _updateTimer?.cancel();
    _priceController.close();
  }
} 