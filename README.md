# Paydunya

Un package qui implément les méthodes de paiement de paydunya.

[![Pub](https://img.shields.io/pub/v/paydunya)](https://pub.dartlang.org/packages/paydunya)
![GitHub](https://img.shields.io/github/license/devmagatte/paydunya)
![GitHub stars](https://img.shields.io/pub/likes/paydunya)

## Utilisation

Par exemple, supposons que vous souhaitiez utiliser le paiement Wave.

Tout d'abord, ajoutez le package paydunya à vos [dépendances pubspec](https://pub.dev/packages/paydunya/install).

Pour importer Paydunya:

```dart
import 'package:paydunya/paydunya.dart';
```

Renseigner les clés d'accéss:

```dart
final keysApi = KeysApi(
    mode: PaymentMode.live,
    masterKey: 'wQzk9ZwR-Qq9m-0hD0-zpud-je5coGC3FHKW',
    privateKey: 'live_private_rMIdJM3PLLhLjyArx9tF3VURAF5',
    token: 'IivOiOxGJuWhc5znlIiK',
);
```

Pour utiliser les methodes de paiement utiliser Paydunya avec vos cles d'accces

```dart
final paydunya = Paydunya(keysApi: keysApi);
```

Spécifier les informations de la transaction

```dart
const transaction = Transaction(
    invoice: Invoice(
        description: 'Tshirt',
        totalAmount: 2000,
    ),
    store: Store(name: 'Assylaye Ndiaye'),
);
```

Initialiser le paiement

```dart
final checkoutInvoice = await paydunya.createChekoutInvoice(
    initTransaction: transaction,
);
```

Renseigner les information du Paiement pour softPay

```dart
final requestPayment = RequestPayment(
    fullName: 'Magatte Diallo',
    phone: '771387690',
    paymentToken: checkoutInvoice.token,
);
```

Effectuer le paiement avec Wave et afficher l'url de apiement

```dart
final response = await paydunya.wave(requestPayment: requestPayment);
debugPrint("wave url: ${response.url}");
```

Verifier l'état du paiement et afficher l'état

```dart
final statusPaiement = await paydunya.verifyStatePayment(
    invoiceToken: checkoutInvoice.token,
);
debugPrint("Status: ${statusPaiement.status}");
```

## Authors

- [@devmagatte](https://github.com/devmagatte)

## License

[BSD-3-Clause](https://github.com/devmagatte/paydunya/blob/main/LICENSE)
