import 'package:ecommercesas/view/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreenWidget extends StatefulWidget {
  final String productName;
  final int productPrice;
  final int productQuantity;
  final String productImage;
  final int index;
  const CartScreenWidget(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productImage, required this.index});

  @override
  State<CartScreenWidget> createState() => _CartScreenWidgetState();
}

class _CartScreenWidgetState extends State<CartScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<MyCartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(20)),
          height: 130,
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(widget.productImage),
                          fit: BoxFit.cover,
                          )),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Total Price : ${widget.productPrice}",
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            providers.decre();
                          },
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.black,
                            size: 22,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.productQuantity}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            providers.incre();
                          },
                          child: Icon(Icons.add_circle,
                              color: Colors.black, size: 22),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap:(){providers.deleteitem(widget.index);},
                            child: Icon(Icons.delete)),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.edit)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}