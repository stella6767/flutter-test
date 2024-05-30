


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
    print(s);
    print(result.data);

    return result.data?.content ?? List.empty();
  }



}
