import 'package:flutter/material.dart';
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, how we can help you?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),

                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),


            Expanded(
              child: ListView(
                children: [
                  HelpCenterItem(
                    icon: Icons.grid_view_rounded,
                    title: 'General',
                    subtitle: 'Basic question about Restate',
                    iconColor: Colors.blue,
                  ),
                  HelpCenterItem(
                    icon: Icons.attach_money,
                    title: 'Sellers',
                    subtitle: 'All you need to know about selling your home to Restate',
                    iconColor: Colors.orange,
                  ),
                  HelpCenterItem(
                    icon: Icons.shopping_cart,
                    title: 'Buyers',
                    subtitle: 'Everything you need to know about buying with Restate',
                    iconColor: Colors.red,
                  ),
                  HelpCenterItem(
                    icon: Icons.person,
                    title: 'Agents',
                    subtitle: 'How buying agents and listing agents can work with Restate',
                    iconColor: Colors.blueAccent,
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

class HelpCenterItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const HelpCenterItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        onTap: () {
          // Navigate to respective category details page
        },
      ),
    );
  }
}