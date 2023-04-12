import 'package:flutter/material.dart';
import 'package:paydunya/paydunya.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exmaple Paydunya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Example Paydunya'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: ElevatedButton(
          onPressed: _toggle,
          child: const Text("executer"),
        ),
      ),
    );
  }

  void _toggle() async {
    try {
      // les clés d'acces API et le environnement
      final keysApi = KeysApi(
        mode: Environment.live,
        masterKey: 'gMoguaxG-mbNq-HQUd-nstm-SBgR2Zww6x1l',
        privateKey: 'live_private_c2leaE1joE0TaazSurVkLW2aryg',
        token: 'gYHRvevT0ZFv4Qk54btl',
      );

      final paydunya = Paydunya(keysApi: keysApi);

      // la facturation
      const transaction = Transaction(
        invoice: Invoice(description: 'Tshirt', totalAmount: 2000),
        store: Store(name: 'Maglin Corp'),
      );

      final checkoutInvoice = await paydunya.createChekoutInvoice(
        initTransaction: transaction,
      );

      // Renseigner les informations du Paiement
      final payerInfo = PayerInfo(
        fullName: 'Magatte Diallo',
        phone: '771387690',
        // otp: 808656,
        paymentToken: checkoutInvoice.token,
      );

      // Effectuer le paiement avec une méthode de paiement
      final response = await paydunya.pay(
        paymentMethod: PaymentMethod.waveSenegal,
        payerInfo: payerInfo,
      );

      // Afficher l'url de paiement de wave
      debugPrint("wave url: ${response.url}");

      // Vérifier le status du paiement
      final statusPaiement = await paydunya.verifyStatePayment(
        invoiceToken: checkoutInvoice.token,
      );

      // Afficher le status du paiement
      debugPrint("Status: ${statusPaiement.status}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
