


import 'package:test_flutter/model/common/status.dart';

class ApiResponse<T> {

  Status status ;
  String? msg;
  T? data;

  ApiResponse(this.status, this.msg, this.data);

  ApiResponse.notStarted() : status = Status.notStarted ;

  ApiResponse.loading() : status = Status.loading ;

  ApiResponse.completed(this.data) : status = Status.completed ;

  ApiResponse.error(this.msg) : status = Status.error ;


}