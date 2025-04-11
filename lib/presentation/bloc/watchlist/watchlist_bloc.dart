import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/watch_lists_get.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlists getWatchlists;

  WatchlistBloc(this.getWatchlists) : super(WatchlistInitial()) {
    on<LoadWatchlists>(_onLoadWatchlists);
    on<ChangeWatchlistTab>(_onChangeWatchlistTab);
  }

  void _onLoadWatchlists(LoadWatchlists event, Emitter<WatchlistState> emit) {
    emit(WatchlistLoading());
    try {
      final List watchlists = getWatchlists.execute();
      if (watchlists.isNotEmpty) {
        emit(
          WatchlistLoaded(
            watchlists: watchlists,
            selectedTabIndex: 0,
            currentWatchlist: watchlists[0],
          ),
        );
      } else {
        emit(const WatchlistError('No watchlists found'));
      }
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  void _onChangeWatchlistTab(
    ChangeWatchlistTab event,
    Emitter<WatchlistState> emit,
  ) {
    if (state is WatchlistLoaded) {
      final currentState = state as WatchlistLoaded;
      emit(
        WatchlistLoaded(
          watchlists: currentState.watchlists,
          selectedTabIndex: event.index,
          currentWatchlist: currentState.watchlists[event.index],
        ),
      );
    }
  }
}
