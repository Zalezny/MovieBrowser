import 'package:dio/dio.dart';
import 'package:flutter_recruitment_task/core/error/failure.dart';

class DioExceptionMapper {
  DioExceptionMapper._();

  static Failure mapToFailure(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure(exception.message ?? 'Request timeout');

      case DioExceptionType.connectionError:
        return NetworkFailure(exception.message ?? 'Network connection error');

      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          return const UnauthorizedFailure('Unauthorized access');
        } else if (statusCode == 404) {
          return const NotFoundFailure('Resource not found');
        } else {
          return ServerFailure(
            exception.response?.statusMessage ?? 'Server error',
          );
        }

      case DioExceptionType.cancel:
        return const UnknownFailure('Request cancelled');

      default:
        return ServerFailure(exception.message ?? 'Unknown server error');
    }
  }
}
