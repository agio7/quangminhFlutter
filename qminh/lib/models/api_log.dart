class ApiLog {
  final String method; // GET, POST, etc.
  final String url;
  final Map<String, String>? headers;
  final String? requestBody;
  final int? statusCode;
  final String? responseBody;
  final DateTime timestamp;
  final String? error;

  ApiLog({
    required this.method,
    required this.url,
    this.headers,
    this.requestBody,
    this.statusCode,
    this.responseBody,
    required this.timestamp,
    this.error,
  });

  String get formattedTimestamp {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}:${timestamp.second.toString().padLeft(2, '0')}';
  }

  bool get isSuccess => statusCode != null && statusCode! >= 200 && statusCode! < 300;
  bool get hasError => error != null;
}



