import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/consts/sizing_config.dart';
import 'package:laza/models/product_model.dart';
import 'package:laza/widgets/cards/product_card.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../widgets/custom icons/custom_back_button.dart';
import '../widgets/custom icons/custom_trailing_button.dart';

class AllProductsScreen extends StatelessWidget {
  static const routeName = '/all_products';

  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> allProducts = productProvider.getProducts;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
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
                  '${allProducts.length} Items',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: color.secondary,
                      fontSize: 17),
                ),
                subtitle: Text(
                  'Available in stock',
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
                        CupertinoIcons.sort_down,
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
                      itemCount: allProducts.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                          value: allProducts[index],
                          child: const ProductCard(),
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
    );
  }
}
