import 'package:flutter/material.dart';
import 'package:food_delivery/main.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/screens/orders.dart';
import 'package:food_delivery/screens/notification.dart';
import 'package:food_delivery/screens/profile_screen.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Security',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
    onTap: (index) {
    switch (index) {
    case 0:
    Navigator.pushNamed(context, '/home');
    break;
    case 1:
    Navigator.pushNamed(context,'/security');
    break;
    case 2:
    Navigator.pushNamed(context, '/notification');
    break;
    case 3:
    Navigator.pushNamed(context, '/profile');
    break;
    default:
    break;
    }
    }
    );
  }
}