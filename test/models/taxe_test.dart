import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:paydunya/src/models/taxe.dart';

import '../fixtures/fixture.dart';
import '../fixtures/models/model_test.dart';

void main() {
  group('Model Taxe', () {
    final jsonMap = json.decode(fixture('taxe.json'));

    test('Should return a valid model', () {
      final result = Taxe.fromMap(jsonMap);

      expect(result, tTaxe);
    });

    test('Should return a Map', () {
      final result = tTaxe.toMap();

      expect(result, jsonMap);
    });
  });
}
