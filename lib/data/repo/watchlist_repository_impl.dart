import 'package:iouring_task/domain/repo/repo_watchlist.dart';

import '../models/stock_model.dart';
import '../models/watchlist_model.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  @override
  List getWatchlists() {
    return [
      WatchlistModel(
        name: 'NIFTY',
        stocks: [
          StockModel(
            symbol: 'GOLD 26JUL 59500 CE',
            name: 'GOLD ETF',
            exchange: 'MCX',
            price: 59500.0,
            change: 298.50,
            changePercentage: 8.54,
            isUp: true,
          ),
          StockModel(
            symbol: 'ACCELYA',
            name: 'ACCELYA',
            exchange: 'NSE',
            price: 1337.70,
            change: 1.05,
            changePercentage: 0.07,
            isUp: true,
          ),
          StockModel(
            symbol: 'ACC',
            name: 'ACC',
            exchange: 'BSE',
            price: 1795.20,
            change: 27.20,
            changePercentage: 1.53,
            isUp: true,
            lotSize: 400,
          ),
          StockModel(
            symbol: 'ACC',
            name: 'ACC',
            exchange: 'NSE',
            price: 1792.30,
            change: 25.40,
            changePercentage: 1.43,
            isUp: true,
            lotSize: 400,
          ),
        ],
      ),
      WatchlistModel(
        name: 'BANKNIFTY',
        stocks: [
          StockModel(
            symbol: 'HDFCBANK',
            name: 'HDFCBANK',
            exchange: 'NSE',
            price: 1658.75,
            change: -5.20,
            changePercentage: -0.31,
            isUp: false,
          ),
          StockModel(
            symbol: 'ICICIBANK',
            name: 'ICICIBANK',
            exchange: 'NSE',
            price: 1023.80,
            change: 2.15,
            changePercentage: 0.21,
            isUp: true,
          ),
        ],
      ),
      WatchlistModel(
        name: 'SENSEX',
        stocks: [
          StockModel(
            symbol: 'RELIANCE',
            name: 'RELIANCE',
            exchange: 'BSE',
            price: 2876.30,
            change: 12.50,
            changePercentage: 0.44,
            isUp: true,
          ),
          StockModel(
            symbol: 'TCS',
            name: 'TCS',
            exchange: 'BSE',
            price: 3543.75,
            change: -15.35,
            changePercentage: -0.43,
            isUp: false,
          ),
        ],
      ),
    ];
  }
}
