import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoapp/modals/todos.dart';
import 'package:todoapp/providers/todo_providers.dart';

class CompletedTodos extends ConsumerWidget {
  const CompletedTodos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> completedTodosList = ref
        .watch(todoProvider)
        .where((todo) => todo.isCompleted == true)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Completed Todos",
        ),
      ),
      body: ListView.builder(
          itemCount: completedTodosList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Slidable(
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        ref
                            .watch(todoProvider.notifier)
                            .deleteTodo(completedTodosList[index].todoId);
                      },
                      backgroundColor: Colors.red,
                      icon: Icons.delete,
                      borderRadius: BorderRadius.circular(20),
                    )
                  ],
                ),
                child: ListTile(
                  style: ListTileStyle.list,
                  title: Text(
                    completedTodosList[index].content,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
