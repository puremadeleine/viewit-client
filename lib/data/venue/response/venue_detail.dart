import 'package:freezed_annotation/freezed_annotation.dart';

part 'venue_detail.g.dart';

part 'venue_detail.freezed.dart';

@freezed
class VenueDetail with _$VenueDetail {
  const factory VenueDetail({
    @JsonKey(name: 'sections') required List<String> sections,
    @JsonKey(name: 'venue_url') required String seatmapUrl,
    @JsonKey(name: 'stages') required List<Stage> location,
  }) = _VenueDetail;

  factory VenueDetail.fromJson(Map<String, dynamic> json) => _$VenueDetailFromJson(json);
}

@freezed
class Stage with _$Stage {
  const factory Stage({
    @JsonKey(name: 'stage_id') required String stageId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'svg_url') required String url,
  }) = _Stage;

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);
}