class ApiResponse<T> {
  final T? data;
  final int? statusCode;
  final String? message;
  final bool isSuccess;
  final String? error;

  ApiResponse._({
    this.data,
    this.statusCode,
    this.message,
    this.error,
    required this.isSuccess,
  });

  // Success factory constructor
  factory ApiResponse.success({
    required T rawData,
    required int? statusCode,
    String? message,
  }) {
    return ApiResponse<T>._(
      data: rawData,
      statusCode: statusCode,
      message: message ?? 'Success',
      isSuccess: true,
    );
  }

  // Error factory constructor
  factory ApiResponse.error({
    required String message,
    required int? statusCode,
    String? error,
  }) {
    return ApiResponse<T>._(
      data: null,
      statusCode: statusCode,
      message: message,
      error: error,
      isSuccess: false,
    );
  }

  @override
  String toString() {
    return 'ApiResponse{data: $data, statusCode: $statusCode, message: $message, isSuccess: $isSuccess, error: $error}';
  }
}
