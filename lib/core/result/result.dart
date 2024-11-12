sealed class Result<S, F> {
  const Result();

  T match<T>({
    required T Function(S success) onSuccess,
    required T Function(F failure) onFailure,
  });
}

final class Success<S, F> extends Result<S, F> {
  const Success(this.value);
  final S value;

  @override
  T match<T>({
    required T Function(S success) onSuccess,
    required T Function(F failure) onFailure,
  }) {
    return onSuccess(value);
  }
}

final class Failure<S, F> extends Result<S, F> {
  const Failure(this.error);
  final F error;

  @override
  T match<T>({
    required T Function(S success) onSuccess,
    required T Function(F failure) onFailure,
  }) {
    return onFailure(error);
  }
}