library paydunya;

import 'dart:convert' show json;

import 'src/constants/constants.dart';
import 'src/models/models.dart';
import 'src/payment_paydunya.dart';
import 'src/plateform/request.dart';

export 'src/models/models.dart';
export 'src/constants/constants.dart';

class Paydunya {
  final _request = RequestProviderImpl();
  late KeysApi _keysApi;
  late PaymentPaydunya _payment;

  Paydunya({required keysApi}) {
    _keysApi = keysApi;
    _payment = PaymentPaydunya(
      keysApi: keysApi,
      request: _request,
    );
  }

  Future<CheckoutInvoice> createChekoutInvoice({
    required Transaction initTransaction,
  }) async {
    final uri = Uri.parse(
      _keysApi.mode == Environment.test
          ? SoftPayUrl.checkoutInvoieTestUrl
          : SoftPayUrl.checkoutInvoieProdUrl,
    );

    if (_keysApi.privateKey.contains('live_private') &&
        _keysApi.mode == Environment.test) {
      throw 'Payment Mode doit être en live';
    }

    if (_keysApi.privateKey.contains('test_private') &&
        _keysApi.mode == Environment.live) {
      throw 'Payment Mode doit être en test';
    }

    final headers = _keysApi.toMap();
    final body = initTransaction.toJson();

    try {
      final response = await _request.post(
        uri: uri,
        headers: headers,
        body: body,
      );
      final data = json.decode(response.body);
      final result = CheckoutInvoice.fromMap(data);
      if (result.reponseCode == '00') {
        return result;
      }
      throw result.responseText;
    } catch (e) {
      rethrow;
    }
  }

  Future<StatusPayment> verifyStatePayment({
    required String invoiceToken,
  }) async {
    final uri = Uri.parse(
      _keysApi.mode == Environment.test
          ? '${SoftPayUrl.statePaymentTest}/$invoiceToken'
          : '${SoftPayUrl.statePaymentProd}/$invoiceToken',
    );

    final headers = _keysApi.toMap();

    try {
      final response = await _request.get(
        uri: uri,
        headers: headers,
      );
      final data = json.decode(response.body);
      final result = StatusPayment.fromMap(data);
      if (result.reponseCode == '00') {
        return result;
      }
      throw result.responseText;
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseSoftPay> pay({
    required PayerInfo payerInfo,
    required PaymentMethod paymentMethod,
  }) async {
    if (PaymentMethod.orangeMoneySenegal == paymentMethod) {
      return _payment.orangeMoneySenegal(requestPayment: payerInfo);
    }
    if (PaymentMethod.waveSenegal == paymentMethod) {
      return _payment.waveSenegal(requestPayment: payerInfo);
    }
    if (PaymentMethod.freeMoneySenegal == paymentMethod) {
      return _payment.freeMoneySenegal(requestPayment: payerInfo);
    }
    throw 'Methode de paiement introuvable';
  }
}
