import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/feature/auth/data/auth_repository.dart';
import 'package:viewith/feature/auth/data/remote/remote_auth_repository.dart';

part 'auth_repository_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return RemoteAuthRepository();
}