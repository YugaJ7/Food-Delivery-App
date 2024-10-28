import 'package:flutter/material.dart';
import 'package:food_delivery/Components/product.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  final Product product;
  final List<Product> recommendations;
  const MenuScreen({required this.product,required this.recommendations,});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isFavorited = false;
  int _quantity = 1; 
  List<Product> filteredRecommendations = [];

  @override
  void initState() {
    super.initState();
    filteredRecommendations = widget.recommendations
        .where((p) => p.name != widget.product.name)
        .toList(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'About This Menu',
            style: GoogleFonts.inter(textStyle: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
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
              ),
              child: IconButton(
                icon: Icon(Icons.share, color: Colors.black, size: 20),
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
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget.product.image,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? Colors.orangeAccent : Colors.orangeAccent,
                          size: 27,
                        ),
                        onPressed: () {
                          setState(() {
                      isFavorited = !isFavorited;
                    });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.price,
                    style: TextStyle(fontSize: 24, color: Colors.orangeAccent),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orangeAccent, size: 20),
                      SizedBox(width: 5),
                      Text(widget.product.rating),
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
                widget.product.description,
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
                          setState(() {
                            if (_quantity > 1) _quantity--; 
                          });
                        },
                      ),
                      Text(
                        _quantity.toString(), 
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            _quantity++; 
                            });
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                        SizedBox(width: 5),
                        Text("Add to Cart",style: TextStyle(color: Colors.white),),
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
                    onPressed: () {},
                    child: Text("See All",style: TextStyle(color: Colors.orange),),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredRecommendations.length,
                  itemBuilder: (context, index) {
                    final recommendation = filteredRecommendations[index];
                    return buildRecommendedItem(recommendation);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRecommendedItem(Product product) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            product.image,
            height: 100,  
            width: 100,   
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(
          product.name,   
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}
}
