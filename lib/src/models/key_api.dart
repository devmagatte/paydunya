import 'dart:convert';

import '../constants/payment_mode.dart';

class KeysApi {
  final Environment mode;
  final String masterKey;
  final String privateKey;
  final String token;

  ///Les clés d'API sont vos références numériques auprès des systèmes de PayDunya. Nous les utilisons afin d'identifier votre compte et les applications que vous allez créer. Ces clés sont nécessaires pour toute intégration des APIs de paiements PayDunya. Voici chronologiquement la marche à suivre :
  ///
  ///Vous devez d'abord avoir un compte PayDunya Business activé. Créez-en un si besoin y est.
  ///
  ///Connectez-vous à votre compte et cliquez sur oneAPI au niveau du menu à gauche.
  ///
  ///Cliquez sur le bouton Configurer une nouvelle application et remplissez le formulaire.
  ///
  ///Choisissez MODE TEST, JE VEUX FAIRE DES TESTS DE PAIEMENT. puis ACTIVER LE MODE DE PRODUCTION.
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
