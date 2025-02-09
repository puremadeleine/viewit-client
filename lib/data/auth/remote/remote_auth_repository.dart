import 'dart:developer';

import 'package:viewith/core/result/api_response_parser.dart';
import 'package:flutter/services.dart';
import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/data/auth/response/auth_response.dart';
import 'package:viewith/feature/auth/presentation/entity/User.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:viewith/network/client.dart';

import '../auth_repository.dart';

class RemoteAuthRepository extends AuthRepository {
  final Client _client;

  RemoteAuthRepository(this._client);

  @override
  Stream<User?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<User> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<Result<AuthResponse, BaseError>> signInWithKakao() async {
    try {
      kakao.OAuthToken token;
      if (await kakao.isKakaoTalkInstalled()) {
        token = await kakao.UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await _signInWithKakaoWeb();
      }

      final response = await _client.post(
        '/v1/members/login/KAKAO',
        queryParameters: {
          'access_token': token.accessToken,
          'refresh_token': token.refreshToken,
        },
        requiresAuth: false,
      );

      return response.toResult(fromJson: AuthResponse.fromJson);
    } catch (e, stackTrace) {
      log('Kakao sign-in failed: $e\n$stackTrace');
      return Failure(UnknownError());
    }
  }


  Future<kakao.OAuthToken> _signInWithKakaoWeb() async {
    try {
      // TODO: Viewit API 호출, Interface 변경
      kakao.OAuthToken token = await kakao.UserApi.instance.loginWithKakaoAccount();
      return token;
    } catch (error) {
      throw Exception('로그인에 실패하였습니다. 잠시 후 다시 시도해주세요.');
    }
  }

  @override
  Future<AuthenticatedUser> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
