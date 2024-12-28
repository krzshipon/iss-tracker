import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iss_tracker_app/config/date_time_config.dart';
import 'package:intl/intl.dart';

part 'iss_info.freezed.dart';
part 'iss_info.g.dart';

/// Represents the ISS location and related information.
@freezed
class IssInfo with _$IssInfo {
  const IssInfo._(); // Required by Freezed for getters

  /// Creates an [IssInfo] instance.
  const factory IssInfo({
    required double latitude, // ISS latitude
    required double longitude, // ISS longitude
    required int timestamp, // Last update timestamp (seconds since epoch)
    String? country, // Country/region the ISS is above
  }) = _ISSInfo;

  /// Parses [IssInfo] from JSON.
  factory IssInfo.fromJson(Map<String, dynamic> json) =>
      _$IssInfoFromJson(json);

  /// Returns the UTC time of the last update as a formatted string.
  String get utcTime {
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toUtc();
    return DateFormat(DateTimeConfig.dateTimeFormat).format(dateTime);
  }

  /// Returns the local time of the last update as a formatted string.
  String get localTime {
    final dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toLocal();
    return DateFormat(DateTimeConfig.dateTimeFormat).format(dateTime);
  }
}
