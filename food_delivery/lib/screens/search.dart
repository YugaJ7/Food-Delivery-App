import 'package:flutter/material.dart';
import 'package:food_delivery/screens/cart.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFoodScreen extends StatefulWidget {
  @override
  _SearchFoodScreenState createState() => _SearchFoodScreenState();
}

class _SearchFoodScreenState extends State<SearchFoodScreen> {
  int selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {'iconPath': 'assets/images/c1.png', 'label': 'Burger'},
    {'iconPath': 'assets/images/c2.png', 'label': 'Snack'},
    {'iconPath': 'assets/images/c3.png', 'label': 'Drink'},
    {'iconPath': 'assets/images/c4.png', 'label': 'Pizza'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Search Food',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => Cart()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Food',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

           Row(
                children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: CategoryItem(
                      iconPath: categories[index]['iconPath'],
                      label: categories[index]['label'],
                      isSelected: selectedCategoryIndex == index,
                    ),
                  );
                }),
              ),
            
            SizedBox(height: 20),

            Text(
              'Recent searches',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: [
                SearchItem(label: 'Burgers'),
                SearchItem(label: 'Fast food'),
                SearchItem(label: 'Dessert'),
                SearchItem(label: 'French'),
                SearchItem(label: 'Pastry'),
              ],
            ),
            SizedBox(height: 20),

            Text(
              'My recent orders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  RecentOrderItem(
                    imagePath: 'assets/images/b4.png',
                    name: 'Cheese Burgers',
                    restaurant: 'Burger Restaurant',
                    rating: '4.9',
                    distance: '190m',
                  ),
                  RecentOrderItem(
                    imagePath: 'assets/images/b1.png',
                    name: 'Ordinary Burgers',
                    restaurant: 'Burger Restaurant',
                    rating: '4.9',
                    distance: '190m',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;

  const CategoryItem({required this.iconPath, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange.withOpacity(0.1) : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(iconPath, fit: BoxFit.cover),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14, color: isSelected ? Colors.orange : Colors.black)),
      ],
    );
  }
}

class SearchItem extends StatelessWidget {
  final String label;

  const SearchItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        children: [
          Icon(Icons.search, size: 18),
          SizedBox(width: 5),
          Text(label),
        ],
      ),
      backgroundColor: Colors.grey[200],
      onDeleted: () {},
    );
  }
}

class RecentOrderItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String restaurant;
  final String rating;
  final String distance;

  const RecentOrderItem({
    required this.imagePath,
    required this.name,
    required this.restaurant,
    required this.rating,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
                    restaurant,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 5),
                      Text(rating),
                      SizedBox(width: 10),
                      Text(distance),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
