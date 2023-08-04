

//enum is define if our class is empty there is no data in it so we create enum for file saving
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { Initail, Gain, Lost}

class InternetCubit extends Cubit<InternetState> {
      //note when page is close bloc is also closed automatically
    //but connetivity will not close so for closing a connectivity we can create call override close function for 
    //and cancel the connectiity for better performinace
    //for cancellation we use StreamSubscription which is built In in connectivity

      // ignore: prefer_final_fields
      Connectivity _connectivity = Connectivity();
      StreamSubscription? connectivityStreamSubscription;

                  //supper keyword is for initializing the extended class
  InternetCubit() : super(InternetState.Initail){

    //listner
    connectivityStreamSubscription = _connectivity.onConnectivityChanged.listen((result) { 

        if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
          emit(InternetState.Gain);
        }else{
          emit(InternetState.Lost);
        }
    });
  }

  @override
  Future<void> close() {
    // TODO: implement close
    //this will cancle the connectivity listner 
    connectivityStreamSubscription?.cancel();
    return super.close();
  }
}