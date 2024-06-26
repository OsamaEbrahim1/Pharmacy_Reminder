import 'package:reminder_app/core/api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;
  final String msg;
  final String message;

  ErrorModel({required this.errorMessage,required this.status,required this.msg,required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errorMessage: jsonData[ApiKey.error],
      msg: jsonData[ApiKey.msg],
      message: jsonData[ApiKey.message],
    );
  }
}
