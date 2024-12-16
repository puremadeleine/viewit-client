sealed class BaseError {
  const BaseError({
    required this.code,
    required this.message,
  });

  final int code;
  final String message;
}

final class UnknownError extends BaseError {
  UnknownError([int code = 9999]) : super(
    code: code,
    message: '알 수 없는 에러가 발생했습니다.\n잠시 후 다시 시도해주세요.',
  );
}

final class NetworkError extends BaseError {
  NetworkError([int code = 9998]) : super(
    code: code,
    message: '네트워크 상태를 확인해주세요.',
  );
}

final class ApiError extends BaseError {
  ApiError({
    required super.code,
    required super.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      code: json['code'] as int,
      message: json['message'] as String,
    );
  }
}