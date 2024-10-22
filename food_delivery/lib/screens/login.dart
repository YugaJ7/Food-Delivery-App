import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/screens/register.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              Text(
                'Login to your \naccount.',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please sign in to your account',
                style: TextStyle(fontSize: 16,color: Colors.grey)),
              SizedBox(height: 10),
              Text(
                'Email Address',
                style: TextStyle(fontSize: 16,)),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Password',
                style: TextStyle(fontSize: 16,)),
              SizedBox(height: 10),
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot password?', style: TextStyle(color: Colors.orange,fontSize: 15),),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 150),
                  backgroundColor: Color.fromRGBO(254,140,0,1),
                ),
                child: Text(
                  'Sign in',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Or sign in with'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.facebook),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.apple),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) => Register()));
                    },
                    child: Text('Register', style: TextStyle(color: Color.fromRGBO(254,140,0,1)),),
                  ),
                ],
              ),
            ],
          ),
      ),
      )
    );
  }
}