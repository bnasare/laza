import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../models/order_model.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  late String orderDateToShow;

  @override
  void didChangeDependencies() {
    final ordersModel = Provider.of<OrderModel>(context);
    var orderDate = ordersModel.orderDate.toDate();
    orderDateToShow = '${orderDate.day}/${orderDate.month}/${orderDate.year}';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ordersModel = Provider.of<OrderModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productProvider.findProdById(ordersModel.productId);
    return ListTile(
      subtitle:
          Text('Paid: ₵${double.parse(ordersModel.price).toStringAsFixed(2)}'),
      leading: Image.asset(
        getCurrProduct.imagePath,
        width: 80,
        height: 80,
        fit: BoxFit.fill,
      ),
      title: Text(
        '${getCurrProduct.name}  x${ordersModel.quantity}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          height: 1,
          fontSize: 18,
        ),
      ),
      trailing: Text(
        orderDateToShow,
        style: const TextStyle(
          color: Colors.black,
          letterSpacing: -1,
          fontSize: 18,
        ),
      ),
    );
  }
}
