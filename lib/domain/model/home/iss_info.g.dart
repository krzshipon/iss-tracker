// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iss_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ISSInfoImpl _$$ISSInfoImplFromJson(Map<String, dynamic> json) =>
    _$ISSInfoImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      timestamp: (json['timestamp'] as num).toInt(),
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$ISSInfoImplToJson(_$ISSInfoImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'timestamp': instance.timestamp,
      'country': instance.country,
    };
