// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VenueDetailImpl _$$VenueDetailImplFromJson(Map<String, dynamic> json) =>
    _$VenueDetailImpl(
      sections:
          (json['sections'] as List<dynamic>).map((e) => e as String).toList(),
      seatmapUrl: json['venue_url'] as String,
      location: (json['stages'] as List<dynamic>)
          .map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VenueDetailImplToJson(_$VenueDetailImpl instance) =>
    <String, dynamic>{
      'sections': instance.sections,
      'venue_url': instance.seatmapUrl,
      'stages': instance.location,
    };

_$StageImpl _$$StageImplFromJson(Map<String, dynamic> json) => _$StageImpl(
      stageId: json['stage_id'] as String,
      name: json['name'] as String,
      url: json['svg_url'] as String,
    );

Map<String, dynamic> _$$StageImplToJson(_$StageImpl instance) =>
    <String, dynamic>{
      'stage_id': instance.stageId,
      'name': instance.name,
      'svg_url': instance.url,
    };
