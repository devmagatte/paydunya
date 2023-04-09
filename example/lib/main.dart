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
      // les cles d'acces API
      final keysApi = KeysApi(
        mode: PaymentMode.live,
        masterKey: 'wQzk9ZwR-Qq9m-0hD0-zpud-je5coGC3FHKW',
        privateKey: 'live_private_rMIdJM3PLLhLjyArx9tF3VURAF5',
        token: 'IivOiOxGJuWhc5znlIiK',
      );

      final paydunya = Paydunya(keysApi: keysApi);

      // la facturation
      const transaction = Transaction(
        invoice: Invoice(
          description: 'Tshirt',
          totalAmount: 2000,
        ),
        store: Store(name: 'Assylaye Ndiaye'),
      );

      final checkoutInvoice = await paydunya.createChekoutInvoice(
        initTransaction: transaction,
      );

      // Renseigner les information du Paiement pour softPay
      // final requestPayment = RequestPayment(
      //   fullName: 'Magatte Diallo',
      //   phone: '771387690',
      //   otp: 808656,
      //   paymentToken: checkoutInvoice.token,
      // );

      // payer avec orange money senegal
      // final response = await paydunya.orangeMoneySenegal(
      //   requestPayment: requestPayment,
      // );

      // payer avec orange money senegal
      //  final response = await paydunya.wave(
      //   requestPayment: requestPayment,
      // );

      // debugPrint("wave url: ${response.url}");

      final statusPaiement = await paydunya.verifyStatePayment(
        invoiceToken: checkoutInvoice.token,
      );

      debugPrint("Status: ${statusPaiement.status}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
