import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/feature/home/data/response/venue.dart';

abstract class HomeRepository {
  Future<Result<List<Venue>, BaseError>> fetchVenues();
}