
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  final int id;
  final String content;
  final bool status;
  final String createdAt;

  Todo({
    required this.id,
    required this.content,
    required this.status,
    required this.createdAt,
  });

  copyWith({int? id, int? userId, String? title, bool? status}) {
    return Todo(
        id: id ?? this.id,
        content: title ?? this.content,
        status: status ?? this.status,
        createdAt: createdAt,
    );
  }


  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}