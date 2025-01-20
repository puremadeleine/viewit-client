import 'package:dio/dio.dart';
import 'package:viewith/core/result/paginated_response.dart';
import 'package:viewith/core/result/result.dart';

import 'base_error.dart';

extension ApiResponseParser on Response {
  Result<T, BaseError> toResult<T>({
    String? key,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    try {
      switch (statusCode) {
        case 200:
          final jsonData = data as Map<String, dynamic>;
          final targetData = key != null ? jsonData[key] : jsonData;
          return Success(fromJson(targetData));

        default:
          return Failure(ApiError(code: statusCode ?? -1, message: statusMessage ?? ''));
      }
    } catch (e) {
      return Failure(UnknownError());
    }
  }

  Result<List<T>, BaseError> toListResult<T>({
    String? key,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    try {
      switch (statusCode) {
        case 200:
          final jsonData = data as Map<String, dynamic>;
          final List targetList = key != null ? jsonData[key] : jsonData;

          return Success(
            targetList.cast<Map<String, dynamic>>().map(fromJson).toList(),
          );

        default:
          return Failure(ApiError(code: statusCode ?? -1, message: statusMessage ?? ''));
      }
    } catch (e) {
      return Failure(UnknownError());
    }
  }

  Result<PaginatedResponse<T>, BaseError> toPaginatedResult<T>(
    T Function(Object?) fromJsonT,
  ) {
    try {
      if (statusCode != 200) {
        return Failure(ApiError(code: statusCode ?? -1, message: statusMessage ?? ''));
      }

      return Success(
        PaginatedResponse.fromJson(
          data as Map<String, dynamic>,
          fromJsonT,
        ),
      );
    } catch (e) {
      return Failure(UnknownError());
    }
  }
}

BaseError mapErrorResponse(int code, String message) {
  return switch (code) { _ => UnknownError() };
}
