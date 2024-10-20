import 'package:food_delivery/Components/navbar.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image5.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Location', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.orange),
                      Text('New York City', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),           
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Find by Category', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            SizedBox(height: 16),
            Container(
              height: 65,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  CategoryTile(icon: Icons.fastfood, label: 'Burger', isSelected: true),
                  CategoryTile(icon: Icons.local_drink, label: 'Drinks'),
                  CategoryTile(icon: Icons.local_pizza, label: 'Pizza'),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Food Items Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  FoodItemTile(
                    name: 'Ordinary Burgers',
                    image: 'assets/images/p1.png',
                    rating: 4.9,
                    price: '17,230',
                  ),
                  FoodItemTile(
                    name: 'Burger with Meat',
                    image: 'assets/images/p1.png',
                    rating: 4.8,
                    price: '17,230',
                  ),
                  FoodItemTile(
                    name: 'Ordinary Burgers',
                    image: 'assets/images/p1.png',
                    rating: 4.9,
                    price: '17,230',
                  ),
                  FoodItemTile(
                    name: 'Ordinary Burgers',
                    image: 'assets/images/p1.png',
                    rating: 4.9,
                    price: '17,230',
                  ),
                  FoodItemTile(
                    name: 'Ordinary Burgers',
                    image: 'assets/images/p1.png',
                    rating: 4.9,
                    price: '17,230',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Navbar()
    );
  }
}

class CategoryTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  CategoryTile({required this.icon, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: isSelected ? Colors.orange : Colors.grey[200],
            child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(color: isSelected ? Colors.orange : Colors.black)),
        ],
      ),
    );
  }
}

class FoodItemTile extends StatelessWidget {
  final String name;
  final String image;
  final double rating;
  final String price;

  FoodItemTile({required this.name, required this.image, required this.rating, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300)
        // boxShadow: [
        //   BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10, spreadRadius: 5),
        // ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 0.0)),
              Icon(
                Icons.favorite_border_outlined,
                color: Colors.orangeAccent
              )
            ],
          ),
          SizedBox(
            height: 110,
            width:double.infinity,
            child: Image.asset(image, fit: BoxFit.contain),
            ),
          Text(
              name, style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Icon(Icons.star, color: Colors.orange, size: 25),
              SizedBox(width: 4),
              Text(rating.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15),
              Text(price,style:TextStyle(fontSize: 18,fontWeight: FontWeight.normal))],
          ),
          
            
            
        ],
        // crossAxisAlignment: CrossAxisAlignment.start,
        // children: [
        //   SidedBox(
        //     borderRadius: BorderRadius.circular(12),
        //     child: Image.asset(
        //       image,
        //       fit: BoxFit.cover,
        //       height: 120,
        //       width: double.infinity,
        //     ),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     child: Row(
        //       children: [
        //         
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
