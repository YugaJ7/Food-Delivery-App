import 'package:flutter/material.dart';
import 'package:food_delivery/Components/product.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  final Product product;
  const MenuScreen({required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'About This Menu',
              style: GoogleFonts.inter(textStyle: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200,width: 2)
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200,width: 2),
                ),
                child: IconButton(
                  icon: Icon(Icons.share, color: Colors.black, size: 20,),
                  onPressed: () {},
                ),
              ),
            ),
          ],
          elevation: 0, 
        ),
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    product.image,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.price,
                    style: TextStyle(fontSize: 24, color: Colors.orangeAccent),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orangeAccent, size: 20),
                      SizedBox(width: 5),
                      Text(product.rating),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.delivery_dining, color: Colors.orangeAccent),
                      SizedBox(width: 5),
                      Text("Free Delivery"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.orangeAccent),
                      SizedBox(width: 5),
                      Text("20-30 min"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          },
                      ),
                      Text(
                        "4", // Display quantity dynamically
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.orangeAccent,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                    },
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(width: 5),
                        Text("Add to Cart"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended For You",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                    },
                    child: Text("See All"),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildRecommendedItem(),
                    buildRecommendedItem(),
                    buildRecommendedItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget buildRecommendedItem() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              product.image,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Burger",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}