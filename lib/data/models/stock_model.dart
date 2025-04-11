import '../../domain/entites/stock.dart';

class StockModel extends Stock {
  const StockModel({
    required super.symbol,
    required super.name,
    required super.exchange,
    required super.price,
    required super.change,
    required super.changePercentage,
    required super.isUp,
    super.lotSize,
  });

  factory StockModel.fromJson(Map json) {
    return StockModel(
      symbol: json['symbol'],
      name: json['name'],
      exchange: json['exchange'],
      price: json['price'].toDouble(),
      change: json['change'].toDouble(),
      changePercentage: json['changePercentage'].toDouble(),
      isUp: json['isUp'],
      lotSize: json['lotSize'],
    );
  }
}
