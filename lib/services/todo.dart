import 'package:hive/hive.dart';
import 'package:todo_with_hive_and_bloc/model/task.dart';

class TodoService {
  late Box<Task> _tasks;

  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _tasks = await Hive.openBox<Task>('tasks');
  }

  List<Task> getTasks(final String username) {
    final tasks = _tasks.values.where((element) => element.user == username);
    return tasks.toList();
  }

  void addTask(final String task, final String username) {
    _tasks.add(Task(username, task, false));
  }
}
