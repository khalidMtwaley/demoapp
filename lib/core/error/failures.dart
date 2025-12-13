
import 'package:demoapp/core/network/status_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    print("🧪 Dio Error Data: ${dioError.response?.data}");

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the API server.');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with the API server.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with the API server.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response?.statusCode, dioError.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to the API server was cancelled.');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection.');
      case DioExceptionType.unknown:
        print("🧯 Dio Unknown Error: ${dioError.error}");

        return ServerFailure('Unexpected error. Please try again.');
      default:
        return ServerFailure('Oops! Something went wrong. Please try again.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    print("🔥 Raw response: $response");

    if (statusCode == StatusCode.badRequest ||
        statusCode == StatusCode.unauthorized ||
        statusCode == StatusCode.forbidden ||
        statusCode == 422) { 
      String message;

      if (response['message'] != null) {
        message = response['message'].toString();
      } else if (response['errors'] != null &&
          response['errors'] is List<dynamic>) {
        message = (response['errors'] as List<dynamic>)
            .map((e) => e.toString())
            .join('\n');
      } else if (response['errors'] is String) {
        message = response['errors'];
      } else {
        message = 'An unexpected error occurred.';
      }

      print("✅ Parsed error message: $message");
      return ServerFailure(message);
    } else if (statusCode == StatusCode.notFound) {
      return ServerFailure('Your request was not found. Please try again later.');
    } else if (statusCode == StatusCode.internalServerError) {
      return ServerFailure('Internal server error. Please try again later.');
    } else {
      return ServerFailure('Oops! There was an error. Please try again.');
    }
  }
}





