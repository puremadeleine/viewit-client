import 'package:freezed_annotation/freezed_annotation.dart';

part 'venue.freezed.dart';
part 'venue.g.dart';

@freezed
class Venue with _$Venue {
  const factory Venue({
    required int venueId,
    required String venueName,
    required String venueLocation,
    required List<Performance> performances,
  }) = _Venue;

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);
}

@freezed
class Performance with _$Performance {
  const factory Performance({
    required String artist,
    required String imageUrl,
  }) = _Performance;

  factory Performance.fromJson(Map<String, dynamic> json) =>
      _$PerformanceFromJson(json);
}