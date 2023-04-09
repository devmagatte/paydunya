import 'dart:convert';

import 'request_payment.dart';

class OrangeMoney extends RequestPayment {
  final String otp;
  const OrangeMoney({
    super.email,
    required this.otp,
    required super.fullName,
    required super.phone,
    required super.paymentToken,
  });

  toMap() {
    return {
      "orange_money_ci_customer_fullname": fullName,
      "orange_money_ci_email": email,
      "orange_money_ci_phone_number": phone,
      "orange_money_ci_otp": otp,
      "payment_token": paymentToken
    };
  }

  String toJson() => json.encode(toMap());
}
