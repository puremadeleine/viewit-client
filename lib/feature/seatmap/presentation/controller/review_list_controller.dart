import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/data/venue/request/review_params.dart';
import 'package:viewith/data/venue/response/venue_detail.dart';
import 'package:viewith/feature/seatmap/presentation/controller/state/review_list_state.dart';

import '../../../../data/venue/venue_repository_providers.dart';

part 'review_list_controller.g.dart';

@riverpod
class ReviewListController extends _$ReviewListController {
  @override
  FutureOr<ReviewListState> build(String id) async {
    final venueResult = await ref.read(venueRepositoryProvider).fetchVenue(id);
    final reviewsResult = await ref.read(venueRepositoryProvider).fetchReviews(ReviewParams());

    return Result.combine([venueResult, reviewsResult]).match<ReviewListState>(
      onSuccess: (results) {
        final [seatInfo, reviews] = results;
        return ReviewListState(
          seatInfo: seatInfo,
          reviews: reviews,
        );
      },
      onFailure: (error) => throw error,
    );
  }
}
