import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/data/venue/response/venue.dart';
import '../../../../data/data/venue/venue_repository_providers.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<List<Venue>> build() async {
    final result = await ref.read(venueRepositoryProvider).fetchVenues();

    return result.match(
      onSuccess: (venues) => venues,
      onFailure: (error) => throw error,
    );
  }
}
