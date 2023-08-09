
import 'package:email_validator/email_validator.dart';
import 'package:flutter_application_1/Auth_Example/SignInBloc/SignInBloc_Event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SignInBloc_State.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    //this on function is like kay knse event pr kea km hoga

    on<SignInChangedValueEvent>((event, emit) {
     if ( EmailValidator.validate(event.emailValue) == false) {
       emit(SignInErrorState("Email is InValid"));
     }else if(event.passValue.length < 8){
       emit(SignInErrorState("Password length should be more than 7"));
     }else{
      emit(SignInValidState());
     }
    });

    on<SignInSubmitValueEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}