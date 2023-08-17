import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Phone_Auth_Example_Firebase/Cubic_Phone_Auth/Cubic_Phone_Auth.dart';
// import 'package:flutter_application_1/Phone_Auth_Example_Firebase/HomeScreem.dart';
import 'package:flutter_application_1/RoutesExamples/CubitExample/Screen1Cubit.dart';
import 'package:flutter_application_1/RoutesExamples/Routes/Routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_application_1/Auth_Example/Auth_Screen.dart';
// import 'Phone_Auth_Example_Firebase/Cubic_Phone_Auth/Cubic_Phone_Auth_State.dart';
// import 'Phone_Auth_Example_Firebase/SignIn_Screen.dart';
import 'firebase_options.dart';
// import 'package:flutter_application_1/InternetConnnection_Exampe/Bloc/InternetCubit/InternetCubit.dart';
// import 'package:flutter_application_1/InternetConnnection_Exampe/HomeScreen/HomeScreen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Screen1Cubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGeneratedRoute,
        initialRoute: '/screen1',
      ),
    );
  }
}
/** */


/**
 * //internet Bloc Example
 * BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(),
    ),
    ); */

  //for phone authentication bloc example
/**BlocProvider(
      create: (context) => PhoneAUthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<PhoneAUthCubit, Cubic_Phone_Auth_State>(
          buildWhen: (previous, current) {
            return previous is PhoneAuthInitialState;
          },
          builder: (context, state) {
            if (state is PhoneAuthLogInState) {
              return const HomeScreenPhone();
            } else if(state is PhoneAuthLogOutState){
              return SignIn_Screen();
            }else{
              return const Scaffold();
            }
            
          },
        ),
      ),
    ); */