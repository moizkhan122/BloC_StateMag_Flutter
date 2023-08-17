import 'package:flutter/material.dart';
import 'package:flutter_application_1/RoutesExamples/Screens/Screen3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CubitExample/Screen2Cubit.dart';
import '../CubitExample/Screen3Cubit.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key,required this.titlee});

  final String titlee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(
                create: (context) => Screen3Cubit(),
                child: const Screen3(),
              ),));
            }, 
            // ignore: prefer_const_constructors
            icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 25,))
        ],
        centerTitle: true,
        title:  Text(
          titlee,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body:  SafeArea(
        child: Center(
          child: BlocBuilder<Screen2Cubit, int>(
          builder: (context, state) {
            return Text(
              state.toString(),
              style: const TextStyle(fontSize: 30, color: Colors.black),
            );
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          BlocProvider.of<Screen2Cubit>(context).increment();
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}