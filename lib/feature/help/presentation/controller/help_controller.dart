import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/data/help/help_repository_providers.dart';
import 'package:viewith/data/help/response/help_list_item.dart';

part 'help_controller.g.dart';

@riverpod
class HelpController extends _$HelpController {
  @override
  FutureOr<HelpListItem> build() async {
    final result = await ref.read(helpRepositoryProvider).fetchHelp('1');

    return result.match(
      onSuccess: (data) => data,
      onFailure: (error) => throw error,
    );
  }
}