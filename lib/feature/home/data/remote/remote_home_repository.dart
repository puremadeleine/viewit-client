import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/feature/home/data/home_repository.dart';
import 'package:viewith/feature/home/data/response/venue.dart';
import 'package:viewith/network/client.dart';

class RemoteHomeRepository extends HomeRepository {
  final Client _client;

  RemoteHomeRepository(this._client);

  @override
  Future<Result<List<Venue>, BaseError>> fetchVenues() async {
    final response = await _client.get('/v1/venues');
    return response.data.toResult((json) => (json['venues'] as List<dynamic>).map((venue) => Venue.fromJson(venue)).toList());
  }
}
