import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth_Example/SignIn_Screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Authentication Example",textAlign: TextAlign.center,style: TextStyle(fontSize: 40,color: Colors.black),),
            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInWithEmail(),));
              }, 
              child: const Center(child: Text("Sign In with Email",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),)),
              const SizedBox(height: 10,),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green),
              onPressed: (){}, 
              child: const Center(child: Text("Sign In with Google",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),))
          ],)),
    );
  }
}