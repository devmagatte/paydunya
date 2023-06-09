import 'dart:convert';

import 'package:equatable/equatable.dart';

class PayerInfo extends Equatable {
  final String fullName;
  final String? email;
  final int? otp;
  final String phone;
  final String paymentToken;

  const PayerInfo({
    this.email,
    this.otp,
    required this.fullName,
    required this.phone,
    required this.paymentToken,
  });

  String toJsonWaveSenegal() => json.encode({
        "wave_senegal_fullName": fullName,
        "wave_senegal_email": email,
        "wave_senegal_phone": phone,
        "wave_senegal_payment_token": paymentToken
      });

  String toJsonFreeMoneySenegal() => json.encode({
        "customer_name": fullName,
        "customer_email": email,
        "phone_number": phone,
        "payment_token": paymentToken
      });

  String toJsonOrangeMoneySenegal() => json.encode({
        "customer_name": fullName,
        "customer_email": email,
        "phone_number": phone,
        "authorization_code": otp,
        "invoice_token": paymentToken
      });

  @override
  List<Object?> get props => [
        email,
        fullName,
        phone,
        paymentToken,
      ];
}
