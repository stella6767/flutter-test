


import 'package:json_annotation/json_annotation.dart';
import 'package:test_flutter/model/common/status.dart';


part 'api_response.g.dart';


@JsonSerializable(
  genericArgumentFactories: true,
)
class ApiResponse<T> {

  Status status ;
  String? msg;
  T? data;

  ApiResponse(this.status, this.msg, this.data);

  ApiResponse.notStarted() : status = Status.notStarted ;

  ApiResponse.loading() : status = Status.loading ;

  ApiResponse.completed(this.data) : status = Status.completed ;

  ApiResponse.error(this.msg) : status = Status.error ;


  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ApiResponseToJson(this, toJsonT);

}