import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:paydunya/src/models/etat_paiement.dart';

import '../fixtures/fixture.dart';
import '../fixtures/models/model_test.dart';

void main() {
  group('Model Etat Paiement', () {
    final jsonMap = json.decode(fixture('etat_paiement.json'));

    test('Should return a valid model', () {
      final result = StatusPayment.fromMap(jsonMap);

      expect(result, tEtatPaiement);
    });
  });
}
