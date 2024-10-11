import 'dart:developer';
import 'package:dio/dio.dart';
import '../model/api_response/api_response.dart';
import '../utils/show_messages.dart';

class NetworkClient {
  final Dio _dioClient;

  NetworkClient(String baseUrl)
      : _dioClient = _createDio(baseUrl);

  // POST method for any SOAP API request
  Future<ApiResponse<T>> postSoap<T>(
      String path, {
        required String soapAction,
        required String soapBody,
      }) async {
    log("SOAP Action: $soapAction");
    log("Path: $path");

    try {
      // Set headers for SOAP
      final Options options = Options(
        headers: {
          'Content-Type': 'text/xml; charset=utf-8',
          'SOAPAction': soapAction,
        },
      );

      // Send the POST request using Dio
      final response = await _dioClient.post(
        path,
        data: soapBody,
        options: options,
      );
      log("Response: ${response.data}");
      return _processSoapResponse<T>(response);
    } on DioException catch (e) {
      log("DioError: $e");
      showErrorMessage("Failed to connect to server");
      return _createErrorResponse<T>(e);
    } catch (e, stacktrace) {
      log("General Exception: $e");
      log("Stacktrace: $stacktrace");
      showErrorMessage("An unexpected error occurred");
      return ApiResponse<T>.error(
        statusCode: null,
        message: 'An unexpected error occurred',
        error: e.toString(),
      );
    }
  }

  // Process SOAP API response
  ApiResponse<T> _processSoapResponse<T>(Response response) {
    try {
      // Assuming the response is in XML, we need to parse it
      final responseXml = response.data.toString();
      // You can further process or parse the XML if needed, depending on the API.
      log("Parsed SOAP Response: $responseXml");
      return ApiResponse<T>.success(
        rawData: responseXml as T, // Replace with the type of expected parsed data
        statusCode: response.statusCode,
      );
    } catch (e) {
      log("Error parsing SOAP response: $e");
      return ApiResponse<T>.error(
        statusCode: 500,
        message: "Failed to parse SOAP response",
        error: e.toString(),
      );
    }
  }

  // Error response handler
  ApiResponse<T> _createErrorResponse<T>(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Failed to connect to server',
        );
      case DioExceptionType.badResponse:
        final message = error.response?.data['message'] ?? 'Unknown error';
        return ApiResponse<T>.error(
          statusCode: error.response?.statusCode,
          message: message,
        );
      case DioExceptionType.cancel:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Request canceled',
        );
      default:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Unknown error occurred',
        );
    }
  }

  // Create Dio client
  static Dio _createDio(String baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    );
    final dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
      requestHeader: false,
      responseBody: true,
    ));
    return dio;
  }
}
