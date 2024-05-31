import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/model/todo.dart';

import '../../config/grobal_variable.dart';
import '../../provider/todo_providers.dart';

class TodoScreen extends ConsumerWidget {
  static const routeName = '/todo';

  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsyncValue = ref.watch(todoListProvider);

    //ref.read(todoListProvider.notifier).getTodos();

    final newTodoController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              const Title(),
              TextField(
                controller: newTodoController,
                decoration: const InputDecoration(
                  labelText: 'What needs to be done?',
                ),
                onSubmitted: (value) {
                  ref.read(todoListProvider.notifier).addTodo(value);
                  newTodoController.clear();
                },
              ),
              const SizedBox(height: 42),
              const Toolbar(),
              Expanded(
                child: todosAsyncValue.when(
                  data: (todos) {
                    if (todos.isEmpty) {
                      return const Center(child: Text('No todos'));
                    }
                    return ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) {
                        final todo = todos[index];
                        return Column(
                          children: [
                            if (index > 0) const Divider(height: 0),
                            Dismissible(
                              key: ValueKey(todo.id),
                              onDismissed: (_) {
                                // ref.read(todoListProvider.notifier).remove(todo);
                              },
                              child: ProviderScope(
                                overrides: [
                                  //_currentTodo.overrideWithValue(todo),
                                ],
                                child: TodoItem(todo),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Toolbar extends ConsumerWidget {
  const Toolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final filter = ref.watch(todoListFilter);
    // Color? textColorFor(TodoListFilter value) {
    //   return filter == value ? Colors.blue : Colors.black;
    // }

    //final todosAsyncValue = ref.watch(todoListProvider);

    //ref.read(todoListProvider.notifier).getTodosByStatus(null);

    final activeFilterKey = UniqueKey();
    final completedFilterKey = UniqueKey();
    final allFilterKey = UniqueKey();

    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'items left',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Tooltip(
            key: allFilterKey,
            message: 'All todos',
            child: TextButton(
              onPressed: () =>
                  ref.read(todoListProvider.notifier).getTodosByStatus(),
              //ref.read(todoListProvider.notifier).state = TodoListFilter.all,
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              child: const Text('All'),
            ),
          ),
          Tooltip(
            key: activeFilterKey,
            message: 'Only uncompleted todos',
            child: TextButton(
              onPressed: () =>
                  ref.read(todoListProvider.notifier).getTodosByStatus(false),
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: WidgetStatePropertyAll(
                  Colors.blue,
                ),
              ),
              child: const Text('Active'),
            ),
          ),
          Tooltip(
            key: completedFilterKey,
            message: 'Only completed todos',
            child: TextButton(
              onPressed: () =>
                  ref.read(todoListProvider.notifier).getTodosByStatus(true),
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: WidgetStatePropertyAll(
                  Colors.blue,
                ),
              ),
              child: const Text('Completed'),
            ),
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'todos',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(38, 47, 47, 247),
        fontSize: 100,
        fontWeight: FontWeight.w100,
        fontFamily: 'Helvetica Neue',
      ),
    );
  }
}

class TodoItem extends ConsumerStatefulWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  ConsumerState<TodoItem> createState() => _TodoItemState(todo);
}

class _TodoItemState extends ConsumerState<TodoItem> {
  late FocusNode itemFocusNode;
  late FocusNode textFieldFocusNode;
  late TextEditingController textEditingController;
  bool itemIsFocused = false;
  final Todo todo;

  _TodoItemState(this.todo);

  @override
  void initState() {
    super.initState();
    itemFocusNode = FocusNode();
    textFieldFocusNode = FocusNode();
    textEditingController = TextEditingController();
    itemFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      itemIsFocused = itemFocusNode.hasFocus;

      if (itemIsFocused) {
        //final todo = ref.read(_currentTodo);
        //textEditingController.text = todo.description;
      } else {
        // final todo = ref.read(_currentTodo);
        // ref
        //     .read(todoListProvider.notifier)
        //     .edit(id: todo.id, description: textEditingController.text);
      }
    });
  }

  @override
  void dispose() {
    itemFocusNode.removeListener(_onFocusChange);
    itemFocusNode.dispose();
    textFieldFocusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 6,
      child: Focus(
        focusNode: itemFocusNode,
        child: ListTile(
          onTap: () {
            itemFocusNode.requestFocus();
            textFieldFocusNode.requestFocus();
          },
          leading: Checkbox(
            value: todo.status,
            onChanged: (value) =>
                ref.read(todoListProvider.notifier).toggle(todo.id),
          ),
          title: itemIsFocused
              ? TextField(
                  autofocus: true,
                  focusNode: textFieldFocusNode,
                  controller: textEditingController,
                )
              : Text(todo.content),
        ),
      ),
    );
  }
}
