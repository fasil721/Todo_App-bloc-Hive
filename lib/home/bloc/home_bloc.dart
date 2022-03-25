import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_with_hive_and_bloc/services/authentication.dart';
import 'package:todo_with_hive_and_bloc/services/todo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationService _auth;
  final TodoService _todo;
  HomeBloc(this._auth, this._todo) : super(RegisteringServicesState()) {
    on<LoginEvent>((event, emit) {
      final user = _auth.authenticateUser(event.usernane, event.password);
      if (user != null) {
        emit(SuccessfulLoginState(user));
        emit(const HomeInitial());
      }
    });
    on<RegisterAccountEvent>((event, emit) async {
      final result = await _auth.createUser(event.username, event.password);
      switch (result) {
        case UserCreationResult.success:
          emit(SuccessfulLoginState(event.username));
          break;
        case UserCreationResult.failure:
          emit(const HomeInitial(error: "There's been a error"));
          break;
        case UserCreationResult.alreadyExists:
          emit(const HomeInitial(error: "User already exists"));
          break;
      }
    });
    on<RegisterServicesEvent>((event, emit) async {
      await _auth.init();
      await _todo.init();
      emit(const HomeInitial());
    });
  }
}
