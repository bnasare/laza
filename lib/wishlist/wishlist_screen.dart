import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/wishlist/wishlist_widget.dart';
import 'package:provider/provider.dart';

import '../consts/sizing_config.dart';
import '../providers/wishlist_provider.dart';
import '../widgets/bottom%20appbar/bottom_appbar.dart';
import '../widgets/custom icons/custom_back_button.dart';
import '../widgets/custom icons/custom_trailing_button.dart';
import '../widgets/empty_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistItemsList =
        wishlistProvider.getWishlistItems.values.toList().reversed.toList();

    return wishlistItemsList.isEmpty
        ? const EmptyScreen(
            title: 'Your Wishlist Is Empty',
            subtitle: 'Explore more and shortlist some items',
            buttonText: 'Discover Now',
          )
        : Scaffold(
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
              centerTitle: true,
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
                        '${wishlistItemsList.length} Items',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
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
                          padding: EdgeInsets.only(
                              top: verticalConverter(context, 20)),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              childAspectRatio: 0.62,
                            ),
                            itemCount: wishlistItemsList.length,
                            itemBuilder: (context, index) {
                              return ChangeNotifierProvider.value(
                                value: wishlistItemsList[index],
                                child: const WishlistWidget(),
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
