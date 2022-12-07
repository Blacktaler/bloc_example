import 'package:dars29/bloc/bottom_nav_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomBloc =context.read<BottomNavBarBloc>();

    return BlocBuilder<BottomNavBarBloc,BottomNavBarState>(builder: (context,state){
      if(state is LoadBottomNavBar){
        return scaffold(state, bottomBloc);
      }else if(state is BottomNavBarInitial){
        return Center(child: CircularProgressIndicator(),);
      }else{
        return Text("sometin wrong");
      }
    });
  }

  Widget scaffold(LoadBottomNavBar state, BottomNavBarBloc bottomBloc) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(onPressed: (){
            bottomBloc.add(IncrementEvent());
          },child: Icon(Icons.add),),
          FloatingActionButton(onPressed: (){
            bottomBloc.add(DecrementEvent());
          },child: Icon(Icons.remove),),
        ],
      ),
      body: ListView.builder(
        itemCount: state.productsList.products.length,
        itemBuilder: (_,__){
        final product = state.productsList.products[__];
        return ListTile(
          title: Text(product.title!),
          subtitle: Text(product.description!),
        );
      }),
    
      appBar: AppBar(
      title:  Text("counter: ${state.counter}"),
    ),

    bottomNavigationBar:  BottomNavigationBar(
      currentIndex: state.activeIndex,

      onTap: (currentIndex){
        bottomBloc.add(SetActiveIndex(currentIndex));
      },
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.search),label: ''),
      BottomNavigationBarItem(icon: Icon(Icons.people),label: ''),
    ])
  );
  }
}