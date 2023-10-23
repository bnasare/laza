import 'package:flutter/material.dart';
import 'package:laza/widgets/navigation_card.dart';

import '../widgets/custom_back_button.dart';

class NewPaymentDetailsScreen extends StatelessWidget {
  static const routeName = '/new_payment_details';

  const NewPaymentDetailsScreen({Key? key}) : super(key: key);

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
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color.background,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 16, bottom: 16),
                child: Text(
                  'Mrh Raju',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: color.tertiary),
                ),
              ),
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
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color.background,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 16, bottom: 16),
                child: Text(
                  '5254 7634 8734 7690',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: color.tertiary),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'EXP',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.background,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 16, bottom: 16),
                        child: Text(
                          '24/24',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: color.tertiary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'CVV',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 20, right: 20),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.background,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 16, bottom: 16),
                        child: Text(
                          '7763',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: color.tertiary),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          NavigationCard(text: 'Add Card', onTap: () {})
        ],
      ),
    );
  }
}
