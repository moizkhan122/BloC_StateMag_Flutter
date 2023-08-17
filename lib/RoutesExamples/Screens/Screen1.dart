import 'package:flutter/material.dart';
import 'package:flutter_application_1/RoutesExamples/CubitExample/Screen1Cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){

              Navigator.pushNamed(context, '/screen2',arguments: {
                'title' : 'Screen 2'
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(
              //   create: (context) => Screen2Cubit(),
              //   child:  Screen2(),
              // ),));
            }, 
            // ignore: prefer_const_constructors
            icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 25,))
        ],
        centerTitle: true,
        title: const Text(
          "Screen 1",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body:  Center(child: BlocBuilder<Screen1Cubit, int>(
        builder: (context, state) {
          return Text(
            state.toString(),
            style: const TextStyle(fontSize: 30, color: Colors.black),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          BlocProvider.of<Screen1Cubit>(context).increment();
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
