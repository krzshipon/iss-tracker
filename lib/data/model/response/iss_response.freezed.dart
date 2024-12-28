// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iss_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ISSLocationResponse _$ISSLocationResponseFromJson(Map<String, dynamic> json) {
  return _ISSLocationResponse.fromJson(json);
}

/// @nodoc
mixin _$ISSLocationResponse {
  String get message => throw _privateConstructorUsedError;
  int get timestamp =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'iss_position')
  ISSPosition get issPosition => throw _privateConstructorUsedError;

  /// Serializes this ISSLocationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ISSLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ISSLocationResponseCopyWith<ISSLocationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ISSLocationResponseCopyWith<$Res> {
  factory $ISSLocationResponseCopyWith(
          ISSLocationResponse value, $Res Function(ISSLocationResponse) then) =
      _$ISSLocationResponseCopyWithImpl<$Res, ISSLocationResponse>;
  @useResult
  $Res call(
      {String message,
      int timestamp,
      @JsonKey(name: 'iss_position') ISSPosition issPosition});

  $ISSPositionCopyWith<$Res> get issPosition;
}

/// @nodoc
class _$ISSLocationResponseCopyWithImpl<$Res, $Val extends ISSLocationResponse>
    implements $ISSLocationResponseCopyWith<$Res> {
  _$ISSLocationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ISSLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? timestamp = null,
    Object? issPosition = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      issPosition: null == issPosition
          ? _value.issPosition
          : issPosition // ignore: cast_nullable_to_non_nullable
              as ISSPosition,
    ) as $Val);
  }

  /// Create a copy of ISSLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ISSPositionCopyWith<$Res> get issPosition {
    return $ISSPositionCopyWith<$Res>(_value.issPosition, (value) {
      return _then(_value.copyWith(issPosition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ISSLocationResponseImplCopyWith<$Res>
    implements $ISSLocationResponseCopyWith<$Res> {
  factory _$$ISSLocationResponseImplCopyWith(_$ISSLocationResponseImpl value,
          $Res Function(_$ISSLocationResponseImpl) then) =
      __$$ISSLocationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      int timestamp,
      @JsonKey(name: 'iss_position') ISSPosition issPosition});

  @override
  $ISSPositionCopyWith<$Res> get issPosition;
}

/// @nodoc
class __$$ISSLocationResponseImplCopyWithImpl<$Res>
    extends _$ISSLocationResponseCopyWithImpl<$Res, _$ISSLocationResponseImpl>
    implements _$$ISSLocationResponseImplCopyWith<$Res> {
  __$$ISSLocationResponseImplCopyWithImpl(_$ISSLocationResponseImpl _value,
      $Res Function(_$ISSLocationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ISSLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? timestamp = null,
    Object? issPosition = null,
  }) {
    return _then(_$ISSLocationResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      issPosition: null == issPosition
          ? _value.issPosition
          : issPosition // ignore: cast_nullable_to_non_nullable
              as ISSPosition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ISSLocationResponseImpl implements _ISSLocationResponse {
  const _$ISSLocationResponseImpl(
      {required this.message,
      required this.timestamp,
      @JsonKey(name: 'iss_position') required this.issPosition});

  factory _$ISSLocationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ISSLocationResponseImplFromJson(json);

  @override
  final String message;
  @override
  final int timestamp;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'iss_position')
  final ISSPosition issPosition;

  @override
  String toString() {
    return 'ISSLocationResponse(message: $message, timestamp: $timestamp, issPosition: $issPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ISSLocationResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.issPosition, issPosition) ||
                other.issPosition == issPosition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, timestamp, issPosition);

  /// Create a copy of ISSLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ISSLocationResponseImplCopyWith<_$ISSLocationResponseImpl> get copyWith =>
      __$$ISSLocationResponseImplCopyWithImpl<_$ISSLocationResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ISSLocationResponseImplToJson(
      this,
    );
  }
}

abstract class _ISSLocationResponse implements ISSLocationResponse {
  const factory _ISSLocationResponse(
      {required final String message,
      required final int timestamp,
      @JsonKey(name: 'iss_position')
      required final ISSPosition issPosition}) = _$ISSLocationResponseImpl;

  factory _ISSLocationResponse.fromJson(Map<String, dynamic> json) =
      _$ISSLocationResponseImpl.fromJson;

  @override
  String get message;
  @override
  int get timestamp; // ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'iss_position')
  ISSPosition get issPosition;

  /// Create a copy of ISSLocationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ISSLocationResponseImplCopyWith<_$ISSLocationResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ISSPosition _$ISSPositionFromJson(Map<String, dynamic> json) {
  return _ISSPosition.fromJson(json);
}

/// @nodoc
mixin _$ISSPosition {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  /// Serializes this ISSPosition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ISSPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ISSPositionCopyWith<ISSPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ISSPositionCopyWith<$Res> {
  factory $ISSPositionCopyWith(
          ISSPosition value, $Res Function(ISSPosition) then) =
      _$ISSPositionCopyWithImpl<$Res, ISSPosition>;
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class _$ISSPositionCopyWithImpl<$Res, $Val extends ISSPosition>
    implements $ISSPositionCopyWith<$Res> {
  _$ISSPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ISSPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ISSPositionImplCopyWith<$Res>
    implements $ISSPositionCopyWith<$Res> {
  factory _$$ISSPositionImplCopyWith(
          _$ISSPositionImpl value, $Res Function(_$ISSPositionImpl) then) =
      __$$ISSPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latitude, String longitude});
}

/// @nodoc
class __$$ISSPositionImplCopyWithImpl<$Res>
    extends _$ISSPositionCopyWithImpl<$Res, _$ISSPositionImpl>
    implements _$$ISSPositionImplCopyWith<$Res> {
  __$$ISSPositionImplCopyWithImpl(
      _$ISSPositionImpl _value, $Res Function(_$ISSPositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ISSPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$ISSPositionImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ISSPositionImpl implements _ISSPosition {
  const _$ISSPositionImpl({required this.latitude, required this.longitude});

  factory _$ISSPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ISSPositionImplFromJson(json);

  @override
  final String latitude;
  @override
  final String longitude;

  @override
  String toString() {
    return 'ISSPosition(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ISSPositionImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of ISSPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ISSPositionImplCopyWith<_$ISSPositionImpl> get copyWith =>
      __$$ISSPositionImplCopyWithImpl<_$ISSPositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ISSPositionImplToJson(
      this,
    );
  }
}

abstract class _ISSPosition implements ISSPosition {
  const factory _ISSPosition(
      {required final String latitude,
      required final String longitude}) = _$ISSPositionImpl;

  factory _ISSPosition.fromJson(Map<String, dynamic> json) =
      _$ISSPositionImpl.fromJson;

  @override
  String get latitude;
  @override
  String get longitude;

  /// Create a copy of ISSPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ISSPositionImplCopyWith<_$ISSPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
