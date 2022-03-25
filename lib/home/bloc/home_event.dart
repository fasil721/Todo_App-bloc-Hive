part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoginEvent extends HomeEvent {
  const LoginEvent(this.usernane, this.password);

  final String usernane;
  final String password;

  @override
  List<Object> get props => [usernane, password];
}

class RegisterServicesEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class RegisterAccountEvent extends HomeEvent {
  const RegisterAccountEvent(this.username, this.password);

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
