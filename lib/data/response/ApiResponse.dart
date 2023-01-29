
import 'package:flutter_mvvm_project_practise/data/response/status.dart';

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);


  ApiResponse.loading():status = Status.LOADING;
  ApiResponse.completed():status = Status.COMPLETED;
  ApiResponse.error():status = Status.ERROR;

  @override
  String toString() {
    return 'ApiResponse{status: $status, data: $data, message: $message}';
  }
}