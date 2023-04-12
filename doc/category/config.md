**API keys** are unique digital references that identify your account and applications in PayDunya systems. They are necessary for any integration of PayDunya payment APIs.

Here are the steps to follow to obtain your API keys:

1. Create a PayDunya Business account if you don't already have one by signing up on [the registration page](https://paydunya.com/signup)

2. Once logged in to your account, click on the **_"oneAPI"_** option in the menu on the left.

Cliquez sur "Configurer une nouvelle application" et remplissez le formulaire correspondant.

Click on "Configure a new application" and fill in the corresponding form.

Choose the test mode "I WANT TO MAKE PAYMENT TESTS" or the production mode "ACTIVATE THE PRODUCTION MODE".

### Environments

You can choose between two environments: **_test_** or **_live_** depending on the API keys.

- Test environment

```dart
Environment.test
```

- Production environment

```dart
Environment.live
```

### Get started

To get started, follow the [package installation instructions](https://pub.dev/packages/paydunya/install) and add a Paydunya to your app:

```dart
import 'package:paydunya/paydunya.dart';
```

### Use Test API Keys

```dart
final keysApi = KeysApi(
    mode: Environment.live,
    masterKey: 'wQzk9ZwR-Qq9m-0hD0-zpud-je5coGC3FHKW',
    privateKey: 'test_private_rMIdJM3PLLhLjyArx9tF3VURAF5',
    token: 'IivOiOxGJuWhc5znlIiK',
);
```

### Use Production API Keys

If you want to use the [SoftPay](https://developers.paydunya.com/doc/FR/softpay) payment service, you must provide your production keys.

```dart
final keysApi = KeysApi(
    mode: Environment.test,
    masterKey: 'wQzk9ZwR-Qq9m-0hD0-zpud-je5coGC3FHKW',
    privateKey: 'live_private_rMIdJM3PLLhLjyArx9tF3VURAF5',
    token: 'IivOiOxGJuWhc5znlIiK',
);
```
