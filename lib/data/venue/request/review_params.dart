import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_params.freezed.dart';

@freezed
class ReviewParams with _$ReviewParams {
  const factory ReviewParams({
    @Default(1) int page,
    @Default(10) int size,
    @Default(ReviewSortType.latest) ReviewSortType sortType,
    @Default('1') String floor,
    String? section,
    int? seatRow,
    @Default(false) bool isSummary,
  }) = _ReviewParams;
}

enum ReviewSortType {
  @JsonValue('DEFAULT')
  defaultSort,
  @JsonValue('LATEST')
  latest,
  @JsonValue('RATING')
  rating;

  String get name {
  switch (this) {
    case ReviewSortType.defaultSort:
      return "기본순";
    case ReviewSortType.latest:
      return "최신순";
    case ReviewSortType.rating:
      return "별점순";
  }
}
}