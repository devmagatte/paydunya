import 'response_api.dart';

class CheckoutInvoice extends ResponseApi {
  final String description;
  final String token;

  const CheckoutInvoice({
    required super.reponseCode,
    required super.responseText,
    required this.description,
    required this.token,
  });

  factory CheckoutInvoice.fromMap(Map<String, dynamic> map) {
    return CheckoutInvoice(
      reponseCode: map['response_code'],
      responseText: map['response_text'],
      description: map['description'] ?? '',
      token: map['token'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        reponseCode,
        responseText,
        description,
        token,
      ];
}
