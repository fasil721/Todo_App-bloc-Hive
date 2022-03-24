import 'package:hive/hive.dart';
import 'package:todo_with_hive_and_bloc/model/user.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>('usersBox');
  }

  String? authenticateUser(final String username, final String password) {
    final success = _users.values.any(
      (element) => element.usernane == username && element.password == password,
    );
    return success ? username : null;
  }
}
