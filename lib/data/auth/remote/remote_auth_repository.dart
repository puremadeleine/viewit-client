import 'package:flutter/services.dart';
import 'package:viewith/feature/auth/presentation/entity/User.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import '../auth_repository.dart';

class RemoteAuthRepository extends AuthRepository {
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
  Future<void> signInWithKakao() async {
    if (await kakao.isKakaoTalkInstalled()) {
      try {
        kakao.OAuthToken token = await kakao.UserApi.instance.loginWithKakaoTalk();
        print(token);
      } catch (error) {
        if (error is PlatformException && error.code == 'CANCELED') {
          throw Exception('로그인이 취소되었습니다.');
        }

        // in case of not existing kakao account connected with kakaoTalk,
        // try login in web
        _signInWithKakaoWeb();
      }
    } else {
      _signInWithKakaoWeb();
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
