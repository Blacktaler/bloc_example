import 'package:bloc/bloc.dart';
import 'package:dars29/data/model/product_model.dart';
import 'package:dars29/data/services/api_manager.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
    on<SetActiveIndex>((event, emit) async{
      if(state is LoadBottomNavBar){
        final state = this.state as LoadBottomNavBar;
        
        emit(LoadBottomNavBar(event.currentIndex,state.counter,state.productsList));
      }
    });

    on<InitialIndex>((event, emit)async {
      await Future.delayed(Duration(seconds: 1));
      
      ProductsList products = await ApiManager.getProducts();

      emit(LoadBottomNavBar(0,0,products));
    });

    on<IncrementEvent>((event, emit) {
      final state = this.state as LoadBottomNavBar;

      emit(LoadBottomNavBar(state.activeIndex, state.counter+1,state.productsList));
    });

    on<DecrementEvent>((event, emit) {
      final state = this.state as LoadBottomNavBar;

      emit(LoadBottomNavBar(state.activeIndex, state.counter-1,state.productsList));
    });
  }
}
