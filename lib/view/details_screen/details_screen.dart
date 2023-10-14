import 'package:ecommercesas/model/item_modal.dart';
import 'package:ecommercesas/view/cart_screen/cart_screen.dart';
import 'package:ecommercesas/view/provider/my_provider.dart';
import 'package:ecommercesas/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({required this.pic, required this.price, required this.nameofdress});
final String pic;
final int price;
final String nameofdress;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  MyCartProvider cart = MyCartProvider();
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<MyCartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        title: Text(
          'Details',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.add_alert,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.pic))),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.favorite_border,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Text(
              widget.nameofdress,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10,),
            Text('4.5/5 (45 reviews)'),
            SizedBox(height: 10,),
            Text('Price : ${widget.price*providers.qcount}'),
            SizedBox(height: 10,),
            Text('Quantity : ${providers.qcount}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    providers.decre();
                  },
                  child: Container(
                    height: 38,
                    width: 30,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Icon(Icons.remove,color: Colors.white,),),
                  ),
                ),
                SizedBox(width: 5,),
                InkWell(
                  onTap: () {
                    providers.incre();
                  },
                  child: Container(
                    height: 38,
                    width: 30,
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Icon(Icons.add,color: Colors.white,),),
                  ),
                ),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){
                  providers.additem(ItemModal(name: widget.nameofdress, image: widget.pic, price: widget.price*providers.qcount, quantity: providers.qcount));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                }, child: SizedBox(
                  width: 110,
                  child: Row(
                    children: [
                      Icon(Icons.shopping_cart_outlined),
                      SizedBox(width: 10,),
                      Text('Add to Cart'),
                    ],
                  ),
                ),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black),),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
