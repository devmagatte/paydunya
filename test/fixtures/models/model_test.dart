import 'package:paydunya/core/models/actions.dart';
import 'package:paydunya/core/models/custom_data.dart';
import 'package:paydunya/core/models/invoice.dart';
import 'package:paydunya/core/models/item.dart';
import 'package:paydunya/core/models/taxe.dart';

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

const tAction = Action(
  cancelUrl: "http://magasin-le-choco.com/cancel_url.aspx",
  returnUrl: "http://magasin-le-choco.com/return_url.aspx",
  callbackUrl: "http://magasin-le-choco.com/callback_url.aspx",
);

const tCustomData = CustomData(
  categorie: "Jeu concours",
  periode: "Noël 2015",
  numeroGagnant: 5,
  prix: "Bon de réduction de 50%",
);
