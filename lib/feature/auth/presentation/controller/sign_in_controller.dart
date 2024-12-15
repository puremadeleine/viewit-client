import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/feature/auth/service/auth_service_provider.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInScreenController extends _$SignInScreenController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> signInWithKakao() async {
    final authService = ref.read(authServiceProvider);
    state = await AsyncValue.guard(
      () {
        return authService.signInWithKakao();
      },
    );
  }
}
