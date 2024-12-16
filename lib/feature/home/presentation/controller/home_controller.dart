import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/feature/home/data/home_repository_providers.dart';
import 'package:viewith/feature/home/data/response/venue.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  AsyncValue<List<Venue>> build() => const AsyncValue.data([]);

  Future<void> fetchVenues() async {
    state = const AsyncValue.loading();
    final result = await ref.read(homeRepositoryProvider).fetchVenues();
    result.match(
      onSuccess: (data) {
        state = AsyncValue.data(data);
      },
      onFailure: (error) {

      },
    );
  }
}
