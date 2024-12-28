import 'package:geocoding/geocoding.dart';
import 'package:logging/logging.dart';

class LocationService {
  final _logger = Logger('LocationService');

  /// Fetches the country/region for the given latitude and longitude.
  Future<String?> getCountry(double latitude, double longitude) async {
    try {
      final placeMarks = await placemarkFromCoordinates(latitude, longitude);
      return placeMarks.first.country;
    } catch (e, s) {
      _logger.severe('Failed to fetch country', e, s);
      rethrow;
    }
  }
}
