// ignore: duplicate_ignore
// ignore_for_file: unused_import, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';

import 'blocs/blocs.dart';
import 'models/models.dart';
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
          create: (context) => TodosBloc()..add(const LoadTodos()),
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
