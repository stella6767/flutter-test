


import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:test_flutter/model/common/api_response.dart';
import 'package:test_flutter/model/todo.dart';
import 'package:test_flutter/repository/client/retrofit_client.dart';

import '../model/page/page.dart';

class TodoRepository {
  final RestClient _restClient;

  TodoRepository({required RestClient restClient}) : _restClient = restClient;

  Future<List<Todo>> getTodos() async {
    var result = await _restClient.getTodos();
    PageDto<Todo> s = result.data;
    return result.data.content;
  }

  Future<Todo> addTodo(String todo) async {
    var result = await _restClient.addTodo(todo);
    return result.data;
  }

  Future<void> updateTodo(int id) async {
    await _restClient.updateTodo(id);
  }



}
