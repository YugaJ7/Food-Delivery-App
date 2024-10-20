import 'package:flutter/material.dart';
import 'package:food_delivery/screens/security.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/extra_card.dart';
import 'screens/help_center.dart';
import 'screens/login.dart';
import 'screens/orders.dart';
import 'screens/personal_data.dart';
import 'screens/settings.dart';
import 'screens/acc_delete.dart';
import 'screens/add_acc.dart';
import 'screens/security.dart';
import 'screens/notification.dart';
import 'scrollproduct.dart';
void main() {
  runApp(FlutterApp());
} 
class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>  HomeScreen(),
        '/home': (context) =>  HomeScreen(),
        '/profile': (context) => ProfileScreen(
          name: 'Default Name',
          email: 'example@gmail.com',
        ),
        '/extra_card': (context) => ExtraCard(),
        '/help_center': (context) =>  HelpCenterScreen(),
        '/login': (context) =>  Login(),
        '/orders': (context) =>  Orders(),
        '/personal_data': (context) => PersonalData(),
        '/settings': (context) =>  SettingsScreen(),
        '/acc_delete': (context) =>  AccDelete(),
        '/add_acc': (context) =>  AddAcc(),
        '/security': (context) => Security(),
        '/notification': (context) => NotificationScreen(),

      }
    ); //MaterialApp
  }
}
