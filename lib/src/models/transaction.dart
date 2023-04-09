import 'dart:convert';

import 'models.dart';

class Transaction {
  final Store store;
  final Invoice invoice;

  /// Si vous avez besoin d'ajouter des données supplémentaires (par exemple pour un jeu concours, vous pouvez enregistrer des informations sur chaque gagnant) à des fins d'utilisation ultérieure, nous vous offrons la possibilité de sauvegarder ces données sur nos serveurs et de pouvoir les récupérer une fois le paiement réussi.
  ///
  /// Les données personnalisées ne sont affichées ni sur la page de paiement, ni sur les factures/reçus, ni sur les téléchargements et impressions. Elles sont uniquement récupérées à l'aide de notre action de callback confirm au niveau de l'API.
  final CustomData? customData;

  /// Il se peut que pour des raisons x ou y, que la confirmation de paiement ne soit pas instantanée (par exemple le temps que le client tape son code secret sur son téléphone ou le temps de latence du réseau téléphonique), l'IPN vous permet de recevoir instantanément les informations de la transaction pour un paiement [CONFIRMÉ], [ANNULÉ] ou [ÉCHOUÉ].
  ///
  /// L'IPN correspond à l'URL d'un fichier sur votre serveur sur lequel vous souhaitez recevoir les informations de la transaction de paiement, ces informations sont à traiter en backoffice. PayDunya utilise cette URL afin de vous envoyer instantanément, par requête POST, les informations relatives à la transaction de paiement.
  final Actions? actions;

  /// La plupart des éléments sont optionnels, mais prenez l'habitude de tous les fournir car cela vous offrira beaucoup plus de flexibilité.
  ///
  /// Les nœuds obligatoires pour la soumission d'une requête de paiement de facture vers nos Endpoints API sont : le nœud racine [invoice] et son noeud enfant [total_amount] ainsi que le nœud racine [store] et son noeud enfant [name].
  const Transaction({
    required this.store,
    required this.invoice,
    this.customData,
    this.actions,
  });

  Map<String, dynamic> toMap() => {
        "store": store.toMap(),
        "invoice": invoice.toMap(),
        "custom_data": customData != null ? customData!.toMap() : null,
        "actions": customData != null ? actions!.toMap() : null
      };

  String toJson() => json.encode(toMap());
}
