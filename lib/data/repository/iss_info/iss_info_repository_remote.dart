import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iss_tracker_app/data/exception/iss_info_exception.dart';
import 'package:iss_tracker_app/domain/model/home/iss_info.dart';
import 'package:iss_tracker_app/provider/providers.dart';
import 'package:logging/logging.dart';

import 'iss_info_repository.dart';

/// Remote repository for fetching ISS location data.
class IssInfoRepositoryRemote extends IssInfoRepository {
  final _logger = Logger('IssInfoRepositoryRemote');
  final Ref _ref;

  IssInfoRepositoryRemote({required Ref ref}) : _ref = ref;

  @override
  Future<IssInfo> getIssInfo() async {
    try {
      // Fetch ISS location data from the service
      final issLocationRes =
          await _ref.read(issInfoServiceProvider).fetchISSLocation();
      _logger.info('Fetched ISS location info: $issLocationRes');

      // Convert API response to IssInfo model
      return IssInfo(
        latitude: double.parse(issLocationRes.issPosition.latitude),
        longitude: double.parse(issLocationRes.issPosition.longitude),
        timestamp: issLocationRes.timestamp,
        // TODO: Incorporate country info later
      );
    } catch (e, s) {
      _logger.severe('Failed to get ISS info!', e, s);
      throw IssInfoException(e.toString());
    }
  }
}
