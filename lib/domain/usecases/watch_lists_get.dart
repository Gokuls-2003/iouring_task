import 'package:iouring_task/domain/repo/repo_watchlist.dart';

class GetWatchlists {
  final WatchlistRepository repository;

  GetWatchlists(this.repository);

  List execute() {
    return repository.getWatchlists();
  }
}
