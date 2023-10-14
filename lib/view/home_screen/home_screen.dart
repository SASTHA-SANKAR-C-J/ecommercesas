import 'package:ecommercesas/view/cart_screen/cart_screen.dart';
import 'package:ecommercesas/view/details_screen/details_screen.dart';
import 'package:ecommercesas/constant/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "Discover",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
            },
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.search,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search anything',
                          )
                        ],
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Icon(
                          Icons.horizontal_split_outlined,
                          color: Colors.white,
                        ),
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Container(
                height: 40,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: listBar.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        color: index == 0 ? Colors.black : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 30,
                    child: Center(
                      child: Text(
                        listBar[index],
                        style: TextStyle(
                          color: index == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            GridView.builder(
              itemCount: 6,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Stack(
                  children: [
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(pic: pics[index],price: mrp[index],nameofdress: names[index]),)),
                  child: Container(
                      height: 200,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(
                                        pics[index]))),
                          ),
                          Text(
                            names[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Mrp: ${mrp[index].toString()}',style: TextStyle(fontSize: 12,color: Colors.green),)
                        ],
                      ),
                    ),
                ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.favorite_border),
                    ),
                  )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
