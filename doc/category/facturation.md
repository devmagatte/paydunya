We have several parameters that we can include on the invoice. Although most of these parameters are optional, we strongly recommend that you provide them all. This will give you great flexibility in managing your transactions.

The billing parameters:

- The store
- The invoice
- Custom data
- Actions

### The store

Only the store name is required. However, you have the option to provide other optional parameters.

```dart
const store = Store(
    name: 'Royal Event',
    tagline: "Je m'oublie pour renaitre en vous !",
    phone: '+22177767778888',
    logoUrl: 'https://image-url.domain/image.png',
    websiteUrl: 'https://image-url.domain',
);
```

### The invoice

Regarding the invoice, only the total amount is mandatory. However, you can add additional information such as a list of items, applicable taxes, and a detailed description.

```dart
const items = [
    Item(
        name: 'Croco Shoes',
        quantity: 3,
        unitPrice: 10000,
        totalPrice: 30000,
        description:
            'Shoes made from authentic crocodile skin that chases poverty away',
    ),
 ];

const taxes = [
    Taxe(
        name: 'VAT (18%)',
        amount: 6300,
    ),
];

const invoice = Invoice(
    totalAmount: 42300,
    description:
            'Payment of 42300 FCFA for item(s) purchased on Magasin le Choco',
    items: items,
    taxes: taxes,
);
```

### Custom data

If you need to add additional data (for example, for a contest, you can save information about each winner) for later use, Paydunya offers the possibility to save this data on its servers and retrieve it once the payment is successful.

Custom data is not displayed on the payment page, invoices/receipts, downloads, and prints. They are only retrieved using our confirm callback action at the API level.

```dart
const Map<String, dynamic> customData = {
    "category": "Contest",
    "period": "Christmas 2015",
    "winner_number": 5,
    "prize": "50% discount voucher"
};

const Map<String, dynamic> customData = {
   "phone_brand": "Nokia",
    "IMEI": "72892821010728",
    "model": "Luna"
};
```

### Actions

It is possible to add a URL to redirect customers after a payment cancellation or success, as well as receive transaction information instantly through the IPN. The IPN corresponds to the URL of a file on the client's server to receive transaction information, which is to be processed in the back office. Failed and cancelled payments have different statuses, but retain the same response format.

```dart
const actions = ActionsUrl(
    cancelUrl: 'http://magasin-le-choco.com/cancel_url.aspx',
    returnUrl: 'http://magasin-le-choco.com/callback_url.aspx',
    callbackUrl: 'http://magasin-le-choco.com/return_url.aspx',
);
```

### Billing creation

For invoice creation, we need mandatory information from the store and invoice.

```dart
const billing = Billing(
    store: store,
    invoice: invoice,
    customData: customData,
    actions: actions,
);

final checkoutInvoice = await paydunya.createChekoutInvoice(
    billing: billing
);
```
