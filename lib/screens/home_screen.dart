import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/models/product_model.dart';
import 'package:laza/screens/all_brands_screen.dart';
import 'package:laza/screens/all_products_screen.dart';
import 'package:laza/utils/snack_bar.dart';
import 'package:laza/widgets/cards/brand_card.dart';
import 'package:laza/widgets/cards/product_widget.dart';
import 'package:laza/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../consts/sizing_config.dart';
import '../providers/product_provider.dart';
import '../widgets/bottom appbar/bottom_appbar.dart';
import '../widgets/custom icons/custom_trailing_button.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchTextController = TextEditingController();
  final FocusNode searchTextFocusNode = FocusNode();
  List<ProductModel> listProductSearch = [];

  @override
  void dispose() {
    searchTextController.dispose();
    searchTextFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchProducts();
    List<ProductModel> allProducts = productProvider.getProducts;

    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: true,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Image.asset('assets/images/home_drawer.png')),
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalConverter(context, 20)),
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
                    Expanded(
                      child: TextField(
                        controller: searchTextController,
                        focusNode: searchTextFocusNode,
                        onChanged: (value) {
                          setState(() {
                            listProductSearch =
                                productProvider.searchQuery(value);
                          });
                        },
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 16),
                          filled: true,
                          fillColor: color.background,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Icon(
                              IconlyLight.search,
                              color: color.tertiary,
                            ),
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: color.tertiary,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Choose Brand',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AllBrandsScreen.routeName);
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: color.tertiary,
                        ),
                      ),
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
                      const BrandWidget(
                        assetName: 'adidas',
                        brandName: 'Adidas',
                      ),
                      SizedBox(width: horizontalConverter(context, 10)),
                      const BrandWidget(
                        assetName: 'nike',
                        brandName: 'Nike',
                      ),
                      SizedBox(width: horizontalConverter(context, 10)),
                      const BrandWidget(
                        assetName: 'fila',
                        brandName: 'Fila',
                      ),
                      SizedBox(width: horizontalConverter(context, 10)),
                      const BrandWidget(
                        assetName: 'puma',
                        brandName: 'Puma',
                      ),
                      SizedBox(width: horizontalConverter(context, 10)),
                      const BrandWidget(
                        assetName: 'ua',
                        brandName: 'UA',
                      ),
                      SizedBox(width: horizontalConverter(context, 10)),
                      const BrandWidget(
                        assetName: 'jordan',
                        brandName: 'Jordan',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: verticalConverter(context, 20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'New Arrival',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AllProductsScreen.routeName);
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: color.tertiary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: productProvider.fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  } else if (snapshot.hasError) {
                    openSnackbar(
                      context,
                      'Error: ${snapshot.error}',
                      color,
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      // Check if search results are not empty
                      if (searchTextController.text.isNotEmpty &&
                          listProductSearch.isNotEmpty) {
                        return GridView.builder(
                          padding: EdgeInsets.only(
                              top: verticalConverter(context, 20)),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 0.62,
                          ),
                          itemCount: listProductSearch.length,
                          itemBuilder: (context, index) {
                            return ChangeNotifierProvider.value(
                              value: listProductSearch[index],
                              child: const ProductWidget(),
                            );
                          },
                        );
                      } else {
                        // Show the regular grid
                        return GridView.builder(
                          padding: EdgeInsets.only(
                              top: verticalConverter(context, 20)),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 0.62,
                          ),
                          itemCount:
                              allProducts.length < 6 ? allProducts.length : 6,
                          itemBuilder: (context, index) {
                            return ChangeNotifierProvider.value(
                              value: allProducts[index],
                              child: const ProductWidget(),
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigation(selectedIndex: 0),
    );
  }
}
