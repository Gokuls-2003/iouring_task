import '../../domain/entites/watchlist.dart';
import 'stock_model.dart';

class WatchlistModel extends Watchlist {
  const WatchlistModel({required super.name, required super.stocks});

  factory WatchlistModel.fromJson(Map json) {
    List stocks =
        (json['stocks'] as List)
            .map((stock) => StockModel.fromJson(stock))
            .toList();

    return WatchlistModel(name: json['name'], stocks: stocks);
  }
}
