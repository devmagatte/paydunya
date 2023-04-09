import 'dart:convert';

import 'request_payment.dart';

class WaveRequest extends RequestPayment {
  const WaveRequest({
    super.email,
    required super.fullName,
    required super.phone,
    required super.paymentToken,
  });

  toMap() {
    return {
      "wave_senegal_fullName": fullName,
      "wave_senegal_email": email,
      "wave_senegal_phone": phone,
      "wave_senegal_payment_token": paymentToken
    };
  }

  String toJson() => json.encode(toMap());
}
