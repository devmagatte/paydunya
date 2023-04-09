import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:paydunya/src/models/checkout_invoice.dart';

import '../fixtures/fixture.dart';
import '../fixtures/models/model_test.dart';

void main() {
  group('Model Checkout Invoice', () {
    final jsonMap = json.decode(fixture('checkout_invoice.json'));

    test('Should return a valid model', () {
      final result = CheckoutInvoice.fromMap(jsonMap);

      expect(result, tCheckoutInvoice);
    });
  });
}
