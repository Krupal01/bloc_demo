import 'package:bloc_demo/blocs/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';

class LoginBlock extends Bloc<LoginEvent, LoginState> {
  LoginBlock() : super(LoginInitialState()) {
    on<LoginTextChangeEvent>((event, emit) {
      if (event.email.isEmpty) {
        emit(LoginErrorState("enter valid username"));
      } else if (event.password.isEmpty) {
        emit(LoginErrorState("enter valid password"));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginSubmittedEvent>((event, emit) {
      emit(LoginInProgressState());
    });
  }
}
