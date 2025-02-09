// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  @JsonKey(name: 'review_id')
  int get reviewId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_time')
  int get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_list')
  List<String> get imageList => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_info')
  UserInfo get userInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'seat_info')
  SeatInfo get seatInfo => throw _privateConstructorUsedError;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {@JsonKey(name: 'review_id') int reviewId,
      String content,
      double rating,
      @JsonKey(name: 'create_time') int createTime,
      @JsonKey(name: 'image_list') List<String> imageList,
      @JsonKey(name: 'user_info') UserInfo userInfo,
      @JsonKey(name: 'seat_info') SeatInfo seatInfo});

  $UserInfoCopyWith<$Res> get userInfo;
  $SeatInfoCopyWith<$Res> get seatInfo;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? content = null,
    Object? rating = null,
    Object? createTime = null,
    Object? imageList = null,
    Object? userInfo = null,
    Object? seatInfo = null,
  }) {
    return _then(_value.copyWith(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
      imageList: null == imageList
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      seatInfo: null == seatInfo
          ? _value.seatInfo
          : seatInfo // ignore: cast_nullable_to_non_nullable
              as SeatInfo,
    ) as $Val);
  }

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeatInfoCopyWith<$Res> get seatInfo {
    return $SeatInfoCopyWith<$Res>(_value.seatInfo, (value) {
      return _then(_value.copyWith(seatInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'review_id') int reviewId,
      String content,
      double rating,
      @JsonKey(name: 'create_time') int createTime,
      @JsonKey(name: 'image_list') List<String> imageList,
      @JsonKey(name: 'user_info') UserInfo userInfo,
      @JsonKey(name: 'seat_info') SeatInfo seatInfo});

  @override
  $UserInfoCopyWith<$Res> get userInfo;
  @override
  $SeatInfoCopyWith<$Res> get seatInfo;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewId = null,
    Object? content = null,
    Object? rating = null,
    Object? createTime = null,
    Object? imageList = null,
    Object? userInfo = null,
    Object? seatInfo = null,
  }) {
    return _then(_$ReviewImpl(
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as int,
      imageList: null == imageList
          ? _value._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      seatInfo: null == seatInfo
          ? _value.seatInfo
          : seatInfo // ignore: cast_nullable_to_non_nullable
              as SeatInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl(
      {@JsonKey(name: 'review_id') required this.reviewId,
      required this.content,
      required this.rating,
      @JsonKey(name: 'create_time') required this.createTime,
      @JsonKey(name: 'image_list') required final List<String> imageList,
      @JsonKey(name: 'user_info') required this.userInfo,
      @JsonKey(name: 'seat_info') required this.seatInfo})
      : _imageList = imageList;

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  @JsonKey(name: 'review_id')
  final int reviewId;
  @override
  final String content;
  @override
  final double rating;
  @override
  @JsonKey(name: 'create_time')
  final int createTime;
  final List<String> _imageList;
  @override
  @JsonKey(name: 'image_list')
  List<String> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  @override
  @JsonKey(name: 'user_info')
  final UserInfo userInfo;
  @override
  @JsonKey(name: 'seat_info')
  final SeatInfo seatInfo;

  @override
  String toString() {
    return 'Review(reviewId: $reviewId, content: $content, rating: $rating, createTime: $createTime, imageList: $imageList, userInfo: $userInfo, seatInfo: $seatInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.seatInfo, seatInfo) ||
                other.seatInfo == seatInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewId,
      content,
      rating,
      createTime,
      const DeepCollectionEquality().hash(_imageList),
      userInfo,
      seatInfo);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review implements Review {
  const factory _Review(
          {@JsonKey(name: 'review_id') required final int reviewId,
          required final String content,
          required final double rating,
          @JsonKey(name: 'create_time') required final int createTime,
          @JsonKey(name: 'image_list') required final List<String> imageList,
          @JsonKey(name: 'user_info') required final UserInfo userInfo,
          @JsonKey(name: 'seat_info') required final SeatInfo seatInfo}) =
      _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  @JsonKey(name: 'review_id')
  int get reviewId;
  @override
  String get content;
  @override
  double get rating;
  @override
  @JsonKey(name: 'create_time')
  int get createTime;
  @override
  @JsonKey(name: 'image_list')
  List<String> get imageList;
  @override
  @JsonKey(name: 'user_info')
  UserInfo get userInfo;
  @override
  @JsonKey(name: 'seat_info')
  SeatInfo get seatInfo;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$UserInfo {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_nickname')
  String get userNickname => throw _privateConstructorUsedError;

  /// Serializes this UserInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'user_nickname') String userNickname});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userNickname = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userNickname: null == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $UserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'user_nickname') String userNickname});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userNickname = null,
  }) {
    return _then(_$UserInfoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userNickname: null == userNickname
          ? _value.userNickname
          : userNickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl implements _UserInfo {
  const _$UserInfoImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'user_nickname') required this.userNickname});

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'user_nickname')
  final String userNickname;

  @override
  String toString() {
    return 'UserInfo(userId: $userId, userNickname: $userNickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userNickname, userNickname) ||
                other.userNickname == userNickname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userNickname);

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
          {@JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'user_nickname') required final String userNickname}) =
      _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'user_nickname')
  String get userNickname;

  /// Create a copy of UserInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeatInfo _$SeatInfoFromJson(Map<String, dynamic> json) {
  return _SeatInfo.fromJson(json);
}

