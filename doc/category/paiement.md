Paydunya offers several payment options to meet your needs. This package implements the following payment methods for customers based in Senegal:

- Wave Senegal
- Orange Money Senegal
- Free Money Senegal

### Payer and Billing Token

To make a payment, you must first provide the payer's information and the billing token.

```dart
final payerInfo = PayerInfo(
    fullName: 'Assylaye Ndiaye',
    phone: '776332211',
    // billing token
    paymentToken: checkoutInvoice.token,
);
```

### Perform Payment

By providing the payer's information and billing token, you can proceed with the payment.

The payment methods currently available with the package are:

```dart
PaymentMethod.orangeMoneySenegal
```

```dart
PaymentMethod.waveSenegal
```

```dart
PaymentMethod.freeMoneySenegal
```

By choosing one of these payment methods, you can make a payment.

```dart
final response = await paydunya.pay(
    paymentMethod: PaymentMethod.waveSenegal,
    payerInfo: payerInfo,
);
```
