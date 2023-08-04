
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_1/InternetConnnection_Exampe/Bloc/InternetBloc/internet_event.dart';
import 'package:flutter_application_1/InternetConnnection_Exampe/Bloc/InternetBloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


    //this is complete internet Bloc

class InternetBloc extends Bloc<InternetEvent, InternetState>{

    //note when page is close bloc is also closed automatically
    //but connetivity will not close so for closing a connectivity we can create call override close function for 
    //and cancel the connectiity for better performinace
    //for cancellation we use StreamSubscription which is built In in connectivity

      // ignore: prefer_final_fields
      Connectivity _connectivity = Connectivity();
      StreamSubscription? connectivityStreamSubscription;

                  //supper keyword is for initializing the extended class
  InternetBloc() : super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));

    //listner
    connectivityStreamSubscription = _connectivity.onConnectivityChanged.listen((result) { 

        if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
          add(InternetGainEvent());
        }else{
          add(InternetLostEvent());
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