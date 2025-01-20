import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/paginated_response.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/data/venue/response/venue_detail.dart';

import 'request/review_params.dart';
import 'response/review.dart';
import 'response/venue.dart';

abstract class VenueRepository {
  Future<Result<VenueDetail, BaseError>> fetchVenue(String id);

  Future<Result<List<Venue>, BaseError>> fetchVenues();

  Future<Result<PaginatedResponse<List<Review>>, BaseError>> fetchReviews(ReviewParams params);

  Future<Result<List<Venue>, BaseError>> searchVenues(String keyword);
}