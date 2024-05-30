import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_flutter/bloc/todo_bloc.dart';
import 'package:test_flutter/repository/client/retrofit_client.dart';
import 'package:test_flutter/repository/todo_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dio
  sl.registerSingleton<RestClient>(RestClient.configure());

  sl.registerSingleton<TodoRepository>(
      TodoRepository(restClient: sl())
  );

  //Blocs
  sl.registerFactory<TodoBloc>(() => TodoBloc(repository: sl()));

}