import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenHandler {
  static final TokenHandler _instance = TokenHandler._internal();
  factory TokenHandler() => _instance;

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _accessTokenKey = 'ACCESS_TOKEN';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';
  static const String _tokenExpiryKey = 'TOKEN_EXPIRY';
  static const String _userInfoKey = 'USER_INFO';

  String? _accessToken;
  String? _refreshToken;
  DateTime? _tokenExpiry;

  TokenHandler._internal();

  Future<String?> getAccessToken() async {
    if (_accessToken != null) {
      return _accessToken;
    }
    _accessToken = await _storage.read(key: _accessTokenKey);
    return _accessToken;
  }

  Future<bool> hasValidAccessToken() async {
    final expiry = await getTokenExpiry();
    if (expiry == null) return false;

    return expiry.isAfter(DateTime.now().add(const Duration(minutes: 5)));
  }

  Future<String?> getRefreshToken() async {
    if (_refreshToken != null) {
      return _refreshToken;
    }
    _refreshToken = await _storage.read(key: _refreshTokenKey);
    return _refreshToken;
  }

  Future<DateTime?> getTokenExpiry() async {
    if (_tokenExpiry != null) {
      return _tokenExpiry;
    }

    final expiryStr = await _storage.read(key: _tokenExpiryKey);
    if (expiryStr != null) {
      _tokenExpiry = DateTime.parse(expiryStr);
      return _tokenExpiry;
    }
    return null;
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required DateTime expiry,
  }) async {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _tokenExpiry = expiry;

    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
      _storage.write(key: _tokenExpiryKey, value: expiry.toIso8601String()),
    ]);
  }

  Future<void> clearTokens() async {
    _accessToken = null;
    _refreshToken = null;
    _tokenExpiry = null;

    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
      _storage.delete(key: _tokenExpiryKey),
      _storage.delete(key: _userInfoKey),
    ]);
  }

  Future<TokenStatus> checkTokenStatus() async {
    final hasAccessToken = await getAccessToken() != null;
    final hasRefreshToken = await getRefreshToken() != null;
    final isAccessTokenValid = await hasValidAccessToken();

    if (!hasAccessToken && !hasRefreshToken) {
      return TokenStatus.noTokens;
    }

    if (isAccessTokenValid) {
      return TokenStatus.valid;
    }

    if (hasRefreshToken) {
      return TokenStatus.needsRefresh;
    }

    return TokenStatus.expired;
  }
}

enum TokenStatus {
  valid,
  needsRefresh,
  expired,
  noTokens,
}