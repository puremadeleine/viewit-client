import 'package:viewith/core/result/api_response_parser.dart';
import 'package:viewith/core/result/paginated_response.dart';
import 'package:viewith/data/help/help_repository.dart';
import 'package:viewith/data/help/response/help_list_item.dart';

import '../../../core/result/base_error.dart';
import '../../../core/result/result.dart';
import '../../../network/client.dart';

class RemoteHelpRepository implements HelpRepository {
  final Client _client;

  RemoteHelpRepository(this._client);

  @override
  Future<Result<PaginatedResponse<List<HelpListItem>>, BaseError>> fetchHelpList() async {
    final response = await _client.get('/v1/help/list');

    return response.toResult<PaginatedResponse<List<HelpListItem>>>(
      (data) => PaginatedResponse<List<HelpListItem>>
          .fromJson(data, (json) => (json as List<dynamic>)
          .map((item) => HelpListItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      ),
    );
  }

  @override
  Future<Result<HelpListItem, BaseError>> fetchHelp(String id) async {
    final response = await _client.get('/v1/help/$id');

    return response.toResult<HelpListItem>((json) => HelpListItem.fromJson(json));
  }

}
