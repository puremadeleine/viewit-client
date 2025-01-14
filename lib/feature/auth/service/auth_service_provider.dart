import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/feature/auth/service/auth_service.dart';

import '../../../data/auth/auth_repository_providers.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(Ref ref) {
  return AuthService(authRepository: ref.watch(authRepositoryProvider));
}