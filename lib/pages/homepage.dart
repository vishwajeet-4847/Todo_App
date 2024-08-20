import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/modals/todos.dart';
import 'package:todoapp/pages/add.dart';
import 'package:todoapp/pages/completed.dart';
import 'package:todoapp/providers/todo_providers.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoListNotifier todoListNotifier = ref.watch(todoProvider.notifier);
    List<Todo> todoList = ref.watch(todoProvider);
    List<Todo> activeTodos =
        todoList.where((todo) => todo.isCompleted == false).toList();
    List<Todo> completedTodos =
        todoList.where((todo) => todo.isCompleted == true).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo App",
        ),
      ),
      body: ListView.builder(
          itemCount: activeTodos.length + 1,
          itemBuilder: (context, index) {
            if (index == activeTodos.length) {
              if (completedTodos.isEmpty) {
                return Container();
              } else {
                return Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CompletedTodos()));
                      },
                      child: const Text("Completed Todos")),
                );
              }
            } else {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Slidable(
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          todoListNotifier
                              .deleteTodo(activeTodos[index].todoId);
                        },
                        backgroundColor: Colors.red,
                        icon: Icons.delete,
                        borderRadius: BorderRadius.circular(20),
                      )
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          todoListNotifier.completeTodo(activeTodos[index]);
                        },
                        backgroundColor: const Color.fromARGB(255, 54, 129, 27),
                        icon: Icons.check,
                        borderRadius: BorderRadius.circular(20),
                      )
                    ],
                  ),
                  child: ListTile(
                    title: Text(
                      activeTodos[index].content,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTodo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
