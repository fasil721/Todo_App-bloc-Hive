part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoginEvent extends HomeEvent {
  final String usernane;
  final String password;
  const LoginEvent(this.usernane, this.password);
  @override
  List<Object> get props => [usernane, password];
}

class RegisterServicesEvent extends HomeEvent {
  
  @override
  List<Object?> get props => [];
}
