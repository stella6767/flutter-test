

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../model/todo.dart';

abstract class TodoState extends Equatable {
  final List<Todo>? items;
  final DioException? error;

  const TodoState({this.items, this.error});

  @override
  List<Object> get props => [items!, error!];

}


class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoDone extends TodoState {
  const TodoDone(List<Todo> items) : super( items: items);
}

class TodoError extends TodoState {
  const TodoError(error) : super( error: error);
}