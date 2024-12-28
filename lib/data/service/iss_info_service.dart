import 'package:iss_tracker_app/data/service/client/api_client.dart';
import 'package:logging/logging.dart';

import '../model/response/iss_response.dart';

/// Service for fetching ISS location data from the API.
class ISSInfoService {
  final _logger = Logger('IssInfoService');
  final ApiClient _apiClient;
  final String issInfoEndpoint = '/iss-now.json';

  ISSInfoService({required ApiClient apiClient}) : _apiClient = apiClient;

  /// Fetches the current location of the ISS.
  Future<ISSLocationResponse> fetchISSLocation() async {
    try {
      final response = await _apiClient.get(issInfoEndpoint);
      _logger.info('Fetched ISS location: ${response.data}');
      return ISSLocationResponse.fromJson(response.data);
    } catch (e) {
      _logger.severe('Failed to fetch ISS location: ${e.toString()}');
      rethrow;
    }
  }
}
