import 'package:flutter/material.dart';
import 'package:flutter_application_1/Phone_Auth_Example_Firebase/Cubic_Phone_Auth/Cubic_Phone_Auth_State.dart';
import 'package:flutter_application_1/Phone_Auth_Example_Firebase/SignIn_Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubic_Phone_Auth/Cubic_Phone_Auth.dart';

class HomeScreenPhone extends StatelessWidget {
  const HomeScreenPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Screen"),
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Once we press on LogOut Botton our logout state will emit and close all screens and go on SignIn Screen",style: TextStyle(fontSize: 20,color: Colors.green),),
                
                const SizedBox(height: 50,),
                BlocConsumer<PhoneAUthCubit, Cubic_Phone_Auth_State>(
                  listener: (context, state) {
                if (state is PhoneAuthLogOutState) {
                        Navigator.popUntil(context, (route) => route.isFirst);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn_Screen(),));
                      }
                  },
                  builder: (context, state) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      BlocProvider.of<PhoneAUthCubit>(context).signOut();
                    },
                    child: const Center(
                      child: Text(
                        "LogOut",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
