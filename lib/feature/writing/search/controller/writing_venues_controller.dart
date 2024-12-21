import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/data/data/venue/venue_repository_providers.dart';

import '../../../../data/data/venue/response/venue.dart';

part 'writing_venues_controller.g.dart';

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void updateQuery(String newQuery) {
    state = newQuery;
  }
}


@riverpod
class WritingVenuesController extends _$WritingVenuesController {
  @override
  List<Venue> build()  {
    return [];
  }

  searchVenues(String keyword) async {
    // final query = ref.watch(searchQueryProvider);
    final result = await ref.read(venueRepositoryProvider).searchVenues(keyword);
    return result.match(
      onSuccess: (venues) {
        print('searchVenues $venues');
        state = venues;
        return venues;
      },
      onFailure: (error) => throw error,
    );
  }
}