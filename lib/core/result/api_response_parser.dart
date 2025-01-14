import 'package:dio/dio.dart';
import 'package:viewith/core/result/result.dart';

import 'base_error.dart';

extension ApiResponseParser on Response {
  Result<T, BaseError> toResult<T>(T Function(Map<String, dynamic>) fromJson) {
    try {
      switch (statusCode) {
        case 200:
          return Success(fromJson(data as Map<String, dynamic>));
        default:
          return Failure(ApiError(code: statusCode ?? -1, message: statusMessage ?? ''));
      }
    } catch (e) {
      // 예외 발생 시 UnknownError 반환
      return Failure(UnknownError());
    }
  }
}


BaseError mapErrorResponse(int code, String message) {
  return switch (code) {
    _ => UnknownError()
  };
}