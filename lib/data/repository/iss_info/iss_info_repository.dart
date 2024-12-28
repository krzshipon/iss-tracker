import 'package:iss_tracker_app/domain/model/home/iss_info.dart';

/// Repository interface for fetching ISS location data.
abstract class IssInfoRepository {
  /// Fetches the current ISS location and related information.
  Future<IssInfo> getIssInfo();
  Future<String?> getUserCountry();
}
