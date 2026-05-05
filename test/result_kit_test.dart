import 'package:result_kit/result_kit.dart';
import 'package:test/test.dart';

void main() {
  group('result_kit', () {
    test('exports public API', () {
      expect(Result, isNotNull);
    });
  });
}
