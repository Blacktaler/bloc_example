part of 'bottom_nav_bar_bloc.dart';

@immutable
abstract class BottomNavBarState {}

class BottomNavBarInitial extends BottomNavBarState {}

class LoadBottomNavBar extends BottomNavBarState{
  int activeIndex;
  int counter;
  ProductsList productsList;
  LoadBottomNavBar(this.activeIndex,this.counter,this.productsList);
}