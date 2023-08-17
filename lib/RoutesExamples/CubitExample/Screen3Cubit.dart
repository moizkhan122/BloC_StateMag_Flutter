
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen3Cubit extends Cubit<int> {
  Screen3Cubit() : super(0);

  //make a increment function
  void increment() => emit(state + 1);
}