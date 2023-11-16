import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/consts/sizing_config.dart';
import 'package:laza/screens/brand_screen.dart';

import '../widgets/custom icons/custom_back_button.dart';
import '../widgets/custom icons/custom_trailing_button.dart';

class AllBrandsScreen extends StatelessWidget {
  static const routeName = '/all_brands';
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final List<String> assets = [
      'adidas',
      'fila',
      'jordan',
      'nike',
      'puma',
      'ua'
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
        title: Text(
          'Brands',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: color.secondary,
          ),
        ),
        centerTitle: true,
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
              contentPadding: EdgeInsets.zero,
              title: Text(
                '${assets.length} Brands',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: color.secondary,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                'Available in stock',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: color.tertiary,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 15.0,
                    ),
                    itemCount: assets.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return BrandScreen(brand: assets[index]);
                              },
                            ),
                          );
                        },
                        child: Container(
                          height: verticalConverter(context, 100),
                          width: horizontalConverter(context, 160),
                          decoration: BoxDecoration(
                            color: color.background,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/images/${assets[index]}.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
