// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VenueImpl _$$VenueImplFromJson(Map<String, dynamic> json) => _$VenueImpl(
      venueId: (json['venue_id'] as num).toInt(),
      venueName: json['venue_name'] as String,
      venueLocation: json['venue_location'] as String,
      performances: (json['performances'] as List<dynamic>)
          .map((e) => Performance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VenueImplToJson(_$VenueImpl instance) =>
    <String, dynamic>{
      'venue_id': instance.venueId,
      'venue_name': instance.venueName,
      'venue_location': instance.venueLocation,
      'performances': instance.performances,
    };

_$PerformanceImpl _$$PerformanceImplFromJson(Map<String, dynamic> json) =>
    _$PerformanceImpl(
      artist: json['artist'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$PerformanceImplToJson(_$PerformanceImpl instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'image_url': instance.imageUrl,
    };
