import 'package:flutter/material.dart';
import 'package:food_delivery/Components/navbar.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            'Profile Settings',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile_pic.png'),
                   ),

                  SizedBox(height: 10),
                  Text(
                    'Albert Stefano Bajefski',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 11),
                  Text(
                    'Albertstevano@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // My Orders Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Orders',
                        style: TextStyle(
                          fontSize: 18,
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
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        //child: Image.network(
                         // '', // Replace with actual image URL
                          //width: 50,
                          //height: 50,
                          //fit: BoxFit.cover,
                        //),
                      ),
                      title: const Text('Burger With Meat'),
                      subtitle: const Text('\$12,230 • 14 items'),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'In Delivery',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Profile and Support Sections
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SectionItem(
                      icon: Icons.person, 
                      title: 'Personal Data',
                       routeName: '/personal_data'),
                  SectionItem(
                      icon: Icons.settings, 
                      title: 'Settings',
                      routeName: '/settings'),
                  SectionItem(icon: Icons.credit_card, title: 'Extra Card', routeName: 'extra_card',),
                  Divider(height: 30, thickness: 1),
                  SectionItem(icon: Icons.help_center, title: 'Help Center', routeName: 'help_center',),
                  SectionItem(icon: Icons.delete_forever, title: 'Request Account Deletion', routeName: 'acc_delete',),
                  SectionItem(icon: Icons.add, title: 'Add another account', routeName: 'add_acc',),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Sign Out Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.red),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    )
    );
  }
}

// Widget for section items
class SectionItem extends StatelessWidget {
  final IconData icon;
  final String title;

  final dynamic routeName;

  const SectionItem({super.key, required this.icon, required this.title, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
