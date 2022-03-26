import 'package:hive/hive.dart';
import 'package:todo_with_hive_and_bloc/model/user.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');

    // await _users.clear();
    // await _users.add(User('fasil', '123'));
    // await _users.add(User('cris', '123'));
  }

  String? authenticateUser(final String username, final String password) {
    final success = _users.values.any(
      (element) => element.username == username && element.password == password,
    );
    return success ? username : null;
  }

  Future<UserRegisterCreation> createUser(
    final String username,
    final String password,
  ) async {
    final alreadyExists = _users.values.any(
      (element) => element.username.toLowerCase() == username.toLowerCase(),
    );
    if (alreadyExists) {
      return UserRegisterCreation.alreadyExists;
    }
    try {
      _users.add(User(username, password));
      return UserRegisterCreation.success;
    } on Exception catch (ex) {
      return UserRegisterCreation.failure;
    }
  }
}

enum UserRegisterCreation{ success, failure, alreadyExists }
