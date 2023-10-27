import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/screens/review_screen.dart';
import 'package:laza/widgets/double_header_widget.dart';
import 'package:laza/widgets/other_product_images_widget.dart';
import 'package:laza/widgets/review_card.dart';
import 'package:laza/widgets/size_card.dart';

import '../consts/sizing_config.dart';
import '../widgets/bottom_card.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_trailing_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product_details';

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: verticalConverter(context, 418),
                        width: horizontalConverter(context, 375),
                        color: color.background,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 10,
                        right: 10,
                        child: Image.asset(
                          'assets/images/card_5.png',
                          width: horizontalConverter(context, 310),
                          height: verticalConverter(context, 387),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 170,
                        child: Image.asset(
                          'assets/images/nike_logo.png',
                          width: horizontalConverter(context, 80),
                          height: verticalConverter(context, 49),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: horizontalConverter(context, 20)),
                              child: CustomBackButton(
                                backgroundColor: color.onPrimary,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: horizontalConverter(context, 20)),
                              child: CustomTrailingButton(
                                backgroundColor: color.onPrimary,
                                icon: IconlyLight.bag,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalConverter(context, 20),
                      verticalConverter(context, 10),
                      horizontalConverter(context, 20),
                      0,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Men's Full Zip Jacket",
                              style: TextStyle(
                                color: color.tertiary,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: verticalConverter(context, 8)),
                              child: const Text(
                                "Nike Tech Fleece",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                color: color.tertiary,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: verticalConverter(context, 8)),
                              child: const Text(
                                "\$120",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: verticalConverter(context, 21),
                      left: horizontalConverter(context, 20),
                      right: horizontalConverter(context, 20),
                    ),
                    child: const ProductImage(
                      firstImage: 'pic_1',
                      secondImage: 'pic_2',
                      thirdImage: 'card_5',
                      fourthImage: 'pic_4',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: verticalConverter(context, 15)),
                    child: const DoubleHeader(
                      firstText: 'Size',
                      secondText: 'Size Guide',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      horizontalConverter(context, 20),
                      verticalConverter(context, 10),
                      horizontalConverter(context, 20),
                      0,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizeCard(size: 'S'),
                        SizeCard(size: 'M'),
                        SizeCard(size: 'L'),
                        SizeCard(size: 'XL'),
                        SizeCard(size: '2XL'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: verticalConverter(context, 20),
                      left: horizontalConverter(context, 20),
                    ),
                    child: const Text(
                      'Description',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalConverter(context, 20)),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              'The Nike Throwback Pullover Hoodie is made from premium French terry fabric that blends a performance feel with',
                          style: TextStyle(
                              color: color.tertiary,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                        TextSpan(
                          text: ' Read More..',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: color.secondary),
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: verticalConverter(context, 15)),
                    child: DoubleHeader(
                      firstText: 'Reviews',
                      secondText: 'View All',
                      onTap: () {
                        Navigator.pushNamed(context, ReviewScreen.routeName);
                      },
                    ),
                  ),
                  const ReviewCard(
                    assetName: 'face_3',
                    name: 'Ronald Richards',
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: verticalConverter(context, 20),
                      horizontal: horizontalConverter(context, 20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: color.secondary),
                            ),
                            Text(
                              'With VAT,SD',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: color.tertiary),
                            ),
                          ],
                        ),
                        Text(
                          '\$125',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: color.secondary,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationCard(text: 'Add to Cart', onTap: () {}),
    );
  }
}
