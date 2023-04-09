class ResponseSoftPay {
  final String url;
  final bool success;
  final String message;
  final String fees;
  final String currency;

  ResponseSoftPay({
    required this.url,
    required this.success,
    required this.message,
    required this.fees,
    required this.currency,
  });

  factory ResponseSoftPay.fromMap(Map<String, dynamic> map) {
    return ResponseSoftPay(
      url: map['url'] ?? '',
      success: map['success'],
      message: map['message'],
      fees: map['fees'] ?? '',
      currency: map['currency'] ?? '',
    );
  }
}
