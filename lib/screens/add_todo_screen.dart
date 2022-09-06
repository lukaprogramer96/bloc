// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            _inputField('ID', controllerId),
            _inputField('Task', controllerTask),
            _inputField('Description', controllerDescription),
            ElevatedButton(
              onPressed: () {
                var todo = Todo(
                  id: controllerId.value.text,
                  task: controllerTask.value.text,
                  description: controllerDescription.value.text,
                );
              },
              child: const Text('Add To Do'),
            )
          ]),
        ),
      ),
    );
  }

  Column _inputField(
    String field,
    TextEditingController controller,
  ) {
    return Column(
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