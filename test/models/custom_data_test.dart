import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:paydunya/core/models/custom_data.dart';

import '../fixtures/fixture.dart';
import '../fixtures/models/model_test.dart';

void main() {
  group('Model Custom Data', () {
    final jsonMap = json.decode(fixture('custom_data.json'));

    test('Should return a valid model', () {
      final result = CustomData.fromMap(jsonMap);

      expect(result, tCustomData);
    });

    test('Should return a Map', () {
      final result = tCustomData.toMap();

      expect(result, jsonMap);
    });
  });
}
