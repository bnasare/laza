import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laza/consts/api_keys.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/paystack_response_model.dart';
import '../../../models/transaction_model.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key});
  // String? email = FirebaseAuth.instance.currentUser?.email;
  // String api = ApiKey.secretKey;
  // final double price;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: initTransaction(),
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
    );
  }

  Future<PayStackResponse> createTransaction(Transaction transaction) async {
    const String url = "https://api.paystack.co/transaction/initialize";
    final data = transaction.toJson();

    try {
      final res = await http.post(Uri.parse(url),
          headers: {
            "Authorization": "Bearer ${ApiKey.secretKey}",
            "Content-Type": "application/json"
          },
          body: jsonEncode(data));

      if (res.statusCode == 200) {
        final resData = jsonDecode(res.body);
        return PayStackResponse.fromJson(resData["data"]);
      } else {
        throw "Payment unsuccessful";
      }
    } on Exception {
      throw "Payment unsuccessful";
    }
  }

  Future<String> initTransaction() async {
    try {
      // final price = total;
      final transaction = Transaction(
        amount: "10000",
        reference: "Laza Checkout",
        currency: "GHS",
        email: "muhammadismaaiil360@gmail.com",
      );
      final authRes = await createTransaction(transaction);
      return authRes.authorization_url;
    } catch (e) {
      print("Error initializing transaction $e");
      return e.toString();
    }
  }
}
