import 'package:viewith/core/result/base_error.dart';
import 'package:viewith/core/result/paginated_response.dart';
import 'package:viewith/core/result/result.dart';
import 'package:viewith/data/help/response/help_list_item.dart';

abstract interface class HelpRepository {
  Future<Result<PaginatedResponse<List<HelpListItem>>, BaseError>> fetchHelpList();
}