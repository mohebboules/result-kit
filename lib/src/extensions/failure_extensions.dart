import '../result/failure.dart';

extension FailureX on Failure {
  String get message => when(network: (m) => m, auth: (m) => m, server: (m) => m, unknown: (m) => m);
}
