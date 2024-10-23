import 'package:flutter/material.dart';

import '../Components/navbar.dart';
class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CartItem(
                  itemName: 'Burger With Meat',
                  price: 12230,
                  quantity: 1,
                  image: 'assets/images/burger_meat',
                ),
                CartItem(
                  itemName: 'Ordinary Burgers',
                  price: 12230,
                  quantity: 2,
                  image: 'assets/images/ordinary2',
                ),
                CartItem(
                  itemName: 'Ordinary Burgers',
                  price: 12230,
                  quantity: 1,
                    image:'assets/images/ordinary',
                ),
              ],
            ),
          ),
          PaymentSummary(totalPrice: 48900, discount: 10900, finalPrice: 38000),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Order action
              },
              child: Text('Order Now'),
            ),
          )
        ],
      ),
        bottomNavigationBar: Navbar()
    );
  }
}

class CartItem extends StatelessWidget {
  final String itemName;
  final int price;
  final int quantity;
  final String image;

  CartItem({
    required this.itemName,
    required this.price,
    required this.quantity,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(value: true, onChanged: (value) {}),
          Image.network(imageUrl, height: 60, width: 60),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('\$${price.toString()}'),
            ],
          ),
          Spacer(),
          IconButton(icon: Icon(Icons.remove), onPressed: () {}),
          Text(quantity.toString()),
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ],
      ),
    );
  }
}

class PaymentSummary extends StatelessWidget {
  final int totalPrice;
  final int discount;
  final int finalPrice;

  PaymentSummary({
    required this.totalPrice,
    required this.discount,
    required this.finalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Items"),
              Text("\$${totalPrice.toString()}"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fee"),
              Text("Free"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Discount"),
              Text("-\$${discount.toString()}"),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text("\$${finalPrice.toString()}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
