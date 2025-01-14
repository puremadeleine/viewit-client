import 'package:viewith/feature/auth/presentation/entity/User.dart';

abstract class AuthRepository {
  Stream<User?> authStateChanges();

  Future<void> signInWithKakao();

  Future<AuthenticatedUser> signInWithApple();

  Future<User> signInAnonymously();

  Future<void> signOut();
}