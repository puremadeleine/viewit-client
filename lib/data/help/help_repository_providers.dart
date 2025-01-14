import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/data/help/help_repository.dart';
import 'package:viewith/data/help/remote/remote_help_repository.dart';
import 'package:viewith/di/app_providers.dart';

part 'help_repository_providers.g.dart';

@riverpod
HelpRepository helpRepository(Ref ref) {
  return RemoteHelpRepository(ref.read(clientProvider));
}