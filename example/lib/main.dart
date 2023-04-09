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
      final keysApi = KeysApi(
        mode: PaymentMode.live,
        masterKey: 'gMoguaxG-mbNq-HQUd-nstm-SBgR2Zww6x1l',
        privateKey: 'live_private_c2leaE1joE0TaazSurVkLW2aryg',
        token: 'gYHRvevT0ZFv4Qk54btl',
      );

      final paydunya = Paydunya(keysApi: keysApi);

      const store = Store(
        name: 'preparation crem',
        tagline: '',
        postalAdress: '',
        phone: '',
        logoUrl: '',
        websiteUrl: '',
      );

      const invoice = Invoice(
        description: '',
        totalAmount: 200,
      );

      final result = await paydunya.createChekoutInvoice(
        initTransaction: const InitTransaction(
          invoice: invoice,
          store: store,
        ),
      );

      final waveRequest = RequestPayment(
        fullName: 'Magatte Diallo',
        phone: '771387690',
        otp: 808656,
        paymentToken: result.token,
      );

      final response = await paydunya.orangeMoneySenegal(
        requestPayment: waveRequest,
      );

      debugPrint("wave url: ${response.url}");

      final data = await paydunya.verifyStatePayment(
        invoiceToken: result.token,
      );

      debugPrint("Status: ${data.status}");
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
