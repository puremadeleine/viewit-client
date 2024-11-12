import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/result.dart';

abstract class HomeRepository {
  Future<Result<void, BaseError>> fetchVenues();
}