import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_flutter/model/todo.dart';

part 'retrofit_client.g.dart';



@RestApi(baseUrl: 'http://localhost:8080')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/todos')
  Future<Todo> getTodos();

  @DELETE('/todo/{id}')
  Future<Todo> deleteTodoById(@Path() int id);

  @PUT('/todo/{id}')
  Future<Todo> updateTodo(@Path() int id);

  @POST('/v0/auth/logout')
  Future<Todo> saveTodo(@Query('newTodo') String todo);


}
