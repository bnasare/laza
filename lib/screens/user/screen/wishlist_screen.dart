import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/widgets/bottom_appbar.dart';

import '../../../consts/product_data.dart';
import '../../../consts/sizing_config.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_trailing_button.dart';
import '../../../widgets/product_card.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products = ProductData.products;
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
        title: Text(
          'Wishlist',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: color.secondary),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, bottom: 0),
            child: CustomTrailingButton(
              backgroundColor: color.background,
              icon: IconlyLight.bag,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalConverter(context, 20),
        ),
        child: Column(
          children: [
            ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  '365 Items',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: color.secondary,
                      fontSize: 17),
                ),
                subtitle: Text(
                  'in wishlist',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: color.tertiary),
                ),
                trailing: Container(
                  width: horizontalConverter(context, 70),
                  height: verticalConverter(context, 37),
                  decoration: BoxDecoration(
                      color: color.background,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        IconlyLight.edit,
                        size: 20,
                        color: color.secondary,
                      ),
                      Text(
                        'Sort',
                        style: TextStyle(
                            color: color.secondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )
                    ],
                  ),
                )),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.only(top: verticalConverter(context, 20)),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 0.62,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          assetName: products[index]['productAsset'].toString(),
                          productName:
                              products[index]['productName'].toString(),
                          price: 99,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(selectedIndex: 1),
    );
  }
}
