

import 'package:bloc/bloc.dart';
import 'package:test_flutter/bloc/todo_event.dart';
import 'package:test_flutter/bloc/todo_state.dart';

import '../model/todo.dart';
import '../repository/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final TodoRepository repository;

  TodoBloc({
    required this.repository,
  }) : super(const TodoLoading());



  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {

    switch(event){
      case TodoEvent.add:
        yield TodoState(
          items: List.from(state.items)..add(Todo(title: 'New todo')),
        );
      case TodoEvent.remove:
        yield TodoState(
          items: List.from(state.items)..add(Todo(title: 'New todo')),
        );
      case TodoEvent.toggle:
        yield TodoState(
          items: List.from(state.items)..add(Todo(title: 'New todo')),
        );
      case TodoEvent.find:
        // TODO: Handle this case.
    }
  }


  void onGetArticles(GetArticles event, Emitter < RemoteArticlesState > emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
          RemoteArticlesDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
          RemoteArticlesError(dataState.error!)
      );
    }
  }


}