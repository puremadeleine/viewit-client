// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      reviewId: json['review_id'] as String,
      content: json['content'] as String,
      rating: (json['rating'] as num).toDouble(),
      createTime: (json['create_time'] as num).toInt(),
      imageList: (json['image_list'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userInfo: UserInfo.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'review_id': instance.reviewId,
      'content': instance.content,
      'rating': instance.rating,
      'create_time': instance.createTime,
      'image_list': instance.imageList,
      'user_info': instance.userInfo,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      userId: json['user_id'] as String,
      userNickname: json['user_nickname'] as String,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_nickname': instance.userNickname,
    };
