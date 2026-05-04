import 'package:dio/dio.dart';

import '../../result/failure.dart';
import '../api_adapter.dart';
import '../api_response.dart';

/// An [ApiAdapter] that executes a Dio request.
///
/// Pass a lambda that returns a `Future<Response>` — typically a `dio.get(...)`,
/// `dio.post(...)`, etc. call.
///
/// ```dart
/// DioAdapter(() => dio.get('/users'))
/// ```
final class DioAdapter implements ApiAdapter {
  /// Creates an adapter that executes [call] when [execute] is invoked.
  const DioAdapter(this._call);

  final Future<Response<dynamic>> Function() _call;

  @override
  Future<ApiResponse> execute() async {
    try {
      final res = await _call();
      return ApiResponse(statusCode: res.statusCode ?? 0, data: res.data);
    } on DioException catch (e) {
      throw ApiAdapterException(_mapDioException(e));
    }
  }

  Failure _mapDioException(DioException e) {
    if (_isNetworkError(e)) {
      return const Failure.network('Network error, please try again later.');
    }
    final status = e.response?.statusCode;
    final msg = _extractMessage(e.response?.data);
    if (status == 401) {
      return Failure.auth(msg ?? 'Unauthorized');
    }
    return Failure.server(msg ?? e.message ?? 'Server error');
  }

  bool _isNetworkError(DioException e) =>
      e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError;

  String? _extractMessage(dynamic data) {
    if (data is Map && data['message'] is String) {
      return data['message'] as String;
    }
    if (data is Map && data['message'] is List) {
      final list = data['message'] as List;
      if (list.isNotEmpty && list.first is String) return list.first as String;
    }
    if (data is Map) {
      final err = data['error'];
      if (err is String) return err;
      if (err is Map && err['message'] is String) {
        return err['message'] as String;
      }
    }
    return null;
  }
}
