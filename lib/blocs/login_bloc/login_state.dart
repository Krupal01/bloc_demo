abstract class LoginState {}

class LoginInitialState extends LoginState{}

class LoginValidState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMsg;

  LoginErrorState(this.errorMsg);
}

class LoginInProgressState extends LoginState {}

