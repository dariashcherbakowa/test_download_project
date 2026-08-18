import 'package:flutter_test/flutter_test.dart';

void main() {
  test('simple math test', () {
    expect(2 + 2, 4);
  });

  test('string test', () {
    expect('Hello'.toUpperCase(), 'HELLO');
  });
}
