library paydunya;

import 'dart:convert' show json;

import 'src/constants/constants.dart';
import 'src/models/models.dart';
import 'src/plateform/request.dart';

export 'src/models/models.dart';
export 'src/constants/constants.dart';

class Paydunya {
  final _request = RequestProviderImpl();
  final KeysApi keysApi;

  Paydunya({required this.keysApi});

  Future<CheckoutInvoice> createChekoutInvoice({
    required Transaction initTransaction,
  }) async {
    final uri = Uri.parse(
      keysApi.mode == PaymentMode.test
          ? SoftPayUrl.checkoutInvoieTestUrl
          : SoftPayUrl.checkoutInvoieProdUrl,
    );

    if (keysApi.privateKey.contains('live_private') &&
        keysApi.mode == PaymentMode.test) {
      throw 'Payment Mode doit être en live';
    }

    if (keysApi.privateKey.contains('test_private') &&
        keysApi.mode == PaymentMode.live) {
      throw 'Payment Mode doit être en test';
    }

    final headers = keysApi.toMap();
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
      keysApi.mode == PaymentMode.test
          ? '${SoftPayUrl.statePaymentTest}/$invoiceToken'
          : '${SoftPayUrl.statePaymentProd}/$invoiceToken',
    );

    final headers = keysApi.toMap();

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

  Future<ResponseSoftPay> wave({required RequestPayment requestPayment}) async {
    final uri = Uri.parse(SoftPayUrl.waveUrl);

    final headers = keysApi.toMap();
    final body = requestPayment.toJsonWave();

    try {
      final response = await _request.post(
        uri: uri,
        headers: headers,
        body: body,
      );

      final data = json.decode(response.body);

      if (data['success']) {
        final result = ResponseSoftPay.fromMap(data);
        return result;
      }
      throw data['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseSoftPay> orangeMoneySenegal({
    required RequestPayment requestPayment,
  }) async {
    final uri = Uri.parse(SoftPayUrl.orangeMoneySenegalUrl);

    if (requestPayment.otp == null) {
      throw 'Le code OPT dans [RequestPayment] est obligatoire pour Orange Money Sénégal';
    }

    final headers = keysApi.toMap();
    final body = requestPayment.toJsonOrangeMoneySenegal();

    try {
      final response = await _request.post(
        uri: uri,
        headers: headers,
        body: body,
      );

      final data = json.decode(response.body);

      if (data['success']) {
        final result = ResponseSoftPay.fromMap(data);
        return result;
      }
      throw data['message'];
    } catch (e) {
      rethrow;
    }
  }
}
