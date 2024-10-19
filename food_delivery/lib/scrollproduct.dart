import 'package:flutter/material.dart';
class scrollproduct extends StatelessWidget {
  final String image;
  final String name;
  final String text;
  scrollproduct({required this.image, required this.name, required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Image.asset(image, height: 100), 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(name, style: TextStyle(fontSize: 16)),
            ),
            Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  
                },
                child: Text('Order Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}