import 'package:dars29/bloc/bottom_nav_bar_bloc.dart';
import 'package:dars29/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => BottomNavBarBloc()..add(InitialIndex()))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}
