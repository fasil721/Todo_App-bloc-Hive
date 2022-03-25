part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial({this.error});
  final String? error;

  @override
  List<Object?> get props => [error];
}

class SuccessfulLoginState extends HomeState {
  const SuccessfulLoginState(this.username);
  final String username;

  @override
  List<Object?> get props => [username];
}

class RegisteringServicesState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
