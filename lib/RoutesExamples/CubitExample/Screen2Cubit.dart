
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2Cubit extends Cubit<int> {
  Screen2Cubit() : super(0);

  //make a increment function
  void increment() => emit(state + 1);
}