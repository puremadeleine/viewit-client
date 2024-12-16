import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/di/app_providers.dart';
import 'package:viewith/feature/home/data/home_repository.dart';
import 'package:viewith/feature/home/data/remote/remote_home_repository.dart';

part 'home_repository_providers.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return RemoteHomeRepository(ref.read(clientProvider));
}