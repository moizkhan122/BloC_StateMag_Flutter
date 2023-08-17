import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CubitExample/Screen3Cubit.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Screen 3",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body:  Center(child: BlocBuilder<Screen3Cubit, int>(
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
          BlocProvider.of<Screen3Cubit>(context).increment();
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}