import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/network/client.dart';

import '../response/venue.dart';
import '../venue_repository.dart';

class TestVenueRepository extends VenueRepository {
  final Client _client;

  TestVenueRepository(this._client);

  @override
  Future<Result<List<Venue>, BaseError>> searchVenues(String keyword) async {
    return Success([]);
  }

  @override
  Future<Result<List<Venue>, BaseError>> fetchVenues() {
    // TODO: implement fetchVenues
    throw UnimplementedError();
  }
}
