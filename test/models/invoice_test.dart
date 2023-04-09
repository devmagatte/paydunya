import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:paydunya/src/models/invoice.dart';

import '../fixtures/fixture.dart';
import '../fixtures/models/model_test.dart';

void main() {
  group('Model Invoice', () {
    final jsonMap = json.decode(fixture('invoice.json'));

    test('Should return a valid model', () {
      final result = Invoice.fromMap(jsonMap);

      expect(result, tInvoice);
    });

    test('Should return a Map', () {
      final jsonMap = json.decode(fixture('invoice_without_token.json'));

      final result = tInvoice.toMap();

      expect(result, jsonMap);
    });
  });
}
