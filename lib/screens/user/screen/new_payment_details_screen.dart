import 'package:flutter/material.dart';
import 'package:laza/widgets/bottom_card.dart';

import '../../../widgets/custom_back_button.dart';
import '../widgets/custom_textfield.dart';

class NewPaymentDetailsScreen extends StatefulWidget {
  static const routeName = '/new_payment_details';

  const NewPaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewPaymentDetailsScreen> createState() =>
      _NewPaymentDetailsScreenState();
}

class _NewPaymentDetailsScreenState extends State<NewPaymentDetailsScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    cardController.dispose();
    nameController.dispose();
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
            'Add New Card',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: color.secondary),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: color.onTertiary),
                        borderRadius: BorderRadius.circular(10),
                        color: color.onTertiary.withOpacity(0.1),
                      ),
                      child: Image.asset(
                        'assets/images/mastercard.png',
                        height: 17,
                        width: 36,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.background,
                      ),
                      child: Image.asset(
                        'assets/images/paypal.png',
                        height: 18,
                        width: 16,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 10,
                        right: 20,
                      ),
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.background,
                      ),
                      child: Image.asset(
                        'assets/images/bank.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Card Owner',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 15, left: 20, right: 20),
              child: CustomTextfield(
                controller: nameController,
                hintText: 'Mrh Raju',
                maxLines: 1,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                'Card Number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 15, left: 20, right: 20),
              child: CustomTextfield(
                controller: cardController,
                hintText: '5254 7634 8734 7690',
                maxLines: 1,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'EXP',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          controller: expiryDateController,
                          hintText: '24/24',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CVV',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                          controller: cvvController,
                          hintText: '7763',
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationCard(
            text: 'Add Card',
            onTap: () {
              Navigator.pop(context);
            }));
  }
}
