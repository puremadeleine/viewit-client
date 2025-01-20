import 'package:viewith/core/result/api_response_parser.dart';
import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/paginated_response.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/data/venue/request/review_params.dart';
import 'package:viewith/data/venue/response/review.dart';
import 'package:viewith/data/venue/response/venue_detail.dart';
import 'package:viewith/network/client.dart';

import '../response/venue.dart';
import '../venue_repository.dart';

class RemoteVenueRepository extends VenueRepository {
  final Client _client;

  RemoteVenueRepository(this._client);

  @override
  Future<Result<List<Venue>, BaseError>> fetchVenues() async {
    final response = await _client.get('/v1/venues');
    final result = response.toListResult(fromJson: Venue.fromJson, key: 'venues');
    return result;
  }

  @override
  Future<Result<List<Venue>, BaseError>> searchVenues(String keyword) async {
    // final response = await _client.get('/v1/venues/search');
    // final List<dynamic> json = response.data['list'];
    // final venues = json.map((json) => Venue.fromJson(json)).toList();
    return Success([
      Venue(id: 123, name: "장충체육관", location: "서울시 중구 동호로"),
      Venue(id: 125, name: "장충체육관", location: "서울시 중구 동호로"),
    ]);
  }
}
