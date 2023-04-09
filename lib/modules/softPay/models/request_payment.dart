import 'package:equatable/equatable.dart';

abstract class RequestPayment extends Equatable {
  final String fullName;
  final String? email;
  final String phone;
  final String paymentToken;

  const RequestPayment({
    this.email,
    required this.fullName,
    required this.phone,
    required this.paymentToken,
  });

  @override
  List<Object?> get props => [
        email,
        fullName,
        phone,
        paymentToken,
      ];
}
