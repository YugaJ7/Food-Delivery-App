import 'package:flutter/material.dart';
import 'package:food_delivery/screens/profile_screen.dart';
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotification = false;
  bool location = true;
  String language = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Profile Section
          Text('PROFILE', style: TextStyle(color: Colors.grey, fontSize: 12)),
          SwitchListTile(
            title: Text('Push Notification'),
            value: pushNotification,
            activeColor: Colors.orange,
            onChanged: (bool value) {
              setState(() {
                pushNotification = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Location'),
            value: location,
            activeColor: Colors.orange,
            onChanged: (bool value) {
              setState(() {
                location = value;
              });
            },
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text(language),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to language selection screen
            },
          ),
          SizedBox(height: 20),

          // Other Section
          Text('OTHER', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ListTile(
            title: Text('About Ticketis'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to About page
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy Policy page
            },
          ),
          ListTile(
            title: Text('Terms and Conditions'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Terms and Conditions page
            },
          ),
        ],
      ),
    );
  }
}