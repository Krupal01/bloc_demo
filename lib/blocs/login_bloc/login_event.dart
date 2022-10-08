abstract class LoginEvent {}

class LoginTextChangeEvent extends LoginEvent {
  final String email;
  final String password;
  LoginTextChangeEvent(this.email, this.password);
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;
  LoginSubmittedEvent(this.email, this.password);
}
