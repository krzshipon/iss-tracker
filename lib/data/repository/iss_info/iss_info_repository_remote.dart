import 'package:iss_tracker_app/data/exception/iss_info_exception.dart';
import 'package:iss_tracker_app/data/service/iss_info_service.dart';
import 'package:iss_tracker_app/data/service/location_service.dart';
import 'package:iss_tracker_app/domain/model/home/iss_info.dart';
import 'package:logging/logging.dart';

import 'iss_info_repository.dart';

/// Remote repository for fetching ISS location data.
class IssInfoRepositoryRemote extends IssInfoRepository {
  final _logger = Logger('IssInfoRepositoryRemote');
  final ISSInfoService issInfoService;
  final LocationService locationService;

  IssInfoRepositoryRemote({
    required this.issInfoService,
    required this.locationService,
  });
  @override
  Future<IssInfo> getIssInfo() async {
    try {
      // Fetch ISS location data from the service
      final issLocationRes = await issInfoService.fetchISSLocation();
      _logger.info('Fetched ISS location info: $issLocationRes');

      final lat = double.parse(issLocationRes.issPosition.latitude);
      final lon = double.parse(issLocationRes.issPosition.longitude);

      final issCurrentCountry = await locationService.getCountry(lat, lon);
      _logger.info('Fetched ISS located country: $issCurrentCountry');

      // Convert API response to IssInfo model
      return IssInfo(
        latitude: lat,
        longitude: lon,
        timestamp: issLocationRes.timestamp,
        country: issCurrentCountry,
      );
    } catch (e, s) {
      _logger.severe('Failed to get ISS info!', e, s);
      throw IssInfoException(e.toString());
    }
  }

  @override
  Future<String?> getUserCountry() async {
    try {
      final usersCountry = await locationService.getUserCountry();
      _logger.info('Fetched user located country: $usersCountry');
      return usersCountry;
    } catch (e, s) {
      _logger.severe('Failed to get user country: $e', e, s);
      throw IssInfoException(e.toString());
    }
  }
}
