import 'dart:convert';

import '../src/constants/constants.dart';
import '../src/models/models.dart';
import '../src/plateform/request.dart';

/// {@category Payment}
class PaymentPaydunya {
  final KeysApi keysApi;
  final RequestProviderImpl request;

  PaymentPaydunya({required this.keysApi, required this.request});

  Future<ResponseSoftPay> waveSenegal({
    required PayerInfo requestPayment,
  }) async {
    final uri = Uri.parse(SoftPayUrl.waveUrl);
    return await _toggleRequest(
      requestPayment: requestPayment,
      uri: uri,
      body: requestPayment.toJsonWaveSenegal(),
    );
  }

  Future<ResponseSoftPay> orangeMoneySenegal({
    required PayerInfo requestPayment,
  }) async {
    final uri = Uri.parse(SoftPayUrl.orangeMoneySenegalUrl);
    if (requestPayment.otp == null) {
      throw 'Le code OPT dans [RequestPayment] est obligatoire pour Orange Money Sénégal';
    }
    return await _toggleRequest(
      requestPayment: requestPayment,
      uri: uri,
      body: requestPayment.toJsonOrangeMoneySenegal(),
    );
  }

  Future<ResponseSoftPay> freeMoneySenegal({
    required PayerInfo requestPayment,
  }) async {
    final uri = Uri.parse(SoftPayUrl.freeMoneySenegalUrl);
    return await _toggleRequest(
      requestPayment: requestPayment,
      uri: uri,
      body: requestPayment.toJsonFreeMoneySenegal(),
    );
  }

  Future<ResponseSoftPay> _toggleRequest({
    required PayerInfo requestPayment,
    required Uri uri,
    required String body,
  }) async {
    final headers = keysApi.toMap();

    try {
      final response = await request.post(
        uri: uri,
        headers: headers,
        body: body,
      );

      final data = json.decode(response.body);

      final success = data['success'];
      if (success == null) {
        throw data['message'];
      }

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
