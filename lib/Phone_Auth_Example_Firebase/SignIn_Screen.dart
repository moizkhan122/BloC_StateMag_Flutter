import 'package:flutter/material.dart';
import 'package:flutter_application_1/Phone_Auth_Example_Firebase/Cubic_Phone_Auth/Cubic_Phone_Auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubic_Phone_Auth/Cubic_Phone_Auth_State.dart';
import 'Verify_Phone_Number.dart';

// ignore: camel_case_types
class SignIn_Screen extends StatelessWidget {
  SignIn_Screen({super.key});

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Phone Number Authentication App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                  hintText: "Phone Number Here....",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.green))),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<PhoneAUthCubit, Cubic_Phone_Auth_State>(
              listener: (context, state) {
                if (state is PhoneAuthCodeSentState) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Verify_Phone_Number(),));
                }
              },
              builder: (context, state) {
                if (state is PhoneAuthLoadingState) {
                  return const Center(child: CircularProgressIndicator(color: Colors.black,),);
                }
                return ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      String phoneNumber = '+92${phoneController.text}';
                      BlocProvider.of<PhoneAUthCubit>(context).sendOTP(phoneNumber);
                    },
                    child: const Center(
                      child: Text(
                        "SignIn",
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
