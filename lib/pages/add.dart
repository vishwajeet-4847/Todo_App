import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/providers/todo_providers.dart';

class AddTodo extends ConsumerWidget {
  final TextEditingController _contentController = TextEditingController();
  AddTodo({super.key});

  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TodoListNotifier todolistNotifier = ref.watch(todoProvider.notifier);
    return GestureDetector(
      onTap: () {
        _focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Todo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                      labelText: 'Add a new todo',
                      contentPadding: EdgeInsets.all(8.0)),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_contentController.text.isEmpty) {
                    return;
                  } else {
                    todolistNotifier.addTodo(_contentController.text);
                    _contentController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text("Add Todo"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
