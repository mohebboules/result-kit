/// A normalised HTTP response returned by an [ApiAdapter].
final class ApiResponse {
  const ApiResponse({required this.statusCode, required this.data});

  /// The HTTP status code (e.g. 200, 404).
  final int statusCode;

  /// The response body. Type depends on the adapter and server (usually `Map` or `List`).
  final dynamic data;
}
