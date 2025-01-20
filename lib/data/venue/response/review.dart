// review_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

part 'review.g.dart';

@freezed
class Review with _$Review {
  const factory Review({
    @JsonKey(name: 'review_id') required String reviewId,
    required String content,
    required double rating,
    @JsonKey(name: 'create_time') required int createTime,
    @JsonKey(name: 'image_list') required List<String> imageList,
    @JsonKey(name: 'user_info') required UserInfo userInfo,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'user_nickname') required String userNickname,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);
}

extension ReviewX on Review {
  DateTime get createdAt => DateTime.fromMillisecondsSinceEpoch(createTime * 1000);
}
