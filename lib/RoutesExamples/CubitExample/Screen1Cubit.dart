
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen1Cubit extends Cubit<int> {
  Screen1Cubit() : super(0);

  //make a increment function
  void increment() => emit(state + 1);
}