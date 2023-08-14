
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Phone_Auth_Example_Firebase/Cubic_Phone_Auth/Cubic_Phone_Auth_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAUthCubit extends Cubit<Cubic_Phone_Auth_State> {

  //if we want to use Bloc here so just replace our functions with events and replaced call with add jxt thats it


  final FirebaseAuth _auth = FirebaseAuth.instance;
  PhoneAUthCubit() : super(PhoneAuthInitialState()){
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      //logged In
      emit(PhoneAuthLogInState(currentUser));
    } else {
      //logOut
      emit(PhoneAuthLogOutState());
    } 
  }

  // ignore: unused_field
  String? _verificationIdd;

  void sendOTP(String phoneNumber)async{
    emit(PhoneAuthLoadingState());
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted:(phoneAuthCredential){
        signInWithPhone(phoneAuthCredential);
      }, 
      verificationFailed:(error){
        emit(PhoneAuthErrorState(error.message.toString()));
      }, 
      codeSent: (verificationId, forceResendingError){
        _verificationIdd = verificationId;
        emit(PhoneAuthCodeSentState());
      }, 
      codeAutoRetrievalTimeout: (verificationId){
        _verificationIdd = verificationId;
      },
      );
  }

  void verifyOTP(String oTp)async{
    emit(PhoneAuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationIdd!, 
      smsCode: oTp);
      signInWithPhone(credential);
  }

  void signInWithPhone(PhoneAuthCredential credential)async{
    try{
      // ignore: unused_local_variable
      UserCredential userCredential = await 
      _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(PhoneAuthLogInState(userCredential.user!));
      }
    }on FirebaseAuthException catch(ex){
      emit(PhoneAuthErrorState(ex.message.toString()));
    }
  }

  void signOut()async{
    _auth.signOut();
    emit(PhoneAuthLogOutState());
  }
}
