// ignore: duplicate_ignore
// ignore_for_file: unused_import, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';

import 'blocs/blocs.dart';
import 'blocs/todos_filter/todos_filter_bloc.dart';
import 'models/models.dart';
import 'models/todos_model.dart';
import 'screens/home_screen.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              LoadTodos(todos: [
                Todo(
                  id: 1,
                  task: 'Sample ToDo 1',
                  description: 'This is a test To Do',
                ),
                Todo(
                  id: 2,
                  task: 'Sample ToDo 2',
                  description: 'This is a Ttest To Do',
                ),
              ]),
            ),
        ),
        BlocProvider(
          create: (context) => TodosFilterBloc(
            todosBloc: BlocProvider.of<TodosBloc>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'BLoC Pattern - Todos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF000A1F),
          appBarTheme: const AppBarTheme(
            color: Color(0XFF000A1F),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
