// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      $enumDecode(_$StatusEnumMap, json['status']),
      json['msg'] as String?,
      _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': _$StatusEnumMap[instance.status]!,
      'msg': instance.msg,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

const _$StatusEnumMap = {
  Status.notStarted: 'notStarted',
  Status.loading: 'loading',
  Status.completed: 'completed',
  Status.error: 'error',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
