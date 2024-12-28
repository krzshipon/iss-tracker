import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:iss_tracker_app/data/service/client/api_client.dart';
import 'package:iss_tracker_app/data/service/iss_info_service.dart';
import 'package:iss_tracker_app/data/model/response/iss_response.dart';
import 'package:logging/logging.dart';

// Fake implementation of ApiClient
class FakeApiClient implements ApiClient {
  final dynamic responseData;
  final Exception? error;

  FakeApiClient({this.responseData, this.error});

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    if (error != null) throw error!;
    return Response(
      requestOptions: RequestOptions(path: path),
      data: responseData,
      statusCode: 200,
    );
  }

  @override
  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    throw UnimplementedError('Delete not implemented in FakeApiClient');
  }

  @override
  Future<Response> post(String path, dynamic data,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    throw UnimplementedError('Post not implemented in FakeApiClient');
  }

  @override
  Future<Response> put(String path, dynamic data,
      {Map<String, String>? headers}) async {
    throw UnimplementedError('Put not implemented in FakeApiClient');
  }

  @override
  Logger get _logger =>
      throw UnimplementedError('Logger not implemented in FakeApiClient');

  @override
  Future<Response> _makeRequest(Future<Response> Function() request) async {
    throw UnimplementedError('_makeRequest not implemented in FakeApiClient');
  }

  @override
  Response _handleResponse(Response response) {
    throw UnimplementedError(
        '_handleResponse not implemented in FakeApiClient');
  }
}

void main() {
  group('ISSInfoService', () {
    test('fetchISSLocation should return ISSLocationResponse on success',
        () async {
      // Fake API response
      final fakeResponse = {
        'iss_position': {'latitude': '0.0', 'longitude': '0.0'},
        'timestamp': 1696156800,
        'message': 'success', // Add any other required fields
      };
      final fakeApiClient = FakeApiClient(responseData: fakeResponse);
      final issInfoService = ISSInfoService(apiClient: fakeApiClient);

      // Call the method
      final result = await issInfoService.fetchISSLocation();

      // Verify the result
      expect(result, isA<ISSLocationResponse>());
      expect(result.issPosition.latitude, '0.0');
      expect(result.issPosition.longitude, '0.0');
      expect(result.timestamp, 1696156800);
    });

    test('fetchISSLocation should throw an exception on API error', () async {
      // Fake API error
      final fakeApiClient = FakeApiClient(error: Exception('API Error'));
      final issInfoService = ISSInfoService(apiClient: fakeApiClient);

      // Call the method and expect an exception
      expect(() => issInfoService.fetchISSLocation(), throwsException);
    });
  });
}
