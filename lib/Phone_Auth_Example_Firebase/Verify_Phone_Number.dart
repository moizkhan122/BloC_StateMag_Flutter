import 'package:flutter/material.dart';
import 'package:flutter_application_1/Phone_Auth_Example_Firebase/Cubic_Phone_Auth/Cubic_Phone_Auth.dart';
import 'package:flutter_application_1/Phone_Auth_Example_Firebase/Cubic_Phone_Auth/Cubic_Phone_Auth_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeScreem.dart';

// ignore: camel_case_types
class Verify_Phone_Number extends StatelessWidget {
  Verify_Phone_Number({super.key});

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: otpController,
              decoration: const InputDecoration(
                  hintText: "6 Digit OTP....",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10, color: Colors.green))),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<PhoneAUthCubit, Cubic_Phone_Auth_State>(
              listener: (context, state) {
                if (state is PhoneAuthLogInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreenPhone(),));
                }else if(state is PhoneAuthErrorState){
                  ScaffoldMessenger.of(context).
                  showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.errormessage.toString(),style: const TextStyle(color: Colors.white,fontSize: 18),),
                      duration: const Duration(milliseconds: 2000),
                      ));
                }
              },
              builder: (context, state) {
                if (state is PhoneAuthLoadingState) {
                  return const Center(child: CircularProgressIndicator(color: Colors.black,),);
                }
                return ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      BlocProvider.of<PhoneAUthCubit>(context).verifyOTP(otpController.text);
                    },
                    child: const Center(
                      child: Text(
                        "verify",
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
