part of 'bottom_nav_bar_bloc.dart';

@immutable
abstract class BottomNavBarEvent {}

class SetActiveIndex extends BottomNavBarEvent{
  int currentIndex;
  SetActiveIndex(this.currentIndex);
}


class IncrementEvent extends BottomNavBarEvent{}

class DecrementEvent extends BottomNavBarEvent{}

class InitialIndex extends BottomNavBarEvent{}

