
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  final int id;
  final String content;
  bool isComplete;
  final String createdAt;

  Todo({
    required this.id,
    required this.content,
    this.isComplete = false,
    required this.createdAt,
  });

  copyWith({int? id, int? userId, String? title, bool? isComplete}) {
    return Todo(
        id: id ?? this.id,
        content: title ?? this.content,
        isComplete: isComplete ?? this.isComplete,
        createdAt: createdAt ?? this.createdAt,
    );
  }


  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}