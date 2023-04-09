import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:paydunya/src/models/actions.dart';

import '../fixtures/fixture.dart';
import '../fixtures/models/model_test.dart';

void main() {
  group('Model Action', () {
    final jsonMap = json.decode(fixture('action.json'));

    test('Should return a valid model', () {
      final result = Actions.fromMap(jsonMap);

      expect(result, tAction);
    });

    test('Should return a Map', () {
      final result = tAction.toMap();

      expect(result, jsonMap);
    });
  });
}
