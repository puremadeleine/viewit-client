import 'package:viewith/feature/auth/data/auth_repository.dart';

class AuthService {
  AuthService({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  Future<void> signInWithKakao() async {
    print('ddd');
    final result = await authRepository.signInWithKakao();
  }
}
