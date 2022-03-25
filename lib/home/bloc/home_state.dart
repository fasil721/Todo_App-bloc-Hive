part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class SuccessfulLoginState extends HomeState {
  final String username;
  const SuccessfulLoginState(this.username);
  @override
  List<Object?> get props => [username];
}

class RegisteringServicesState extends HomeState {
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
