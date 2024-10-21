import 'package:flutter/material.dart';
class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orangeAccent,
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
    currentIndex: _selectedIndex,
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
