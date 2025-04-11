import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final int index;

  const NavigationState({required this.index});

  @override
  List get props => [index];
}
