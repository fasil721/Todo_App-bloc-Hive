import 'package:hive/hive.dart';
part 'user.g.dart';
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String usernane;
  @HiveField(1)
  final String password;

  User(this.usernane, this.password);
}
