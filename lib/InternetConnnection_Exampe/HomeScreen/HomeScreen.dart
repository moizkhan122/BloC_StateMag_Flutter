import 'package:flutter/material.dart';
import 'package:flutter_application_1/InternetConnnection_Exampe/Bloc/InternetCubit/InternetCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      // BlocBuilder it is use for built a UI in screen
      //bloc listner is use for performing a background task
      //to performing a task like navigation/showing snackbar etc
      //but for performing a both task we use BlocConsumer
      child: BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          //this is for InternetCubit
            if (state == InternetState.Gain) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Connected",style: TextStyle(fontSize: 40,color: Colors.black)),
                    backgroundColor: Colors.green,
                    ));
             } else if(state == InternetState.Lost){
               ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Not Connected",style: TextStyle(fontSize: 40,color: Colors.black)),
                    backgroundColor: Colors.red,
                    ));
             }else{
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Loading",style: TextStyle(fontSize: 40,color: Colors.black)),
                    backgroundColor: Colors.grey,
                    ));
             }
        },
        builder: (context, state) {
          if (state == InternetState.Gain) {
               return const Text("Connected",style: TextStyle(fontSize: 40,color: Colors.black));
             } else if(state == InternetState.Lost){
               return const Text("Not Connected",style: TextStyle(fontSize: 40,color: Colors.black));
             }else{
              return const Text("Loading",style: TextStyle(fontSize: 40,color: Colors.black));
             }
        },
      )
    )));
  }
}
//uper wala InternetCubit kalea jo kay kaam asaan krha h line of code bacha rha h
//this is for InternetBloc
/*BlocConsumer<InternetBloc, InternetState>(
        listener: (context, state) {
          if (state is InternetGainState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Connected",style: TextStyle(fontSize: 40,color: Colors.black)),
                    backgroundColor: Colors.green,
                    ));
             } else if(state is InternetLostState){
               ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Not Connected",style: TextStyle(fontSize: 40,color: Colors.black)),
                    backgroundColor: Colors.red,
                    ));
             }else{
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Loading",style: TextStyle(fontSize: 40,color: Colors.black)),
                    backgroundColor: Colors.grey,
                    ));
             }
        },
        builder: (context, state) {
          if (state is InternetGainState) {
               return const Text("Connected",style: TextStyle(fontSize: 40,color: Colors.black));
             } else if(state is InternetLostState){
               return const Text("Not Connected",style: TextStyle(fontSize: 40,color: Colors.black));
             }else{
              return const Text("Loading",style: TextStyle(fontSize: 40,color: Colors.black));
             }
        },
      ),* */