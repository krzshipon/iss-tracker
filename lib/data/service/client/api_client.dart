import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class ApiClient {
  final Logger _logger = Logger('ApiClient');
  final Dio _dio;
  final String _basePath;

  ApiClient({
    required String baseUrl,
    String basePath = '',
    Map<String, String> defaultHeaders = const {},
  })  : _basePath = basePath,
        _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: defaultHeaders));

  Future<Response> _makeRequest(Future<Response> Function() request) async {
    try {
      final response = await request();
      return _handleResponse(response);
    } catch (e, s) {
      _logger.severe('Api request failed:', e, s);
      rethrow;
    }
  }

  Response _handleResponse(Response response) {
    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      _logger.info(
          'Api request successful: code: ${response.statusCode} data: ${response.data}');
      return response;
    } else {
      _logger.severe(
          'Api request failed: code: ${response.statusCode} data: ${response.data}');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        message: response.statusMessage,
      );
    }
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    _logger.info('GET ${_dio.options.baseUrl}$_basePath$path');
    return _makeRequest(
      () => _dio.get(
        '$_basePath$path',
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
  }

  Future<Response> post(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    _logger.info('POST ${_dio.options.baseUrl}$_basePath$path');
    return _makeRequest(
      () => _dio.post(
        '$_basePath$path',
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
  }

  Future<Response> put(
    String path,
    dynamic data, {
    Map<String, String>? headers,
  }) async {
    _logger.info('PUT ${_dio.options.baseUrl}$_basePath$path');
    return _makeRequest(
      () => _dio.put(
        data: data,
        '$_basePath$path',
        options: Options(headers: headers),
      ),
    );
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    _logger.info('DELETE ${_dio.options.baseUrl}$_basePath$path');
    return _makeRequest(
      () => _dio.delete(
        '$_basePath$path',
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
    );
  }
}
