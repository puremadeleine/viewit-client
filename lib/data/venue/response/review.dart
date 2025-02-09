// review_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'review.freezed.dart';

part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    @JsonKey(name: 'review_id') required int reviewId,
    required String content,
    required double rating,
    @JsonKey(name: 'create_time') required int createTime,
    @JsonKey(name: 'image_list') required List<String> imageList,
    @JsonKey(name: 'user_info') required UserInfo userInfo,
    @JsonKey(name: 'seat_info') required SeatInfo seatInfo,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'user_nickname') required String userNickname,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}

@freezed
class SeatInfo with _$SeatInfo {
  const factory SeatInfo({
    @JsonKey(name: 'floor') required String floor,
    @JsonKey(name: 'section') required String section,
    @JsonKey(name: 'seat_row') required int row,
    @JsonKey(name: 'seat_column') required int column,
    @JsonKey(name: 'block') String? block,
  }) = _SeatInfo;

  factory SeatInfo.fromJson(Map<String, dynamic> json) => _$SeatInfoFromJson(json);
}

extension ReviewX on Review {
  String get createdAt {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(createTime);
    String formattedDate = DateFormat('yyyy년 MM월 dd일').format(dateTime);
    return formattedDate;
  }

  String get seatName => '${seatInfo.section}구역 ${seatInfo.row}열 ${seatInfo.column}번';
}