/// @nodoc
mixin _$SeatInfo {
  @JsonKey(name: 'floor')
  String get floor => throw _privateConstructorUsedError;
  @JsonKey(name: 'section')
  String get section => throw _privateConstructorUsedError;
  @JsonKey(name: 'seat_row')
  int get row => throw _privateConstructorUsedError;
  @JsonKey(name: 'seat_column')
  int get column => throw _privateConstructorUsedError;
  @JsonKey(name: 'block')
  String? get block => throw _privateConstructorUsedError;

  /// Serializes this SeatInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeatInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeatInfoCopyWith<SeatInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeatInfoCopyWith<$Res> {
  factory $SeatInfoCopyWith(SeatInfo value, $Res Function(SeatInfo) then) =
      _$SeatInfoCopyWithImpl<$Res, SeatInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'floor') String floor,
      @JsonKey(name: 'section') String section,
      @JsonKey(name: 'seat_row') int row,
      @JsonKey(name: 'seat_column') int column,
      @JsonKey(name: 'block') String? block});
}

/// @nodoc
class _$SeatInfoCopyWithImpl<$Res, $Val extends SeatInfo>
    implements $SeatInfoCopyWith<$Res> {
  _$SeatInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeatInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
    Object? section = null,
    Object? row = null,
    Object? column = null,
    Object? block = freezed,
  }) {
    return _then(_value.copyWith(
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
      block: freezed == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeatInfoImplCopyWith<$Res>
    implements $SeatInfoCopyWith<$Res> {
  factory _$$SeatInfoImplCopyWith(
          _$SeatInfoImpl value, $Res Function(_$SeatInfoImpl) then) =
      __$$SeatInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'floor') String floor,
      @JsonKey(name: 'section') String section,
      @JsonKey(name: 'seat_row') int row,
      @JsonKey(name: 'seat_column') int column,
      @JsonKey(name: 'block') String? block});
}

/// @nodoc
class __$$SeatInfoImplCopyWithImpl<$Res>
    extends _$SeatInfoCopyWithImpl<$Res, _$SeatInfoImpl>
    implements _$$SeatInfoImplCopyWith<$Res> {
  __$$SeatInfoImplCopyWithImpl(
      _$SeatInfoImpl _value, $Res Function(_$SeatInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeatInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
    Object? section = null,
    Object? row = null,
    Object? column = null,
    Object? block = freezed,
  }) {
    return _then(_$SeatInfoImpl(
      floor: null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as String,
      section: null == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
      block: freezed == block
          ? _value.block
          : block // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeatInfoImpl implements _SeatInfo {
  const _$SeatInfoImpl(
      {@JsonKey(name: 'floor') required this.floor,
      @JsonKey(name: 'section') required this.section,
      @JsonKey(name: 'seat_row') required this.row,
      @JsonKey(name: 'seat_column') required this.column,
      @JsonKey(name: 'block') this.block});

  factory _$SeatInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeatInfoImplFromJson(json);

  @override
  @JsonKey(name: 'floor')
  final String floor;
  @override
  @JsonKey(name: 'section')
  final String section;
  @override
  @JsonKey(name: 'seat_row')
  final int row;
  @override
  @JsonKey(name: 'seat_column')
  final int column;
  @override
  @JsonKey(name: 'block')
  final String? block;

  @override
  String toString() {
    return 'SeatInfo(floor: $floor, section: $section, row: $row, column: $column, block: $block)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeatInfoImpl &&
            (identical(other.floor, floor) || other.floor == floor) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.column, column) || other.column == column) &&
            (identical(other.block, block) || other.block == block));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, floor, section, row, column, block);

  /// Create a copy of SeatInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeatInfoImplCopyWith<_$SeatInfoImpl> get copyWith =>
      __$$SeatInfoImplCopyWithImpl<_$SeatInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeatInfoImplToJson(
      this,
    );
  }
}

abstract class _SeatInfo implements SeatInfo {
  const factory _SeatInfo(
      {@JsonKey(name: 'floor') required final String floor,
      @JsonKey(name: 'section') required final String section,
      @JsonKey(name: 'seat_row') required final int row,
      @JsonKey(name: 'seat_column') required final int column,
      @JsonKey(name: 'block') final String? block}) = _$SeatInfoImpl;

  factory _SeatInfo.fromJson(Map<String, dynamic> json) =
      _$SeatInfoImpl.fromJson;

  @override
  @JsonKey(name: 'floor')
  String get floor;
  @override
  @JsonKey(name: 'section')
  String get section;
  @override
  @JsonKey(name: 'seat_row')
  int get row;
  @override
  @JsonKey(name: 'seat_column')
  int get column;
  @override
  @JsonKey(name: 'block')
  String? get block;

  /// Create a copy of SeatInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeatInfoImplCopyWith<_$SeatInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
