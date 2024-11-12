sealed class BaseError {
  const BaseError(this.message);

  final String message;
}

sealed class UnknownError extends BaseError {
  UnknownError(): super('알 수 없는 에러가 발생했습니다. \n잠시 후 다시 시도해주세요.');
}

sealed class NetworkError extends BaseError {
  NetworkError(): super('네트워크 상태를 확인해주세요.');
}