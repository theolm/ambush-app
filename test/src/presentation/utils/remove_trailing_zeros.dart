import 'package:ambush_app/src/presentation/utils/remove_trailing_zeros.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('removeTrailingZeros', () {
    test('removes trailing zeros after decimal point', () {
      final result = removeTrailingZeros('1.200');
      expect(result, '1.2');
    });

    test('removes trailing zeros before decimal point', () {
      final result = removeTrailingZeros('1200');
      expect(result, '12');
    });

    test('removes trailing decimal point', () {
      final result = removeTrailingZeros('1.');
      expect(result, '1');
    });

    test('returns zero for empty input', () {
      final result = removeTrailingZeros('');
      expect(result, '0');
    });

    test('returns input unchanged for non-zero trailing digits', () {
      final result = removeTrailingZeros('1.23');
      expect(result, '1.23');
    });
  });
}
