import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_response.freezed.dart';
part 'paginated_response.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    @JsonKey(name: 'page') required int page,
    @JsonKey(name: 'size') required int size,
    @JsonKey(name: 'list_size') required int listSize,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'has_next') required bool hasNext,
    @JsonKey(name: 'list') required T list,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedResponseFromJson(json, fromJsonT);
}
