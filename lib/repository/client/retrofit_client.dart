import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_flutter/model/common/api_response.dart';
import 'package:test_flutter/model/page/page.dart';
import 'package:test_flutter/model/todo.dart';

import '../../widget/component/network_error_snackbar.dart';

part 'retrofit_client.g.dart';



@RestApi(baseUrl: 'http://localhost:8080')
abstract class RestClient {

  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  factory RestClient.configure() {
    return RestClient(initService());
  }

  @GET('/todos')
  Future<ApiResponse<PageDto<Todo>>> getTodos();

  @DELETE('/todo/{id}')
  Future<Todo> deleteTodoById(@Path() int id);

  @PUT('/todo/{id}')
  Future<Todo> updateTodo(@Path() int id);

  @POST('/todo')
  Future<Todo> saveTodo(@Query('newTodo') String todo);

}


Dio initService() {

  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (request, handler) {
        request.headers['Accept'] = 'application/json';
        return handler.next(request);
      },
      onError: (error, handler) {
        if (error.response != null) {
          // print(onError.message);
          // return handler.next(request);
          retrofitStatusError(onError: error, handler: handler);
        } else {
          // print(onError.error);
          networkErrorSnackbar(error, handler);
          //network 체크 안내 팝업
        }
      },
    ),
  );

  return dio;
}



Future<void> retrofitStatusError({
  required dynamic onError,
  required ErrorInterceptorHandler handler,
}) async {
  final dio = Dio();
  switch (onError.runtimeType) {
    case const (DioException):
    //if (onError.response?.statusCode == 502) {}

      final res = (onError as DioException).response;
      //ApiErrorResponse baseResponse;
      if (res != null) {
        if (res.data != null) {}
      } else {
        var opts = Options(
          method: onError.requestOptions.method,
          headers: onError.requestOptions.headers,
        );
        var recallResponse = await dio.request(
          onError.requestOptions.baseUrl + onError.requestOptions.path,
          options: opts,
          data: onError.requestOptions.data,
          queryParameters: onError.requestOptions.queryParameters,
        );
        return handler.resolve(recallResponse);
      }

      break;
    case const (SocketException):
    //retry back
      var opts = Options(
        method: onError.requestOptions.method,
        headers: onError.requestOptions.headers,
      );
      var recallResponse = await dio.request(
        onError.requestOptions.baseUrl + onError.requestOptions.path,
        options: opts,
        data: onError.requestOptions.data,
        queryParameters: onError.requestOptions.queryParameters,
      );
      return handler.resolve(recallResponse);
    default:
      break;
  }
}