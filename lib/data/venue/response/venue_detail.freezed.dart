// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'venue_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VenueDetail _$VenueDetailFromJson(Map<String, dynamic> json) {
  return _VenueDetail.fromJson(json);
}

/// @nodoc
mixin _$VenueDetail {
  @JsonKey(name: 'sections')
  List<String> get sections => throw _privateConstructorUsedError;
  @JsonKey(name: 'venue_url')
  String get seatmapUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'stages')
  List<Stage> get location => throw _privateConstructorUsedError;

  /// Serializes this VenueDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VenueDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VenueDetailCopyWith<VenueDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VenueDetailCopyWith<$Res> {
  factory $VenueDetailCopyWith(
          VenueDetail value, $Res Function(VenueDetail) then) =
      _$VenueDetailCopyWithImpl<$Res, VenueDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sections') List<String> sections,
      @JsonKey(name: 'venue_url') String seatmapUrl,
      @JsonKey(name: 'stages') List<Stage> location});
}

/// @nodoc
class _$VenueDetailCopyWithImpl<$Res, $Val extends VenueDetail>
    implements $VenueDetailCopyWith<$Res> {
  _$VenueDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VenueDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
    Object? seatmapUrl = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seatmapUrl: null == seatmapUrl
          ? _value.seatmapUrl
          : seatmapUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<Stage>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VenueDetailImplCopyWith<$Res>
    implements $VenueDetailCopyWith<$Res> {
  factory _$$VenueDetailImplCopyWith(
          _$VenueDetailImpl value, $Res Function(_$VenueDetailImpl) then) =
      __$$VenueDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sections') List<String> sections,
      @JsonKey(name: 'venue_url') String seatmapUrl,
      @JsonKey(name: 'stages') List<Stage> location});
}

/// @nodoc
class __$$VenueDetailImplCopyWithImpl<$Res>
    extends _$VenueDetailCopyWithImpl<$Res, _$VenueDetailImpl>
    implements _$$VenueDetailImplCopyWith<$Res> {
  __$$VenueDetailImplCopyWithImpl(
      _$VenueDetailImpl _value, $Res Function(_$VenueDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of VenueDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sections = null,
    Object? seatmapUrl = null,
    Object? location = null,
  }) {
    return _then(_$VenueDetailImpl(
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seatmapUrl: null == seatmapUrl
          ? _value.seatmapUrl
          : seatmapUrl // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<Stage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VenueDetailImpl implements _VenueDetail {
  const _$VenueDetailImpl(
      {@JsonKey(name: 'sections') required final List<String> sections,
      @JsonKey(name: 'venue_url') required this.seatmapUrl,
      @JsonKey(name: 'stages') required final List<Stage> location})
      : _sections = sections,
        _location = location;

  factory _$VenueDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$VenueDetailImplFromJson(json);

  final List<String> _sections;
  @override
  @JsonKey(name: 'sections')
  List<String> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  @JsonKey(name: 'venue_url')
  final String seatmapUrl;
  final List<Stage> _location;
  @override
  @JsonKey(name: 'stages')
  List<Stage> get location {
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_location);
  }

  @override
  String toString() {
    return 'VenueDetail(sections: $sections, seatmapUrl: $seatmapUrl, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VenueDetailImpl &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            (identical(other.seatmapUrl, seatmapUrl) ||
                other.seatmapUrl == seatmapUrl) &&
            const DeepCollectionEquality().equals(other._location, _location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_sections),
      seatmapUrl,
      const DeepCollectionEquality().hash(_location));

  /// Create a copy of VenueDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VenueDetailImplCopyWith<_$VenueDetailImpl> get copyWith =>
      __$$VenueDetailImplCopyWithImpl<_$VenueDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VenueDetailImplToJson(
      this,
    );
  }
}

abstract class _VenueDetail implements VenueDetail {
  const factory _VenueDetail(
          {@JsonKey(name: 'sections') required final List<String> sections,
          @JsonKey(name: 'venue_url') required final String seatmapUrl,
          @JsonKey(name: 'stages') required final List<Stage> location}) =
      _$VenueDetailImpl;

  factory _VenueDetail.fromJson(Map<String, dynamic> json) =
      _$VenueDetailImpl.fromJson;

  @override
  @JsonKey(name: 'sections')
  List<String> get sections;
  @override
  @JsonKey(name: 'venue_url')
  String get seatmapUrl;
  @override
  @JsonKey(name: 'stages')
  List<Stage> get location;

  /// Create a copy of VenueDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VenueDetailImplCopyWith<_$VenueDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Stage _$StageFromJson(Map<String, dynamic> json) {
  return _Stage.fromJson(json);
}

/// @nodoc
mixin _$Stage {
  @JsonKey(name: 'stage_id')
  String get stageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'svg_url')
  String get url => throw _privateConstructorUsedError;

  /// Serializes this Stage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StageCopyWith<Stage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageCopyWith<$Res> {
  factory $StageCopyWith(Stage value, $Res Function(Stage) then) =
      _$StageCopyWithImpl<$Res, Stage>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stage_id') String stageId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'svg_url') String url});
}

/// @nodoc
class _$StageCopyWithImpl<$Res, $Val extends Stage>
    implements $StageCopyWith<$Res> {
  _$StageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageId = null,
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StageImplCopyWith<$Res> implements $StageCopyWith<$Res> {
  factory _$$StageImplCopyWith(
          _$StageImpl value, $Res Function(_$StageImpl) then) =
      __$$StageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stage_id') String stageId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'svg_url') String url});
}

/// @nodoc
class __$$StageImplCopyWithImpl<$Res>
    extends _$StageCopyWithImpl<$Res, _$StageImpl>
    implements _$$StageImplCopyWith<$Res> {
  __$$StageImplCopyWithImpl(
      _$StageImpl _value, $Res Function(_$StageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stageId = null,
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$StageImpl(
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StageImpl implements _Stage {
  const _$StageImpl(
      {@JsonKey(name: 'stage_id') required this.stageId,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'svg_url') required this.url});

  factory _$StageImpl.fromJson(Map<String, dynamic> json) =>
      _$$StageImplFromJson(json);

  @override
  @JsonKey(name: 'stage_id')
  final String stageId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'svg_url')
  final String url;

  @override
  String toString() {
    return 'Stage(stageId: $stageId, name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StageImpl &&
            (identical(other.stageId, stageId) || other.stageId == stageId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, stageId, name, url);

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StageImplCopyWith<_$StageImpl> get copyWith =>
      __$$StageImplCopyWithImpl<_$StageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StageImplToJson(
      this,
    );
  }
}

abstract class _Stage implements Stage {
  const factory _Stage(
      {@JsonKey(name: 'stage_id') required final String stageId,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'svg_url') required final String url}) = _$StageImpl;

  factory _Stage.fromJson(Map<String, dynamic> json) = _$StageImpl.fromJson;

  @override
  @JsonKey(name: 'stage_id')
  String get stageId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'svg_url')
  String get url;

  /// Create a copy of Stage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StageImplCopyWith<_$StageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
