import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/widgets/double_header_widget.dart';
import 'package:laza/widgets/review_card.dart';
import 'package:laza/widgets/size_card.dart';
import '../consts/sizing_config.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_trailing_button.dart';
import '../widgets/navigation_card.dart';

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
          SizedBox(
            height: verticalConverter(context, 737),
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: verticalConverter(context, 418),
                      width: horizontalConverter(context, 375),
                      color: color.background,
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: horizontalConverter(context, 20)),
                            child: CustomBackButton(
                              backgroundColor: color.onPrimary,
                            )
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: horizontalConverter(context, 20)),
                          child: CustomTrailingButton(
                            backgroundColor: color.onPrimary,
                            icon: IconlyLight.bag,
                          ),
                        ),
                      ],
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
                            "Men's Printed Pullover Hoodie",
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
                              "Nike Club Fleece",
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
                  padding: EdgeInsets.only(top: verticalConverter(context, 21)),
                  child: Center(
                    child: Image.asset('assets/images/products_img.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: verticalConverter(context, 15)),
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
                      children: [
                        SizeCard(size: 'S'),
                        Spacer(),
                        SizeCard(size: 'M'),
                        Spacer(),
                        SizeCard(size: 'L'),
                        Spacer(),
                        SizeCard(size: 'XL'),
                        Spacer(),
                        SizeCard(size: '2XL'),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: verticalConverter(context, 20),
                    left: horizontalConverter(context, 20),
                  ),
                  child: const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
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
                  padding: EdgeInsets.only(top: verticalConverter(context, 15)),
                  child: const DoubleHeader(
                    firstText: 'Reviews',
                    secondText: 'View All',
                  ),
                ),
                SizedBox(
                  height: verticalConverter(context, 120),
                  child: const ReviewCard(
                    assetName: 'face_1',
                    name: 'Ronald Richards',
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: verticalConverter(context, 20),
                      horizontal: horizontalConverter(context, 20),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: color.secondary
                              ),
                            ),
                            Text(
                              'With VAT,SD',
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: color.tertiary
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '\$125',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: color.secondary
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
          const Spacer(),
          NavigationCard(text: 'Add to Cart', onTap: () {}),
        ],
      ),
    );
  }
}
