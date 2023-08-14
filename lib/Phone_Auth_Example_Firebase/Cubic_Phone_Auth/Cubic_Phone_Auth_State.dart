// ignore: camel_case_types
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
abstract class Cubic_Phone_Auth_State {}

class PhoneAuthInitialState extends Cubic_Phone_Auth_State {}

class PhoneAuthLoadingState extends Cubic_Phone_Auth_State {}

class PhoneAuthCodeSentState extends Cubic_Phone_Auth_State {}

class PhoneAuthCodeVerifyState extends Cubic_Phone_Auth_State {}

class PhoneAuthLogInState extends Cubic_Phone_Auth_State {
  final User firebaseUser;

  PhoneAuthLogInState(this.firebaseUser);
}

class PhoneAuthLogOutState extends Cubic_Phone_Auth_State {}

class PhoneAuthErrorState extends Cubic_Phone_Auth_State {
  final String errormessage;

  PhoneAuthErrorState(this.errormessage);
}