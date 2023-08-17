
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CubitExample/Screen1Cubit.dart';
import '../CubitExample/Screen2Cubit.dart';
import '../CubitExample/Screen3Cubit.dart';
import '../Screens/Screen1.dart';
import '../Screens/Screen2.dart';
import '../Screens/Screen3.dart';

class Routes {

    // ignore: body_might_complete_normally_nullable
    static Route? onGeneratedRoute(RouteSettings settings){

      switch(settings.name){
        case "/screen1" :
        return MaterialPageRoute(builder: (context) => BlocProvider(
                create: (context) => Screen1Cubit(),
                child: const Screen1(),
              ),);
        
        case "/screen2" :
        Map <String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (context) => BlocProvider(
                create: (context) => Screen2Cubit(),
                child:  Screen2(titlee: arguments['title']),
              ),);
        
        case "/screen3" :
        return MaterialPageRoute(builder: (context) => BlocProvider(
                create: (context) => Screen3Cubit(),
                child: const Screen3(),
              ),);
      }
    }
}