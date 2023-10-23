import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/widgets/brand_card.dart';
import 'package:laza/widgets/product_card.dart';
import '../widgets/bottom_appbar.dart';
import '../widgets/custom_trailing_button.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final TextEditingController searchController = TextEditingController();
    List firstLines = [
      'Nike Sportswear Club ',
      'Trail Running Jacket Nike ',
      'NO_NAME',
      'NO_NAME'
    ];
    List secondLines = ['Fleece', 'Windrunner', null, null];
    double verticalConverter(double value) {
      double height = MediaQuery.of(context).size.height;
      double heightRatio = height / 812;
      double newValue = heightRatio * value;
      return newValue;
    }

    double horizontalConverter(double value) {
      double width = MediaQuery.of(context).size.width;
      double widthRatio = width / 375;
      double newValue = widthRatio * value;
      return newValue;
    }

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
        padding: EdgeInsets.symmetric(horizontal: horizontalConverter(20)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(20)),
              child: const Text(
                'Hello',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(5)),
              child: Text(
                'Welcome to Laza',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: color.tertiary),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(20)),
              child: Row(
                children: [
                  Container(
                    width: horizontalConverter(275),
                    height: verticalConverter(50),
                    decoration: BoxDecoration(
                        color: color.background,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        label: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: horizontalConverter(20)),
                              child: Icon(
                                Icons.search,
                                size: 20,
                                color: color.tertiary,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: horizontalConverter(20)),
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: verticalConverter(50),
                    width: verticalConverter(50),
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
              padding: EdgeInsets.only(top: verticalConverter(20)),
              child: Row(
                children: [
                  const Text(
                    'Choose Brand',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
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
              padding: EdgeInsets.only(top: verticalConverter(20)),
              child: SizedBox(
                height: verticalConverter(55),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    BrandCard(
                      assetName: 'adidas',
                      brandName: 'Adidas',
                      width: horizontalConverter(115),
                    ),
                    SizedBox(width: horizontalConverter(10)),
                    BrandCard(
                        assetName: 'nike',
                        brandName: 'Nike',
                        width: horizontalConverter(98)),
                    SizedBox(width: horizontalConverter(10)),
                    BrandCard(
                      assetName: 'fila',
                      brandName: 'Fila',
                      width: horizontalConverter(91),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: verticalConverter(20)),
              child: Row(
                children: [
                  const Text(
                    'New Arrival',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
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
              padding: EdgeInsets.only(top: verticalConverter(10)),
              child: SizedBox(
                height: verticalConverter(700),
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    mainAxisSpacing: verticalConverter(20),
                    crossAxisSpacing: horizontalConverter(15),
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      assetName: 'card_${index + 1}',
                      firstLine: firstLines[index],
                      secondLine: secondLines[index],
                      price: 99,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(selectedIndex: 0),
    );
  }
}
