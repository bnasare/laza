import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/widgets/brand_card.dart';
import 'package:laza/widgets/product_card.dart';

import '../consts/sizing_config.dart';
import '../widgets/bottom_appbar.dart';
import '../widgets/custom_trailing_button.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CustomTrailingButton(
            backgroundColor: color.background,
            icon: Icons.menu,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CustomTrailingButton(
              backgroundColor: color.background,
              icon: IconlyLight.bag,
            ),
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontalConverter(context, 20)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 20)),
              child: const Text(
                'Hello',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 5)),
              child: Text(
                'Welcome to Laza',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: color.tertiary),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 20)),
              child: Row(
                children: [
                  Container(
                    width: horizontalConverter(context, 275),
                    height: verticalConverter(context, 50),
                    decoration: BoxDecoration(
                        color: color.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: searchController,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        label: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: horizontalConverter(context, 20)),
                              child: Icon(
                                Icons.search,
                                size: 20,
                                color: color.tertiary,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: horizontalConverter(context, 20)),
                              child: Text(
                                'Search...',
                                style: TextStyle(
                                  color: color.tertiary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: verticalConverter(context, 50),
                    width: verticalConverter(context, 50),
                    decoration: BoxDecoration(
                      color: color.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.mic_none_outlined,
                      color: color.onPrimary,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 20)),
              child: Row(
                children: [
                  const Text(
                    'Choose Brand',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: color.tertiary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 20)),
              child: SizedBox(
                height: verticalConverter(context, 55),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    BrandCard(
                      assetName: 'adidas',
                      brandName: 'Adidas',
                      width: horizontalConverter(context, 115),
                    ),
                    SizedBox(width: horizontalConverter(context, 10)),
                    BrandCard(
                        assetName: 'nike',
                        brandName: 'Nike',
                        width: horizontalConverter(context, 98)),
                    SizedBox(width: horizontalConverter(context, 10)),
                    BrandCard(
                      assetName: 'fila',
                      brandName: 'Fila',
                      width: horizontalConverter(context, 91),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 20)),
              child: Row(
                children: [
                  const Text(
                    'New Arrival',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'View All',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: color.tertiary),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 20)),
              child: Row(
                children: [
                  ProductCard(
                    assetName: products[0]['productAsset'].toString(),
                    productName: products[0]['productName'].toString(),
                    price: 99,
                  ),
                  const Spacer(),
                  ProductCard(
                    assetName: products[1]['productAsset'].toString(),
                    productName: products[1]['productName'].toString(),
                    price: 99,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 20)),
              child: Row(
                children: [
                  ProductCard(
                    assetName: products[2]['productAsset'].toString(),
                    productName: products[2]['productName'].toString(),
                    price: 99,
                  ),
                  const Spacer(),
                  ProductCard(
                    assetName: products[3]['productAsset'].toString(),
                    productName: products[3]['productName'].toString(),
                    price: 99,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(context, 20)),
              child: Row(
                children: [
                  ProductCard(
                    assetName: products[4]['productAsset'].toString(),
                    productName: products[4]['productName'].toString(),
                    price: 99,
                  ),
                  const Spacer(),
                  ProductCard(
                    assetName: products[5]['productAsset'].toString(),
                    productName: products[5]['productName'].toString(),
                    price: 99,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(selectedIndex: 0),
    );
  }

  static const products = [
    {
      'productName': 'Nike Tech Fleece Lilac Purple Full Zip Jacket',
      'productAsset': 'card_5'
    },
    {
      "productName": "Nike Men's Sportswear Club Fleece",
      'productAsset': 'card_3'
    },
    {
      "productName": "Nike SB Icon Pullover Skate Hoodie",
      'productAsset': 'card_4'
    },
    {
      "productName": "Champion Men's Trail Running Hoodie",
      'productAsset': 'card_2'
    },
    {
      "productName": "Nike Sportswear Essential Zip-Up Hoodie",
      'productAsset': 'card_6'
    },
    {
      "productName": "Nike Double Logo Sportswear Club Fleece",
      'productAsset': 'card_1'
    },
  ];
}
