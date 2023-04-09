import 'custom_data.dart';
import 'invoice.dart';
import 'actions.dart';
import 'response_api.dart';

class StatusPayment extends ResponseApi {
  final String mode;
  final String status;
  final String hash;
  final Invoice invoice;
  final CustomData customData;
  final Actions actions;

  const StatusPayment({
    required super.reponseCode,
    required super.responseText,
    required this.mode,
    required this.status,
    required this.hash,
    required this.invoice,
    required this.customData,
    required this.actions,
  });

  factory StatusPayment.fromMap(Map<String, dynamic> map) {
    return StatusPayment(
      reponseCode: map['response_code'],
      responseText: map['response_text'],
      mode: map['mode'],
      status: map['status'],
      hash: map['hash'],
      invoice: Invoice.fromMap(map['invoice']),
      customData: CustomData.fromMap(map['custom_data']),
      actions: Actions.fromMap(map['actions']),
    );
  }
}
