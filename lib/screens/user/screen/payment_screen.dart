import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laza/consts/api_keys.dart';
import 'package:laza/screens/order_confirmed_screen.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/paystack_response_model.dart';
import '../../../models/transaction_model.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/order_provider.dart';
import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';

class PaymentPage extends StatefulWidget {
  static const routeName = '/Payment_screen';
  PaymentPage({super.key, required this.price, required this.reference});
  final String email = FirebaseAuth.instance.currentUser!.email!;
  final double price;
  final String reference;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late Future futureInitTransaction;
  @override
  void initState() {
    super.initState();
    futureInitTransaction = initTransaction();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
        title: Text(
          'Complete Payment',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: color.secondary),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: futureInitTransaction,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final url = snapshot.data;
                return WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(const Color(0x00000000))
                    ..setNavigationDelegate(
                      NavigationDelegate(
                        onProgress: (int progress) {
                          // Update loading bar.
                        },
                        onPageStarted: (String url) {},
                        onPageFinished: (String url) {},
                        onWebResourceError: (WebResourceError error) {},
                        onNavigationRequest: (NavigationRequest request) {
                          if (request.url
                              .startsWith('https://www.youtube.com/')) {
                            return NavigationDecision.prevent;
                          }
                          return NavigationDecision.navigate;
                        },
                      ),
                    )
                    ..loadRequest(
                      Uri.parse(url!),
                    ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      bottomNavigationBar: NavigationCard(
          text: 'Payment Done',
          onTap: () async {
            if (await verifyTransaction()) {
              // Navigator.pushNamed(context, OrderConfirmedScreen.routeName);
              Navigator.pushReplacementNamed(
                  context, OrderConfirmedScreen.routeName);
              await ordersProvider.placeOrder(context);
              await cartProvider.clearCart();
            }
          }),
    );
  }

  Future<PayStackResponse> createTransaction(Transaction transaction) async {
    const String url = "https://api.paystack.co/transaction/initialize";
    final data = transaction.toJson();
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${ApiKey.secretKey}',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(data),
      );
      // print(res.statusCode);
      // print("Res body: ${res.body}");
      if (res.statusCode == 200) {
        final resData = jsonDecode(res.body);
        return PayStackResponse.fromJson(resData['data']);
      }
      throw "Payment unsuccessful";
    } on Exception {
      throw "Payment unsuccessful";
    }
  }

  Future<Object> initTransaction() async {
    try {
      // print("Hey");
      // final price = total;
      final transaction = Transaction(
        amount: (widget.price * 100).toString(),
        reference: widget.reference.replaceAll(" ", "_"),
        currency: 'GHS',
        email: widget.email,
      );
      final authRes = await createTransaction(transaction);
      // print("Auth_url: ${authRes.authorization_url}");
      return authRes.authorization_url;
    } catch (e) {
      // print("Error initializing transaction $e");
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error initializing transaction $e"),
        ),
      );
    }
  }

  Future<dynamic> verifyTransaction() async {
    try {
      String url =
          "https://api.paystack.co/transaction/verify/${widget.reference}";
      final res = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${ApiKey.secretKey}',
        },
      );
      final resData = jsonDecode(res.body);
      // print(resData["data"]["status"]);
      if (resData["data"]["status"] == "success") {
        return true;
      }
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Complete Transaction before tapping this button"),
        ),
      );
      // return (resData["status"]);
    } catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error verifying Transaction: $e"),
        ),
      );
    }
  }
}
