import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/order_provider.dart';
import '../widgets/custom icons/custom_back_button.dart';
import '../widgets/empty_widget.dart';
import 'orders_widget.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final ordersList = ordersProvider.getOrders;
    final color = Theme.of(context).colorScheme;
    // You can use future builders instead of the fetch screen.
    return FutureBuilder(
      future: ordersProvider.fetchOrders(),
      builder: (context, snapshot) {
        return ordersList.isEmpty
            ? const EmptyScreen(
                title: 'Oops!',
                subtitle: "Nothing Ordered Anything Yet",
                buttonText: 'Shop Now')
            : Scaffold(
                appBar: AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: CustomBackButton(
                      backgroundColor: color.background,
                    ),
                  ),
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    'Your orders (${ordersList.length})',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: color.secondary),
                  ),
                ),
                body: ListView.separated(
                  itemCount: ordersList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 6),
                      child: ChangeNotifierProvider.value(
                          value: ordersList[index], child: const OrderWidget()),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    );
                  },
                ),
              );
      },
    );
  }
}
