// import 'package:food_delivery/Components/navbar.dart';
// import 'package:food_delivery/main.dart';
// import 'package:food_delivery/screens/profile_screen.dart';
import 'package:flutter/material.dart';
//import 'package:food_delivery/screens/notification.dart';
import 'package:food_delivery/screens/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_delivery/Components/product.dart';
import 'package:food_delivery/Components/product_card.dart';
import 'package:food_delivery/screens/order_detail.dart';  
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
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
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Your Location',
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.keyboard_arrow_down_sharp,
                                color: Colors.white, size: 30),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchFoodScreen(),
                                    ));
                                },
                                child: Icon(Icons.search, color: Colors.white, size: 30),
                              ),
                              SizedBox(width: 10),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(context,
                              //        MaterialPageRoute(builder: (BuildContext context) => NotificationScreen()));
                              //    },
                              //   child: Icon(Icons.notifications_outlined,
                              //       color: Colors.white, size: 30),
                              // ),
                          ],
                        ),
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
            
                child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Find By Category',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/orders');
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
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
          ),
          SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
              //height: 450, 
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(), 
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (100 / 140),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: MyProduct.allProducts.length,
                itemBuilder: (context, index) {
                  final product = MyProduct.allProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(product: product),
                        ),
                      );
                    },
                    child: ProductCard(product: product),
                  );
                },
              ),
            ),
        ],
      ),
      )
     // bottomNavigationBar: Navbar(),
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
