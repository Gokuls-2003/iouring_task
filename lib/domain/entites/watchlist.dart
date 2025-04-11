import 'package:equatable/equatable.dart';

class Watchlist extends Equatable {
  final String name;
  final List stocks;

  const Watchlist({required this.name, required this.stocks});

  @override
  List get props => [name, stocks];
}
