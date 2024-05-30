import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter/repository/client/retrofit_client.dart';


import '../model/todo.dart';
import '../repository/todo_repository.dart';


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