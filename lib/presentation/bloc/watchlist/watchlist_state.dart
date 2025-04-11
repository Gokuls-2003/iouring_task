import 'package:equatable/equatable.dart';

import '../../../domain/entites/watchlist.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List get props => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List watchlists;
  final int selectedTabIndex;
  final Watchlist currentWatchlist;

  const WatchlistLoaded({
    required this.watchlists,
    required this.selectedTabIndex,
    required this.currentWatchlist,
  });

  @override
  List get props => [watchlists, selectedTabIndex, currentWatchlist];
}

class WatchlistError extends WatchlistState {
  final String message;

  const WatchlistError(this.message);

  @override
  List get props => [message];
}
