// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iss_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ISSLocationResponseImpl _$$ISSLocationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ISSLocationResponseImpl(
      message: json['message'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      issPosition:
          ISSPosition.fromJson(json['iss_position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ISSLocationResponseImplToJson(
        _$ISSLocationResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'timestamp': instance.timestamp,
      'iss_position': instance.issPosition,
    };

_$ISSPositionImpl _$$ISSPositionImplFromJson(Map<String, dynamic> json) =>
    _$ISSPositionImpl(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$$ISSPositionImplToJson(_$ISSPositionImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
