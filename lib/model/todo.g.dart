// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      status: json['status'] as bool,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
