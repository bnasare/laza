import 'package:flutter/material.dart';
import 'package:laza/screens/authentication/widgets/auth_text_field.dart';
import 'package:laza/widgets/cards/bottom_card.dart';

import '../../../widgets/custom icons/custom_back_button.dart';
import 'Payment_screen.dart';

class PaymentReferenceScreen extends StatefulWidget {
  static const routeName = '/new_payment_details';

  const PaymentReferenceScreen({Key? key, required this.amount})
      : super(key: key);
  final double amount;

  @override
  State<PaymentReferenceScreen> createState() => _PaymentReferenceScreenState();
}

class _PaymentReferenceScreenState extends State<PaymentReferenceScreen> {
  TextEditingController referenceController = TextEditingController();

  @override
  void dispose() {
    referenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

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
            'Payment reference',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: color.secondary),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AuthTextField(
                  controller: referenceController,
                  textInputAction: TextInputAction.done,
                  labelText: "Reference"),
              Text(
                "Enter a unique reference for your checkout",
                style: TextStyle(
                  color: color.tertiary,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: NavigationCard(
            text: 'Proceed to payment',
            onTap: () {
              if (referenceController.value.text.trim() != "") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(
                        price: widget.amount,
                        reference: referenceController.value.text),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Reference can not be empty"),
                  ),
                );
              }
            }));
  }
}
