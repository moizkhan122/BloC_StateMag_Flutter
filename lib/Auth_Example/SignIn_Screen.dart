import 'package:flutter/material.dart';
import 'package:flutter_application_1/Auth_Example/SignInBloc/SignInBloc.dart';
import 'package:flutter_application_1/Auth_Example/SignInBloc/SignInBloc_Event.dart';
import 'package:flutter_application_1/Auth_Example/SignInBloc/SignInBloc_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWithEmail extends StatelessWidget {
   SignInWithEmail({super.key});

  final emailvalue = TextEditingController();
  final passwordvalue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
              child: Text(
            "Sign In With Email",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.black),
          )),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInErrorState) {
                      return Text(
                        state.errormessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20, color: Colors.red),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  height: 2
                ),
                TextFormField(
                  controller: emailvalue,
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInChangedValueEvent(emailvalue.text.toString(), passwordvalue.text.toString())
                    );
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 10, color: Colors.green))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordvalue,
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                      SignInChangedValueEvent(emailvalue.text.toString(), passwordvalue.text.toString())
                    );
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 10, color: Colors.green))),
                ),
                const SizedBox(
                  height: 25,
                ),
                
                // if valid state so green color else grey color
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:state is SignInValidState ?Colors.green :Colors.grey),
                        onPressed: () {
                          if (state is SignInValidState) {
                            BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmitValueEvent(emailvalue.text.toString(), passwordvalue.text.toString())
                          );
                          }
                        },
                        child: const Center(
                          child: Text(
                            "SignIn  Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
