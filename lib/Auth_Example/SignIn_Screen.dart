import 'package:flutter/material.dart';

class SignInWithEmail extends StatelessWidget {
  const SignInWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50,),
            const Center(child: Text("Sign In With Email",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.black),)),
            const SizedBox(height: 30,),
           
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text("Error will be show up here",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.red),),
            const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(width: 10,color: Colors.green))
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(width: 10,color: Colors.green))
                    ),
                  ),
                  const SizedBox(height: 25,),
                  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green),
              onPressed: (){}, 
              child: const Center(child: Text("SignIn  Email",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.black),),)),
                ],
              ),
            ),
          ],)),
    );
  }
}