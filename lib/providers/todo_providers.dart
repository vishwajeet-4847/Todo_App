import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/modals/todos.dart';

final todoProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  addTodo(String content) {
    state = [
      ...state,
      Todo(todoId: state.length + 1, content: content, isCompleted: false)
    ];
  }

  deleteTodo(int todoId) {
    state = [
      for (final todo in state)
        if (todo.todoId != todoId) todo
    ];
  }

  completeTodo(Todo todoItem) {
    state = [
      for (final todo in state)
        if (todo.todoId == todoItem.todoId)
          Todo(content: todo.content, isCompleted: true, todoId: todo.todoId)
        else
          todo
    ];
  }
}
