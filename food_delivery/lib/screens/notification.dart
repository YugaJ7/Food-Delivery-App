import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Notification',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.white,
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 16.0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //     ),
        //     child: IconButton(
        //       icon: Icon(Icons.arrow_back, color: Colors.black),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //     ),
        //   ),
        // ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          Time(time: 'Today'),
          NotificationTile(
            icon: Icons.local_offer,
            title: '30% Special Discount!',
            subtitle: 'Special promotion only valid today',
            iconColor: Colors.red,
          ),
          NotificationTile(
            icon: Icons.check_circle,
            title: 'Your Order Has Been Taken by the Driver',
            subtitle: 'Recently!',
            iconColor: Colors.green,
          ),
          NotificationTile(
            icon: Icons.cancel,
            title: 'Your Order Has Been Canceled',
            subtitle: '19 Jun 2023',
            iconColor: Colors.red,
          ),
          SizedBox(height: 20),
          Time(time: 'Yesterday'),
          NotificationTile(
            icon: Icons.local_offer,
            title: '35% Special Discount!',
            subtitle: 'Special promotion only valid today',
            iconColor: Colors.blue,
          ),
          NotificationTile(
            icon: Icons.account_circle,
            title: 'Account Setup Successful!',
            subtitle: 'Your account is ready to use',
            iconColor: Colors.blue,
          ),
          NotificationTile(
            icon: Icons.local_offer,
            title: 'Special Offer! 60% Off',
            subtitle: 'Special offer for new account, valid until 20 Nov 2022',
            iconColor: Colors.red,
          ),
        ],
      ),
    );
  }
}

class Time extends StatelessWidget {
  final String time;

  Time({required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  NotificationTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 5),
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.2),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}