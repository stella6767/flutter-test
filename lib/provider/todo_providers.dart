import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/repository/client/retrofit_client.dart';

import '../model/todo.dart';
import '../repository/todo_repository.dart';

/**
 * 플러터에서 일종의 서비스 레이어라고 보면 될 거 같음
 */

//https://medium.com/@cody.yun/%EB%B2%88%EC%97%AD-flutter-riverpod-2-0-the-ultimate-guide-1-3-11e8a7dea9e6
//https://velog.io/@dolfalf/%EC%95%84%ED%82%A4%ED%85%8D%EC%B3%90%EB%A5%BC-%EA%B3%A0%EB%A0%A4%ED%95%9C-Riverpod-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0-Flutter
//

final restClient = Provider<RestClient>((ref) {
  return RestClient.configure();
});

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepository(restClient: ref.watch(restClient));
});

final todosProvider = FutureProvider<List<Todo>>((ref) async {
  print('!!!!!!');
  final repository = ref.watch(todoRepositoryProvider);
  return repository.getTodos();
});

final todoListProvider =
    AsyncNotifierProvider<AsyncTodosNotifier, List<Todo>>(() {
  return AsyncTodosNotifier();
});

class AsyncTodosNotifier extends AsyncNotifier<List<Todo>> {
  @override
  Future<List<Todo>> build() async {
    // 원격 리포지토리에서 최초의 할 일 목록 불러오기
    return _getTodos();
  }

  Future<void> getTodosByStatus([bool? isComplete = null]) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {

      if (isComplete == null) {
        return _getTodos();
      }
      var todos = await _getTodos();

      if (isComplete) {
        return  Future.value(todos.where((el) => el.status).toList());
      } else {
        return Future.value(todos.where((el) => !el.status).toList());
      }
    });

  }

  Future<List<Todo>> _getTodos() async {
    return ref.read(todoRepositoryProvider).getTodos();
  }

  Future<void> addTodo(String todo) async {
    // 상태를 로딩으로 설정
    state = const AsyncValue.loading();
    // 새 할 일을 추가하고 원격 저장소에서 할 일 목록을 다시 로드합니다.
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).addTodo(todo);
      return _getTodos();
    });
  }

// 할 일을 완료로 표시합니다.
  Future<void> toggle(int todoId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(todoRepositoryProvider).updateTodo(todoId);
      return _getTodos();
    });
  }
}

// // 할 일 제거를 허용합니다.
// Future<void> removeTodo(String todoId) async {
//   state = const AsyncValue.loading();
//   state = await AsyncValue.guard(() async {
//     await http.delete('api/todos/$todoId');
//     return _fetchTodo();
//   });
// }
//
