// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VenueImpl _$$VenueImplFromJson(Map<String, dynamic> json) => _$VenueImpl(
      venueId: (json['venueId'] as num).toInt(),
      venueName: json['venueName'] as String,
      venueLocation: json['venueLocation'] as String,
      performances: (json['performances'] as List<dynamic>)
          .map((e) => Performance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VenueImplToJson(_$VenueImpl instance) =>
    <String, dynamic>{
      'venueId': instance.venueId,
      'venueName': instance.venueName,
      'venueLocation': instance.venueLocation,
      'performances': instance.performances,
    };

_$PerformanceImpl _$$PerformanceImplFromJson(Map<String, dynamic> json) =>
    _$PerformanceImpl(
      artist: json['artist'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$PerformanceImplToJson(_$PerformanceImpl instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'imageUrl': instance.imageUrl,
    };
