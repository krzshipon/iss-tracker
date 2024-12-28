import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:logging/logging.dart';

class LocationService {
  final _logger = Logger('LocationService');

  /// Fetches the country/region for the given latitude and longitude.
  Future<String?> getCountry(double latitude, double longitude) async {
    try {
      final placeMarks = await placemarkFromCoordinates(latitude, longitude);
      // Iterate through placeMarks to find the first non-null country
      for (final placeMark in placeMarks) {
        if (placeMark.country != null && placeMark.country!.isNotEmpty) {
          return placeMark.country; // Return the first valid country
        }
      }
      _logger.warning('No valid country found in placeMarks');
      return null; // Return null if no valid country is found
    } on PlatformException catch (e, s) {
      if (e.code == 'NOT_FOUND') {
        _logger.warning('No valid address found: $e', e, s);
        return null;
      } else {
        _logger.severe('Failed to fetch iss located country: $e', e, s);
        rethrow;
      }
    } catch (e, s) {
      _logger.severe('Failed to fetch iss located country: $e', e, s);
      rethrow;
    }
  }

  /// Fetches the user's current country based on their device location.
  Future<String?> getUserCountry() async {
    try {
      // Check location permissions
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        final requestedPermission = await Geolocator.requestPermission();
        if (requestedPermission != LocationPermission.whileInUse &&
            requestedPermission != LocationPermission.always) {
          _logger.warning('Location permission denied');
          return null;
        }
      }

      // Fetch the user's current position
      final position = await Geolocator.getCurrentPosition();
      _logger.info('Users current position: $position');
      final country = await getCountry(
        position.latitude,
        position.longitude,
      );
      return country;
    } catch (e) {
      _logger.severe('Failed to fetch user country: $e');
      rethrow;
    }
  }
}
