// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todos_model.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<UpdateTodo>(_onUpdateTodo);
  }

  void _onLoadTodos(LoadTodos event, Emitter<TodosState> emit) {
    emit(
      TodosLoaded(todos: event.todos),
    );
  }

  void _onAddTodo(AddTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    int lastId = -1;
    if (state is TodosLoaded) {
      for (var i in state.todos) {
        if (i.id > lastId) {
          lastId = i.id;
        }
      }
      event.todo.id = lastId + 1;
      emit(
        TodosLoaded(
          todos: List.from(state.todos)..add(event.todo),
        ),
      );
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> todos = (state.todos.map((todo) {
        return todo.id == event.todo.id ? event.todo : todo;
      })).toList();
      emit(TodosLoaded(todos: todos));
    }
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> todos = state.todos.where((todo) {
        return todo.id != event.todo.id;
      }).toList();
      emit(
        TodosLoaded(todos: todos),
      );
    }
  }
}
