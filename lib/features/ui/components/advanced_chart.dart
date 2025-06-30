import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

/// Advanced Chart Component for displaying financial data
class AdvancedChart extends StatefulWidget {
  final List<ChartDataPoint> data;
  final ChartType type;
  final String title;
  final String? subtitle;
  final Color? primaryColor;
  final Color? secondaryColor;
  final bool showGrid;
  final bool showLegend;
  final bool interactive;
  final Function(ChartDataPoint)? onPointTapped;
  final Duration? animationDuration;

  const AdvancedChart({
    Key? key,
    required this.data,
    required this.type,
    required this.title,
    this.subtitle,
    this.primaryColor,
    this.secondaryColor,
    this.showGrid = true,
    this.showLegend = true,
    this.interactive = true,
    this.onPointTapped,
    this.animationDuration,
  }) : super(key: key);

  @override
  State<AdvancedChart> createState() => _AdvancedChartState();
}

class _AdvancedChartState extends State<AdvancedChart>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  ChartDataPoint? _selectedPoint;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration ?? const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildChart(),
          if (widget.showLegend) ...[
            const SizedBox(height: 16),
            _buildLegend(),
          ],
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (widget.subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildChart() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          height: 300,
          child: _buildChartWidget(),
        );
      },
    );
  }

  Widget _buildChartWidget() {
    switch (widget.type) {
      case ChartType.line:
        return _buildLineChart();
      case ChartType.area:
        return _buildAreaChart();
      case ChartType.bar:
        return _buildBarChart();
      case ChartType.candlestick:
        return _buildCandlestickChart();
      case ChartType.pie:
        return _buildPieChart();
      default:
        return _buildLineChart();
    }
  }

  Widget _buildLineChart() {
    final color = widget.primaryColor ?? Theme.of(context).primaryColor;
    
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: widget.showGrid,
          drawVerticalLine: true,
          horizontalInterval: _getHorizontalInterval(),
          verticalInterval: _getVerticalInterval(),
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey[300]!,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey[300]!,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: _getBottomInterval(),
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    _formatBottomTitle(value),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: _getLeftInterval(),
              getTitlesWidget: (value, meta) {
                return Text(
                  _formatLeftTitle(value),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              },
              reservedSize: 42,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey[300]!),
        ),
        minX: 0,
        maxX: (widget.data.length - 1).toDouble(),
        minY: _getMinY(),
        maxY: _getMaxY(),
        lineBarsData: [
          LineChartBarData(
            spots: _getLineSpots(),
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.8),
                color.withOpacity(0.3),
              ],
            ),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: widget.interactive,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: color,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.3),
                  color.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: widget.interactive,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey[800]!,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                final point = widget.data[touchedSpot.x.toInt()];
                return LineTooltipItem(
                  '${point.label}\n${_formatValue(point.value)}',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
          ),
          handleBuiltInTouches: true,
        ),
      ),
    );
  }

  Widget _buildAreaChart() {
    final color = widget.primaryColor ?? Theme.of(context).primaryColor;
    
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: widget.showGrid),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: (widget.data.length - 1).toDouble(),
        minY: _getMinY(),
        maxY: _getMaxY(),
        lineBarsData: [
          LineChartBarData(
            spots: _getLineSpots(),
            isCurved: true,
            color: color,
            barWidth: 0,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.8),
                  color.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    final color = widget.primaryColor ?? Theme.of(context).primaryColor;
    
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: _getMaxY(),
        barTouchData: BarTouchData(
          enabled: widget.interactive,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey[800]!,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              final point = widget.data[group.x.toInt()];
              return BarTooltipItem(
                '${point.label}\n${_formatValue(point.value)}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final point = widget.data[value.toInt()];
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    point.label,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  _formatLeftTitle(value),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey[300]!),
        ),
        barGroups: _getBarGroups(color),
        gridData: FlGridData(show: widget.showGrid),
      ),
    );
  }

  Widget _buildCandlestickChart() {
    // Simplified candlestick chart - would need more complex implementation
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Candlestick Chart\n(Implementation needed)',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildPieChart() {
    final colors = [
      widget.primaryColor ?? Theme.of(context).primaryColor,
      widget.secondaryColor ?? Colors.orange,
      Colors.green,
      Colors.red,
      Colors.purple,
    ];

    return PieChart(
      PieChartData(
        pieTouchData: PieTouchData(
          enabled: widget.interactive,
          touchCallback: (FlTouchEvent event, pieTouchResponse) {
            if (pieTouchResponse?.touchedSection != null) {
              final section = pieTouchResponse!.touchedSection!;
              final point = widget.data[section.touchedSectionIndex];
              setState(() {
                _selectedPoint = point;
              });
              widget.onPointTapped?.call(point);
            }
          },
        ),
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: _getPieSections(colors),
      ),
    );
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: widget.data.map((point) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: widget.primaryColor ?? Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              point.label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  // Helper methods
  List<FlSpot> _getLineSpots() {
    return widget.data.asMap().entries.map((entry) {
      final index = entry.key;
      final point = entry.value;
      return FlSpot(
        index.toDouble(),
        point.value * _animation.value,
      );
    }).toList();
  }

  List<BarChartGroupData> _getBarGroups(Color color) {
    return widget.data.asMap().entries.map((entry) {
      final index = entry.key;
      final point = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: point.value * _animation.value,
            color: color,
            width: 20,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      );
    }).toList();
  }

  List<PieChartSectionData> _getPieSections(List<Color> colors) {
    final total = widget.data.fold<double>(0, (sum, point) => sum + point.value);
    
    return widget.data.asMap().entries.map((entry) {
      final index = entry.key;
      final point = entry.value;
      final percentage = total > 0 ? (point.value / total) * 100 : 0;
      
      return PieChartSectionData(
        color: colors[index % colors.length],
        value: point.value * _animation.value,
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 100,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  double _getMinY() {
    if (widget.data.isEmpty) return 0;
    final minValue = widget.data.map((e) => e.value).reduce(math.min);
    return minValue * 0.9;
  }

  double _getMaxY() {
    if (widget.data.isEmpty) return 100;
    final maxValue = widget.data.map((e) => e.value).reduce(math.max);
    return maxValue * 1.1;
  }

  double _getHorizontalInterval() {
    final range = _getMaxY() - _getMinY();
    return range / 5;
  }

  double _getVerticalInterval() {
    return (widget.data.length - 1) / 5;
  }

  double _getLeftInterval() {
    final range = _getMaxY() - _getMinY();
    return range / 5;
  }

  double _getBottomInterval() {
    return (widget.data.length - 1) / 5;
  }

  String _formatBottomTitle(double value) {
    final index = value.toInt();
    if (index >= 0 && index < widget.data.length) {
      return widget.data[index].label;
    }
    return '';
  }

  String _formatLeftTitle(double value) {
    return _formatValue(value);
  }

  String _formatValue(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)}K';
    } else {
      return value.toStringAsFixed(2);
    }
  }
}

/// Chart Data Point
class ChartDataPoint {
  final String label;
  final double value;
  final DateTime? timestamp;
  final Map<String, dynamic>? metadata;

  ChartDataPoint({
    required this.label,
    required this.value,
    this.timestamp,
    this.metadata,
  });
}

/// Chart Types
enum ChartType {
  line,
  area,
  bar,
  candlestick,
  pie,
} 