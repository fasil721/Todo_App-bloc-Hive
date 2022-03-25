import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_with_hive_and_bloc/services/todo.dart';
import 'package:todo_with_hive_and_bloc/todos/bloc/todos_bloc.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key, required this.username}) : super(key: key);
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: BlocProvider(
        create: (context) =>
            TodosBloc(RepositoryProvider.of<TodoService>(context))
              ..add(LoadTodosEvent(username)),
        child: BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            if (state is TodosLoadedState) {
              return ListView(
                children: [
                  ListTile(
                    title: const Text('Create new task'),
                    trailing: const Icon(Icons.add),
                    onTap: () async {
                      final _todosbloc = BlocProvider.of<TodosBloc>(context);
                      final result = await showDialog<String>(
                        context: context,
                        builder: (context) => Dialog(child: CreateNewTask()),
                      );
                      if (result != null) {
                        _todosbloc.add(AddTodoEvent(result));
                      }
                    },
                  ),
                  ...state.tasks.map(
                    (e) => ListTile(
                      title: Text(e.task),
                      trailing: Checkbox(
                        value: e.completed,
                        onChanged: (val) {
                          BlocProvider.of<TodosBloc>(context)
                              .add(ToggleTodoEvent(e.task));
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class CreateNewTask extends StatelessWidget {
  CreateNewTask({Key? key}) : super(key: key);
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Text("What task do you want to create?"),
          TextField(
            controller: _inputController,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(_inputController.text);
            },
            child: const Text('SAVE'),
          )
        ],
      );
}
