import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/result.dart';

import 'response/venue.dart';

abstract class VenueRepository {
  Future<Result<List<Venue>, BaseError>> fetchVenues();

  Future<Result<List<Venue>, BaseError>> searchVenues(String keyword);
}