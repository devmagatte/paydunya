import 'dart:convert';

import '../constants/payment_mode.dart';

/// {@category Configuration}
///Les clés d'API sont vos références numériques auprès des systèmes de PayDunya.
///
///Elles sont utilisées afin d'identifier votre compte et les applications que vous allez créer. Ces clés sont nécessaires pour toute intégration des APIs de paiements PayDunya.
class KeysApi {
  final Environment mode;
  final String masterKey;
  final String privateKey;
  final String token;

  KeysApi({
    required this.mode,
    required this.masterKey,
    required this.privateKey,
    required this.token,
  });

  Map<String, String> toMap() => {
        'PAYDUNYA-MASTER-KEY': masterKey,
        'PAYDUNYA-PRIVATE-KEY': privateKey,
        'PAYDUNYA-TOKEN': token,
        'Content-Type': 'application/json'
      };

  String toJson() => json.encode(toMap());
}
