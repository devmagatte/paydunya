import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:paydunya/core/models/actions.dart';

import '../fixtures/fixture.dart';
import '../fixtures/models/model_test.dart';

void main() {
  group('Model Action', () {
    final jsonMap = json.decode(fixture('action.json'));

    test('Should return a valid model', () {
      final result = Action.fromMap(jsonMap);

      expect(result, tAction);
    });

    test('Should return a Map', () {
      final result = tAction.toMap();

      expect(result, jsonMap);
    });
  });
}
