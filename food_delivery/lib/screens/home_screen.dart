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
import 'package:geolocator/geolocator.dart'; 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryIndex = 0;
  String userLocation = 'Fetching location...';

  final List<Map<String, dynamic>> categories = [
    {'iconPath': 'assets/images/c1.png', 'label': 'Burger'},
    {'iconPath': 'assets/images/c2.png', 'label': 'Snack'},
    {'iconPath': 'assets/images/c3.png', 'label': 'Drink'},
    {'iconPath': 'assets/images/c4.png', 'label': 'Pizza'},
  ];

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        userLocation = 'Location services are disabled';
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          userLocation = 'Location permission denied';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        userLocation = 'Location permission permanently denied';
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      userLocation = 'Lat: ${position.latitude}, Long: ${position.longitude}';
    });
  }

  final List<Product> burgers = [
    Product(name: 'Ordinary Burger', price: '\$29.99', image: 'assets/images/b1.png', rating: '4.9', distance: '190m',description: 'Sink your teeth into our timeless classic cheeseburger. Juicy beef patty, perfectly grilled and layered with melted cheddar cheese, crisp lettuce, ripe tomato, and our signature sauce, all nestled in a freshly toasted brioche bun. Simple, satisfying, and endlessly delicious!'),
    Product(name: 'Burger with Meat', price: '\$35.99', image: 'assets/images/b2.png', rating: '4.7', distance: '500m',description: 'Indulge in smoky flavors with our BBQ Bacon Burger. A char-grilled beef patty topped with smoky bacon, melted pepper jack cheese, crispy onion rings, and tangy barbecue sauce, all served on a soft sesame seed bun. The perfect balance of savory and sweet in every bite!'),
    Product(name: 'Special Buger', price: '\$15.99', image: 'assets/images/b3.png', rating: '4.7', distance: '700m',description: 'Delicious and plant-based! Our Vegan Avocado Burger boasts a hearty black bean and quinoa patty, topped with fresh avocado slices, mixed greens, juicy tomato, and a vegan garlic aioli. Served on a toasted whole-grain bun, its a wholesome and tasty choice for everyone.'),
    Product(name: 'Cheese Burger', price: '\$19.99', image: 'assets/images/b4.png', rating: '4.7', distance: '100m',description: 'For the heat seekers! Our Spicy Jalapeño Burger features a seasoned beef patty, spicy pepper jack cheese, sliced jalapeños, crunchy lettuce, and zesty chipotle mayo. All stacked on a toasted bun, its a flavor-packed experience with just the right kick.'),
  ];

  final List<Product> snacks = [
    Product(name: 'Apple Cookie', price: '\$5.99', image: 'assets/images/s1.png', rating: '4.8', distance: '150m',description: 'A delightful twist on a classic treat! Our Apple Cookie combines chewy cookie dough with chunks of fresh, juicy apples and a hint of cinnamon. Baked to perfection, each bite offers a warm, spiced flavor with a soft, tender texture and a subtle crunch, making it an irresistible, comforting snack.'),
    Product(name: 'Cheese Nachos', price: '\$7.99', image: 'assets/images/s2.png', rating: '4.8', distance: '250m',description: 'Get ready for the ultimate cheesy indulgence! Our Cheese Nachos feature crispy tortilla chips smothered in creamy, melted cheddar and topped with a sprinkle of spicy jalapeños, fresh pico de gallo, and a dollop of sour cream. Perfectly layered for that gooey, crunchy, savory taste in every bite the ultimate snack for cheese lovers!'),
  ];

  final List<Product> drinks = [
    Product(name: 'Watermelon Mojito', price: '\$3.99', image: 'assets/images/d1.png', rating: '4.7', distance: '120m',description: 'Refresh yourself with our vibrant Watermelon Mojito! This drink combines juicy watermelon purée, fresh mint leaves, and a splash of zesty lime, muddled to perfection and topped with a hint of sparkling soda. Light, sweet, and delightfully cooling, its the perfect tropical twist to lift your spirits.'),
    Product(name: 'Lime Mojito', price: '\$3.99', image: 'assets/images/d2.png', rating: '4.1', distance: '120m',description: 'Our classic Lime Mojito is a crisp, refreshing blend of fresh lime juice, muddled mint leaves, and a touch of sweetness, balanced with bubbly soda water. With a bright citrusy flavor and minty freshness in every sip, its a timeless drink thats perfect for any occasion.'),
  ];

  final List<Product> pizzas = [
    Product(name: 'Pepperoni Pizza', price: '\$12.99', image: 'assets/images/p1.png', rating: '4.9', distance: '100m',description: 'Savor the bold, classic flavor of our Pepperoni Pizza! This favorite features a golden, crispy crust topped with rich tomato sauce, melted mozzarella cheese, and generous layers of spicy pepperoni slices. With each bite, you get the perfect combination of savory, cheesy, and spicy flavors.'),
    Product(name: 'Farm Pizza', price: '\$11.99', image: 'assets/images/p2.png', rating: '4.8', distance: '270m',description: 'Fresh from the farm to your table! Our Farm Pizza is loaded with a colorful mix of garden-fresh vegetables: juicy tomatoes, crisp bell peppers, sweet corn, mushrooms, and olives, all atop a bed of melted mozzarella on a hand-stretched crust. Its a wholesome, veggie-packed pizza thats as satisfying as it is delicious.'),
  ];

  List<Product> _getRecommendedProducts(Product selectedProduct) {
    List<Product> allProducts = [...burgers, ...snacks, ...drinks, ...pizzas]; 
    allProducts.shuffle();
    return allProducts.take(4).toList(); 
  }

  List<Product> getCurrentCategoryProducts() {
    switch (selectedCategoryIndex) {
      case 0:
        return burgers;
      case 1:
        return snacks;
      case 2:
        return drinks;
      case 3:
        return pizzas;
      default:
        return burgers;
    }
  }

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
                           //userLocation,
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
          //SizedBox(height: 16,),
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
          //SizedBox(height: 16),
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
                itemCount:  getCurrentCategoryProducts().length,
                itemBuilder: (context, index) {
                  final product = getCurrentCategoryProducts()[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuScreen(product: product,recommendations: _getRecommendedProducts(product),),
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
