import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth_Example/Auth_Screen.dart';
// import 'package:flutter_application_1/InternetConnnection_Exampe/Bloc/InternetCubit/InternetCubit.dart';
// import 'package:flutter_application_1/InternetConnnection_Exampe/HomeScreen/HomeScreen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   AuthScreen(),
    );
  }
}
/** */


/**
 * //internet Bloc Example
 * BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    ),
    ); */
