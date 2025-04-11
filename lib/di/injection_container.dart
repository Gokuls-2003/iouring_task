import 'package:get_it/get_it.dart';
import 'package:iouring_task/data/repo/watchlist_repository_impl.dart';
import 'package:iouring_task/domain/repo/repo_watchlist.dart'
    show WatchlistRepository;
import 'package:iouring_task/domain/usecases/watch_lists_get.dart'
    show GetWatchlists;
import 'package:iouring_task/presentation/bloc/nav/navigation_bloc.dart'
    show NavigationBloc;

import '../presentation/bloc/watchlist/watchlist_bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  sl.registerFactory<NavigationBloc>(() => NavigationBloc());
  sl.registerFactory<WatchlistBloc>(() => WatchlistBloc(sl<GetWatchlists>()));

  sl.registerLazySingleton<GetWatchlists>(
    () => GetWatchlists(sl<WatchlistRepository>()),
  );

  sl.registerLazySingleton<WatchlistRepository>(
    () => WatchlistRepositoryImpl(),
  );
}
