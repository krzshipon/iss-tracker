import 'package:flutter_test/flutter_test.dart';
import 'package:iss_tracker_app/data/exception/iss_info_exception.dart';
import 'package:iss_tracker_app/data/model/response/iss_response.dart';
import 'package:iss_tracker_app/data/repository/iss_info/iss_info_repository_remote.dart';
import 'package:iss_tracker_app/data/service/iss_info_service.dart';
import 'package:iss_tracker_app/data/service/location_service.dart';
import 'package:iss_tracker_app/domain/model/home/iss_info.dart';

class FakeIssInfoService implements ISSInfoService {
  bool shouldThrowError = false;

  @override
  Future<ISSLocationResponse> fetchISSLocation() async {
    if (shouldThrowError) {
      throw Exception('API Error');
    }
    return ISSLocationResponse(
      issPosition: ISSPosition(latitude: '0.0', longitude: '0.0'),
      timestamp: 1696156800,
      message: 'success',
    );
  }

  @override
  String get issInfoEndpoint => throw UnimplementedError();
}

// Fake LocationService
class FakeLocationService implements LocationService {
  bool shouldThrowError = false;

  Future<String> getCountry(double latitude, double longitude) async {
    if (shouldThrowError) {
      throw Exception('Location Error');
    }
    return 'Test Country';
  }

  @override
  Future<String?> getUserCountry() async {
    if (shouldThrowError) {
      throw Exception('Location Error');
    }
    return 'User Country';
  }
}

void main() {
  group('IssInfoRepositoryRemote', () {
    late IssInfoRepositoryRemote repository;
    late FakeIssInfoService fakeIssInfoService;
    late FakeLocationService fakeLocationService;

    setUp(() {
      fakeIssInfoService = FakeIssInfoService();
      fakeLocationService = FakeLocationService();
      repository = IssInfoRepositoryRemote(
        issInfoService: fakeIssInfoService,
        locationService: fakeLocationService,
      );
    });

    test('getIssInfo should return IssInfo on success', () async {
      // Call the method
      final result = await repository.getIssInfo();

      // Verify the result
      expect(result, isA<IssInfo>());
      expect(result.latitude, 0.0);
      expect(result.longitude, 0.0);
      expect(result.timestamp, 1696156800);
      expect(result.country, 'Test Country');
    });

    test('getIssInfo should throw IssInfoException on service error', () async {
      // Set the fake service to throw an error
      fakeIssInfoService.shouldThrowError = true;

      // Call the method and expect an exception
      expect(() => repository.getIssInfo(), throwsA(isA<IssInfoException>()));
    });

    test('getUserCountry should return user country on success', () async {
      // Call the method
      final result = await repository.getUserCountry();

      // Verify the result
      expect(result, 'User Country');
    });

    test('getUserCountry should throw IssInfoException on service error',
        () async {
      // Set the fake service to throw an error
      fakeLocationService.shouldThrowError = true;

      // Call the method and expect an exception
      expect(
          () => repository.getUserCountry(), throwsA(isA<IssInfoException>()));
    });
  });
}
