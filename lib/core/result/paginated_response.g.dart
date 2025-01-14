// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedResponseImpl<T> _$$PaginatedResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$PaginatedResponseImpl<T>(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      listSize: (json['list_size'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      hasNext: json['has_next'] as bool,
      list: fromJsonT(json['list']),
    );

Map<String, dynamic> _$$PaginatedResponseImplToJson<T>(
  _$PaginatedResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'list_size': instance.listSize,
      'total': instance.total,
      'has_next': instance.hasNext,
      'list': toJsonT(instance.list),
    };
