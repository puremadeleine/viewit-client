import 'package:dio/dio.dart';
import 'package:retry/retry.dart';
import 'package:viewith/network/token_handler.dart';

class Client {
  late Dio _dio;
  final TokenHandler _tokenHandler = TokenHandler();
  static final Client _instance = Client._internal();

  factory Client() => _instance;

  Client._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.extra['requiresAuth'] == false) {
            return handler.next(options);
          }

          final tokenStatus = await _tokenHandler.checkTokenStatus();

          switch (tokenStatus) {
            case TokenStatus.valid:
              final token = await _tokenHandler.getAccessToken();
              options.headers['Authorization'] = 'Bearer $token';
              return handler.next(options);

            case TokenStatus.needsRefresh:
              final isRefreshSuccess = await _refreshToken();
              if (isRefreshSuccess) {
                final token = await _tokenHandler.getAccessToken();
                options.headers['Authorization'] = 'Bearer $token';
                return handler.next(options);
              }

              await _tokenHandler.clearTokens();
              return handler.reject(
                DioException(
                  requestOptions: options,
                  type: DioExceptionType.badResponse,
                  response: Response(
                    statusCode: 401,
                    requestOptions: options,
                  ),
                ),
              );

            case TokenStatus.expired:
            case TokenStatus.noTokens:
              return handler.reject(
                DioException(
                  requestOptions: options,
                  error: 'Authentication required',
                ),
              );
          }
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401 &&
              error.requestOptions.extra['requiresAuth'] == true) {
            final status = await _tokenHandler.checkTokenStatus();

            if (status == TokenStatus.needsRefresh) {
              try {
                await _refreshToken();
                final options = error.requestOptions;
                options.headers['Authorization'] =
                    'Bearer ${_tokenHandler.getAccessToken()}';
                final response = await _dio.fetch(options);
                return handler.resolve(response);
              } catch (e) {
                return handler.reject(error);
              }
            }
          }
          return handler.next(error);
        },
      ),
    );

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _tokenHandler.getRefreshToken();
      if (refreshToken == null) return false;

      final response = await _dio.post(
        '/v1/refresh',
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        await _tokenHandler.saveTokens(
          accessToken: response.data['access_token'],
          refreshToken: response.data['refresh_token'],
          expiry: DateTime.now().add(
            Duration(seconds: response.data['expires_in']),
          ),
        );
        return true;
      }
      return false;
    } catch (e) {
      await _tokenHandler.clearTokens();
      return false;
    }
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    int maxRetries = 3,
    bool requiresAuth = true,
  }) async {
    try {
      return await retry(
        () => _dio.get(
          path,
          queryParameters: queryParameters,
          options: Options(extra: {'requiresAuth': requiresAuth}),
        ),
        retryIf: (error) =>
            error is DioException &&
            error.type != DioExceptionType.cancel &&
            error.type != DioExceptionType.badResponse,
        maxAttempts: maxRetries,
        delayFactor: const Duration(seconds: 1),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    int maxRetries = 3,
    bool requiresAuth = true,
  }) async {
    try {
      return await retry(
        () => _dio.post(
          path,
          data: data,
          queryParameters: queryParameters,
          options: Options(extra: {'requiresAuth': requiresAuth}),
        ),
        retryIf: (error) =>
            error is DioException &&
            error.type != DioExceptionType.cancel &&
            error.type != DioExceptionType.badResponse,
        maxAttempts: maxRetries,
        delayFactor: const Duration(seconds: 1),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    int maxRetries = 3,
    bool requiresAuth = true,
  }) async {
    try {
      return await retry(
        () => _dio.put(
          path,
          data: data,
          queryParameters: queryParameters,
          options: Options(extra: {'requiresAuth': requiresAuth}),
        ),
        retryIf: (error) =>
            error is DioException &&
            error.type != DioExceptionType.cancel &&
            error.type != DioExceptionType.badResponse,
        maxAttempts: maxRetries,
        delayFactor: const Duration(seconds: 1),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    int maxRetries = 3,
    bool requiresAuth = true,
  }) async {
    try {
      return await retry(
        () => _dio.delete(
          path,
          data: data,
          queryParameters: queryParameters,
          options: Options(extra: {'requiresAuth': requiresAuth}),
        ),
        retryIf: (error) =>
            error is DioException &&
            error.type != DioExceptionType.cancel &&
            error.type != DioExceptionType.badResponse,
        maxAttempts: maxRetries,
        delayFactor: const Duration(seconds: 1),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    int maxRetries = 3,
  }) async {
    try {
      return await retry(
        () => _dio.patch(
          path,
          data: data,
          queryParameters: queryParameters,
          options: options,
        ),
        retryIf: (error) =>
            error is DioException &&
            error.type != DioExceptionType.cancel &&
            error.type != DioExceptionType.badResponse,
        maxAttempts: maxRetries,
        delayFactor: const Duration(seconds: 1),
      );
    } catch (e) {
      rethrow;
    }
  }
}
