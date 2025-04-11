import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final String symbol;
  final String name;
  final String exchange;
  final double price;
  final double change;
  final double changePercentage;
  final bool isUp;
  final int? lotSize;

  const Stock({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.price,
    required this.change,
    required this.changePercentage,
    required this.isUp,
    this.lotSize,
  });

  @override
  List get props => [
    symbol,
    exchange,
    price,
    change,
    changePercentage,
    isUp,
    lotSize,
  ];
}
