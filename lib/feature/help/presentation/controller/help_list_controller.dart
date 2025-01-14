import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/data/help/help_repository_providers.dart';
import 'package:viewith/data/help/response/help_list_item.dart';

part 'help_list_controller.g.dart';

@riverpod
class HelpListController extends _$HelpListController {
  @override
  FutureOr<List<HelpListItem>> build() async {
    final result = await ref.read(helpRepositoryProvider).fetchHelpList();

    return result.match(
      onSuccess: (data) => data.list,
      onFailure: (error) => throw error,
    );
  }
}