import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/screens/notification.dart';
import 'package:food_delivery/screens/profile_screen.dart';
import 'package:food_delivery/screens/security.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

    final List<Widget> _pages = [
    HomeScreen(),
    Security(),
    NotificationScreen(),
    ProfileScreen(name: 'Default Name',
          email: 'example@gmail.com',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
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
     ),
);
}
}




// Navigator.pushNamed(context, '/home');
    // break;
    // case 1:
    // Navigator.pushNamed(context,'/security');
    // break;
    // case 2:
    // Navigator.pushNamed(context, '/notification');
    // break;
    // case 3:
    // Navigator.pushNamed(context, '/profile');