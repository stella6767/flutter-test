import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/grobal_variable.dart';
import '../../provider/todo_providers.dart';



class TodoScreen extends ConsumerWidget {

  static const routeName = '/todo';

  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('?????????');

    final todosAsyncValue = ref.watch(todosProvider);


    return todosAsyncValue.when(
      data: (todos) =>
          ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.content),
                subtitle: Text(todo.createdAt),
              );
            },
          ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

}