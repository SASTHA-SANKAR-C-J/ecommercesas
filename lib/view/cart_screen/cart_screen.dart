import 'package:ecommercesas/view/provider/my_provider.dart';
import 'package:ecommercesas/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<MyCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
          itemBuilder: (context, index) => CartScreenWidget(
              productName: providers.itemlist[index].name!,
              productPrice: providers.itemlist[index].price!,
              productQuantity: providers.itemlist[index].quantity!,
              productImage: providers.itemlist[index].image!,
              index: index),
          separatorBuilder: (context, index) => Divider(),
          itemCount: providers.itemlist.length),
    );
  }
}
