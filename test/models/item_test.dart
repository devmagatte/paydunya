import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:paydunya/core/models/item.dart';

import '../fixtures/fixture.dart';
import '../fixtures/models/model_test.dart';

void main() {
  group('Model Item', () {
    final jsonMap = json.decode(fixture('item.json'));

    test('Should return a valid model', () {
      final result = Item.fromMap(jsonMap);

      expect(result, tItem);
    });

    test('Should return a Map', () {
      final result = tItem.toMap();

      expect(result, jsonMap);
    });
  });
}
