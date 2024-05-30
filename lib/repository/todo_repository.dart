


import 'package:test_flutter/model/common/api_response.dart';
import 'package:test_flutter/model/todo.dart';
import 'package:test_flutter/repository/client/retrofit_client.dart';

import '../model/page/page.dart';

class TodoRepository {
  final RestClient _restClient;

  TodoRepository({required RestClient restClient}) : _restClient = restClient;

  Future<ApiResponse<PageDto<Todo>>> getTodos() async {
    return await _restClient.getTodos();
  }



}
