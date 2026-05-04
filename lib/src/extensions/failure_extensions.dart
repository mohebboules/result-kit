import '../result/failure.dart';

/// Extensions on [Failure] for convenient access to the error message.
extension FailureX on Failure {
  /// The human-readable error message for this failure.
  String get message => when(network: (m) => m, auth: (m) => m, server: (m) => m, unknown: (m) => m, validation: (m) => m);
}
