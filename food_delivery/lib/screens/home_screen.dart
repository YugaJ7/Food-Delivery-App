import 'package:food_delivery/main.dart';
import 'package:food_delivery/screens/profile_screen.dart';
import 'package:food_delivery/scrollproduct.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        centerTitle: true,
        backgroundColor: Colors.white ,
        title: TextFormField(

            decoration: InputDecoration(
              hintText: 'Search products',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.grey[200],
              filled: true,
            ),
            onSaved: (String? value) {
            }
        ),
        actions: [
          Ink(
            padding: EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
            decoration: ShapeDecoration(

              color: Colors.grey[200],
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.notifications_outlined),
              color: Colors.grey,
              iconSize: 40.0,
              onPressed: () {},
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: buildscroll(),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        //new
          backgroundColor: Colors.white,
          //selectedItemColor: Colors.white,
          //unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.orangeAccent),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.orangeAccent),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_outlined, color: Colors.orangeAccent),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FlutterApp()));
                break;
              case 1:
                //Navigator.push(context,
                  //  MaterialPageRoute(builder: (context) => ProfileScreen()));
                break;
              case 2:
                Navigator.pushNamed(context, '/profile');
                break;
              default:
                break;
            }
          }
      ),

    );
  }
}
Widget buildscroll()=>
    SingleChildScrollView(
      child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Sales Images
            Container(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    //border: Border.all(),
                      borderRadius:  BorderRadius.circular(30.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/image.png'),
                          fit: BoxFit.cover
                      )
                  ),
                )
            ),
            //Nearest Restaurant
            Container(
              padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
              child: Text(
                'Nearest Restaurant',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            //Hot Sales Products
            Container(
              padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    scrollproduct(
                      image: 'assets/images/r1.png',
                      name: 'Lego Restaurant',
                      text: '18 min',
                    ),
                    scrollproduct(
                      image: 'assets/images/r1.png',
                      name: 'Raj Luxmi Restaurant',
                      text: '25 min',
                    ),
                    scrollproduct(
                      image: 'assets/images/r1.png',
                      name: 'Indiana Restaurant',
                      text: '50 min',
                    ),
                    scrollproduct(
                      image: 'assets/images/r1.png',
                      name: 'Punjabi Restaurant',
                      text: '5 min',
                    ),
                  ],
                ),
              ),
            ),
            //Recent
            Container(
              padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
              child: Text(
                'Recent Restaurant',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    scrollproduct(
                      image: 'assets/images/r1.png',
                      name: 'Punjabi Restaurant',
                      text: '5 min',
                    ),
                    scrollproduct(
                      image: 'assets/images/r1.png',
                      name: 'Punjabi Restaurant',
                      text: '5 min',
                    ),
                  ],
                ),
              ),
            )

          ]
      ),
    );
