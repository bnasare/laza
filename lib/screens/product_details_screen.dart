import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../consts/sizing_config.dart';
import '../providers/product_provider.dart';
import '../widgets/cards/bottom_card.dart';
import '../widgets/cards/review_card.dart';
import '../widgets/cards/size_card.dart';
import '../widgets/custom icons/custom_back_button.dart';
import '../widgets/custom icons/custom_trailing_button.dart';
import '../widgets/double_header_widget.dart';
import '../widgets/other_product_images_widget.dart';
import 'review_screen.dart';
import 'user/screen/cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product_details';

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findProdById(productId);

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
                          getCurrentProduct.imagePath,
                          width: horizontalConverter(context, 310),
                          height: verticalConverter(context, 387),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 150,
                        right: 150,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              )),
                          height: verticalConverter(context, 50),
                          width: horizontalConverter(context, 80),
                          child: Image.asset(
                            'assets/images/${getCurrentProduct.category}.png',
                            fit: BoxFit.contain,
                          ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getCurrentProduct.gender.toUpperCase(),
                                style: TextStyle(
                                  color: color.tertiary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: verticalConverter(context, 8),
                                ),
                                child: Text(
                                  getCurrentProduct.name,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: color.secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              child: Text(
                                "\$${getCurrentProduct.price.toStringAsFixed(2)}",
                                style: const TextStyle(
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
                        thirdImage: 'pic_1',
                        fourthImage: 'pic_4'),
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
                      horizontalConverter(context, 10),
                      verticalConverter(context, 10),
                      horizontalConverter(context, 10),
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
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalConverter(context, 20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: showFullDescription
                                    ? getCurrentProduct.description
                                    : getCurrentProduct.description
                                        .substring(0, 100),
                                style: TextStyle(
                                  height: 1.4,
                                  color: color.tertiary,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (!showFullDescription)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showFullDescription = true;
                              });
                            },
                            child: Text(
                              ' Read More..',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: color.secondary,
                              ),
                            ),
                          ),
                      ],
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
                          '\$${getCurrentProduct.price.toStringAsFixed(2)}',
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
      bottomNavigationBar: NavigationCard(
          text: 'Add to Cart',
          onTap: () {
            Navigator.pushNamed(context, CartScreen.routeName);
          }),
    );
  }
}
