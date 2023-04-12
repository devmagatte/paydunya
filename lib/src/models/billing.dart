import 'dart:convert';

import 'models.dart';

/// ### Les données envoiées pour la facturation
///
/// La plupart des éléments sont optionnels, mais prenez l'habitude de tous les fournir car cela vous offrira beaucoup plus de flexibilité.
class Billing {
  /// Information du magasin
  final Store store;

  /// la facture
  final Invoice invoice;

  /// Les informations du client
  final Map<String, dynamic>? customData;

  /// les urls de callback
  final ActionsUrl? actions;

  const Billing({
    required this.store,
    required this.invoice,
    this.customData,
    this.actions,
  });

  /// {@nodoc}
  Map<String, dynamic> toMap() => {
        "store": store.toMap(),
        "invoice": invoice.toMap(),
        "custom_data": customData,
        "actions": customData != null ? actions!.toMap() : null
      };

  /// {@nodoc}
  String toJson() => json.encode(toMap());
}
