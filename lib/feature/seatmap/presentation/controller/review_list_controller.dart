import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/data/venue/request/review_params.dart';
import 'package:viewith/data/venue/response/review.dart';
import 'package:viewith/data/venue/response/venue_detail.dart';
import 'package:viewith/feature/seatmap/presentation/controller/state/review_list_state.dart';

import '../../../../core/result/paginated_response.dart';
import '../../../../data/venue/venue_repository_providers.dart';

part 'review_list_controller.g.dart';

@riverpod
class ReviewListController extends _$ReviewListController {
  @override
  FutureOr<ReviewListState> build(String id) async {
    final venueResult = await ref.read(venueRepositoryProvider).fetchVenue(id);
    const params = ReviewParams();
    final reviewsResult = await ref.read(venueRepositoryProvider).fetchReviews(params);
    return Result.combine([venueResult, reviewsResult]).match<ReviewListState>(
      onSuccess: (results) {
        final VenueDetail seatInfo = results[0];
        final reviews = results[1] as PaginatedResponse<List<Review>>;
        return ReviewListState(
          seatInfo: AsyncData(seatInfo),
          reviews: AsyncData(reviews.list),
        );
      },
      onFailure: (error) => throw error,
    );
  }
}
