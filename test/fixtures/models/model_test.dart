import 'package:paydunya/src/models/models.dart';

const tItem = Item(
  name: "Magatte Dialloe",
  quantity: 2,
  unitPrice: 1000,
  totalPrice: 2000,
  description: 'description',
);

const tTaxe = Taxe(
  name: 'Livraison',
  amount: 1000,
);

const tInvoice = Invoice(
  token: 'test_1r0PsBDo11',
  totalAmount: 5000,
  description: '',
  items: [
    tItem,
    tItem,
  ],
  taxes: [
    tTaxe,
    tTaxe,
  ],
);

const tAction = ActionsUrl(
  cancelUrl: "http://magasin-le-choco.com/cancel_url.aspx",
  returnUrl: "http://magasin-le-choco.com/return_url.aspx",
  callbackUrl: "http://magasin-le-choco.com/callback_url.aspx",
);

const tEtatPaiement = StatusPayment(
  reponseCode: '00',
  responseText: "Transaction Found",
  mode: "test",
  status: "completed",
  hash:
      "85c6564b0e29c7955633594bc8aca0d007dc1fce3f67bd3accb00ae4e9d39ae528574be9a6ea8bde81fcbb0bc0fae3e56eb1bbedcd4d119a7fd24b0d44ab3770",
  invoice: tInvoice,
  customData: {
    "categorie": "Jeu concours",
    "periode": "Noël 2015",
    "numero_gagnant": 5,
    "prix": "Bon de réduction de 50%"
  },
  actions: tAction,
);

const tCheckoutInvoice = CheckoutInvoice(
    reponseCode: "00",
    responseText:
        "https://app.paydunya.com/checkout/invoice/ERtyuILouhhRHICF0HboN",
    description: "Checkout Invoice Created",
    token: "ERtyuILouhhRHICF0HboN");
