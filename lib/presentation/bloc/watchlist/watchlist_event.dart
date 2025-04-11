import 'package:equatable/equatable.dart';

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List get props => [];
}

class LoadWatchlists extends WatchlistEvent {}

class ChangeWatchlistTab extends WatchlistEvent {
  final int index;

  const ChangeWatchlistTab(this.index);

  @override
  List get props => [index];
}
