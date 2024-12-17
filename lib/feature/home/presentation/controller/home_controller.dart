import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/feature/home/data/home_repository_providers.dart';
import 'package:viewith/feature/home/data/response/venue.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<List<Venue>> build() async {
    final result = await ref.read(homeRepositoryProvider).fetchVenues();

    return result.match(
      onSuccess: (venues) => venues,
      onFailure: (error) => throw error,
    );
  }
}
