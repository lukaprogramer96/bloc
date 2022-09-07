// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todos/todos_bloc.dart';
import '../models/todos_model.dart';
import '/models/models.dart';
import '/blocs/blocs.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerId = TextEditingController();
    TextEditingController controllerTask = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Pattern: Add a To Do'),
      ),
      body: BlocListener<TodosBloc, TodosState>(
        listener: (context, state) {
          if (state is TodosLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('To Do Added!'),
              ),
            );
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _inputField('Task', controllerTask),
                  _inputField('Description', controllerDescription),
                  ElevatedButton(
                    onPressed: () {
                      var todo = Todo(
                        id: 0,
                        task: controllerTask.value.text,
                        description: controllerDescription.value.text,
                      );
                      context.read<TodosBloc>().add(
                            AddTodo(todo: todo),
                          );
                      Navigator.pop(context);
                    },
                    child: const Text('Add To Do'),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Column _inputField(
    String field,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$field: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10),
          width: double.infinity,
          child: TextFormField(controller: controller),
        )
      ],
    );
  }
}
