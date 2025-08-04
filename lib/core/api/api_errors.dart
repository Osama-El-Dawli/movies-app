import 'package:dio/dio.dart';

class ApiError implements Exception {
  final String message;

  ApiError._(this.message);

  factory ApiError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return ApiError._("Request was cancelled");
      case DioExceptionType.connectionTimeout:
        return ApiError._("Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ApiError._("Receive timeout in connection with API server");
      case DioExceptionType.badResponse:
        return ApiError._(
          _handleError(dioError.response?.statusCode, dioError.response?.data),
        );
      case DioExceptionType.sendTimeout:
        return ApiError._("Send timeout in connection with API server");
      case DioExceptionType.connectionError:
        return ApiError._("No internet connection");
      default:
        return ApiError._("Something went wrong");
    }
  }

  static String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error["message"] ?? "Bad request";
      case 401:
        return "Unauthorized access";
      case 403:
        return "Forbidden";
      case 404:
        return "Resource not found";
      case 500:
        return "Internal server error";
      default:
        return "Unexpected error occurred";
    }
  }
}
