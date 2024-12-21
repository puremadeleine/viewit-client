import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/network/client.dart';

import '../response/venue.dart';
import '../venue_repository.dart';

class RemoteVenueRepository extends VenueRepository {
  final Client _client;

  RemoteVenueRepository(this._client);

  @override
  Future<Result<List<Venue>, BaseError>> fetchVenues() async {
    final response = await _client.get('/v1/venues');
    final List<dynamic> json = response.data['venues'];
    final venues = json.map((json) => Venue.fromJson(json)).toList();
    return Success(venues);
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
