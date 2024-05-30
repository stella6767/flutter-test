


import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter/model/common/status.dart';


part 'api_response.g.dart';


@JsonSerializable(
  genericArgumentFactories: true,
)
class ApiResponse<T> {

  String msg;
  T data;

  ApiResponse(this.msg, this.data);

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ApiResponseToJson(this, toJsonT);

}