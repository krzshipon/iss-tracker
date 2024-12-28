import 'package:freezed_annotation/freezed_annotation.dart';

part 'iss_response.freezed.dart';
part 'iss_response.g.dart';

/// ISS location API response.
@freezed
class ISSLocationResponse with _$ISSLocationResponse {
  const factory ISSLocationResponse({
    required String message,
    required int timestamp,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'iss_position') required ISSPosition issPosition,
  }) = _ISSLocationResponse;

  factory ISSLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$ISSLocationResponseFromJson(json);
}

/// ISS position (latitude and longitude).
@freezed
class ISSPosition with _$ISSPosition {
  const factory ISSPosition({
    required String latitude,
    required String longitude,
  }) = _ISSPosition;

  factory ISSPosition.fromJson(Map<String, dynamic> json) =>
      _$ISSPositionFromJson(json);
}
