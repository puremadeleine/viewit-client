import 'package:viewith/core/result/result.dart';

import 'base_error.dart';

extension ApiResponseParser<T> on Map<String, dynamic> {
  Result<T, BaseError> toResult(T Function(Map<String, dynamic>) fromJson) {
    try {
      if (containsKey('value')) {
        return Success(fromJson(this['value']));
      } else {
        final errorCode = this['code'] as int;
        final errorMessage = this['message'] as String;
        return Failure(mapErrorResponse(errorCode, errorMessage));
      }
    } catch (e) {
      return Failure(UnknownError());
    }
  }
}

BaseError mapErrorResponse(int code, String message) {
  return switch (code) {
    _ => UnknownError()
  };
}