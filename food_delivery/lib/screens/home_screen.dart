import 'package:food_delivery/Components/navbar.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_delivery/Components/product.dart';
import 'package:food_delivery/Components/product_card.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Icon(Icons.menu, color: Colors.black),
      //   actions: [
      //     Icon(Icons.search, color: Colors.black),
      //     SizedBox(width: 10),
      //     Icon(Icons.shopping_cart, color: Colors.black),
      //     SizedBox(width: 10),
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Background image
              Container(
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 16,
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                           'Your Location',
                             style: GoogleFonts.inter(
                             textStyle: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w600))),
                        SizedBox(width: 5),
                        Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white, size: 30)

                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.white, size: 30),
                        SizedBox(width: 5),
                          Text(
                           'New York City',
                             style: GoogleFonts.inter(
                             textStyle: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w600))),
                      ],
                    ),
                    
                    SizedBox(height: 25),
                    Text(
                           'Provide the best \nfood for you',
                             style: GoogleFonts.inter(
                             textStyle: TextStyle(color: Colors.white,fontSize: 35, fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  'Find By Category',
                  style: GoogleFonts.inter(
                             textStyle: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.w600))
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          // Categories section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryItem(
                  iconPath: 'assets/images/c1.png',
                  title: 'Burger',
                ),
                CategoryItem(
                  iconPath: 'assets/images/c3.png',
                  title: 'Snack',
                ),
                CategoryItem(
                  iconPath: 'assets/images/c3.png',
                  title: 'Drink',
                ),
                CategoryItem(
                  iconPath: 'assets/images/c4.png',
                  title: 'Pizza',
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15.0,0.0,15.0,10.0),
              child:GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (100/140),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: MyProduct.allProducts.length,
                  itemBuilder:(context, index) {
                    final allProducts = MyProduct.allProducts[index];
                    return ProductCard(product : allProducts);
                  },
                )
            ),
          )
        ],
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
class MyProduct {
  static List<Product> allProducts = [
    Product(
      name: 'Oridnary Burgers',
      price: '\$29,990',
      image: 'assets/images/b1.png',
      rating: '4.9',
      distance: '190m'),
      Product(
      name: 'Oridnary Burgers',
      price: '\$29,990',
      image: 'assets/images/b1.png',
      rating: '4.9',
      distance: '190m'),
      Product(
      name: 'Oridnary Burgers',
      price: '\$29,990',
      image: 'assets/images/b1.png',
      rating: '4.9',
      distance: '190m'),
      Product(
      name: 'Oridnary Burgers',
      price: '\$29,990',
      image: 'assets/images/b1.png',
      rating: '4.9',
      distance: '190m'),
  ];
}

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String title;

  const CategoryItem({
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(iconPath, fit: BoxFit.fill),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final double price;
  final double rating;
  final String size;

  const FoodItemCard({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.rating,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$size',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 3),
                          Text('$rating'),
                        ],
                      ),
                      Text('\$$price', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.favorite_border),
          ],
        ),
      ),
    );
  }
}
