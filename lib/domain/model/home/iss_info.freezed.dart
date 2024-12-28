// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iss_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IssInfo _$IssInfoFromJson(Map<String, dynamic> json) {
  return _ISSInfo.fromJson(json);
}

/// @nodoc
mixin _$IssInfo {
  double get latitude => throw _privateConstructorUsedError; // ISS latitude
  double get longitude => throw _privateConstructorUsedError; // ISS longitude
  int get timestamp =>
      throw _privateConstructorUsedError; // Last update timestamp (seconds since epoch)
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this IssInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IssInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IssInfoCopyWith<IssInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssInfoCopyWith<$Res> {
  factory $IssInfoCopyWith(IssInfo value, $Res Function(IssInfo) then) =
      _$IssInfoCopyWithImpl<$Res, IssInfo>;
  @useResult
  $Res call(
      {double latitude, double longitude, int timestamp, String? country});
}

/// @nodoc
class _$IssInfoCopyWithImpl<$Res, $Val extends IssInfo>
    implements $IssInfoCopyWith<$Res> {
  _$IssInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IssInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ISSInfoImplCopyWith<$Res> implements $IssInfoCopyWith<$Res> {
  factory _$$ISSInfoImplCopyWith(
          _$ISSInfoImpl value, $Res Function(_$ISSInfoImpl) then) =
      __$$ISSInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude, double longitude, int timestamp, String? country});
}

/// @nodoc
class __$$ISSInfoImplCopyWithImpl<$Res>
    extends _$IssInfoCopyWithImpl<$Res, _$ISSInfoImpl>
    implements _$$ISSInfoImplCopyWith<$Res> {
  __$$ISSInfoImplCopyWithImpl(
      _$ISSInfoImpl _value, $Res Function(_$ISSInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of IssInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? timestamp = null,
    Object? country = freezed,
  }) {
    return _then(_$ISSInfoImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ISSInfoImpl extends _ISSInfo {
  const _$ISSInfoImpl(
      {required this.latitude,
      required this.longitude,
      required this.timestamp,
      this.country})
      : super._();

  factory _$ISSInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ISSInfoImplFromJson(json);

  @override
  final double latitude;
// ISS latitude
  @override
  final double longitude;
// ISS longitude
  @override
  final int timestamp;
// Last update timestamp (seconds since epoch)
  @override
  final String? country;

  @override
  String toString() {
    return 'IssInfo(latitude: $latitude, longitude: $longitude, timestamp: $timestamp, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ISSInfoImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, timestamp, country);

  /// Create a copy of IssInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ISSInfoImplCopyWith<_$ISSInfoImpl> get copyWith =>
      __$$ISSInfoImplCopyWithImpl<_$ISSInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ISSInfoImplToJson(
      this,
    );
  }
}

abstract class _ISSInfo extends IssInfo {
  const factory _ISSInfo(
      {required final double latitude,
      required final double longitude,
      required final int timestamp,
      final String? country}) = _$ISSInfoImpl;
  const _ISSInfo._() : super._();

  factory _ISSInfo.fromJson(Map<String, dynamic> json) = _$ISSInfoImpl.fromJson;

  @override
  double get latitude; // ISS latitude
  @override
  double get longitude; // ISS longitude
  @override
  int get timestamp; // Last update timestamp (seconds since epoch)
  @override
  String? get country;

  /// Create a copy of IssInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ISSInfoImplCopyWith<_$ISSInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
