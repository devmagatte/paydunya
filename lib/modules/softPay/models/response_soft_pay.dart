class ReponseSoftPay {
  final bool sucess;
  final String message;
  final String? url;
  final int? fees;
  final String? currency;

  ReponseSoftPay({
    required this.sucess,
    required this.message,
    this.url,
    this.fees,
    this.currency,
  });
}
