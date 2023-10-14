
import 'package:ecommercesas/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*0.8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text("Define yourself in your unique way.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 55),),
                )),
                Container(
                  padding: EdgeInsets.fromLTRB(100, MediaQuery.of(context).size.height*0.25, 0, 0),
                  child: Image.asset('assets/images/men.png',height: MediaQuery.of(context).size.height*0.68,)),
                
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              child: Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("Get Started ->",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                ),
            ),
          ),
        ],
      ),
    );
  }
}