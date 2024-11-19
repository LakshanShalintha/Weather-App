import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Home.dart';
import 'package:weather_app/Screens/Profile.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

int _selectedIndex = 0;

class _NavBarState extends State<NavBar> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        break;
      case 1:
        /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ),
        );*/
        break;
      case 2:
        /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ),
        );*/
        break;
      case 3:
        /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ),
        );*/
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey, // Green shadow color
            blurRadius: 8, // Spread of the shadow
            offset: Offset(0, -2), // Shadow offset (negative y-axis to show above the bar)
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,  // Always show the labels
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded,
              size: 30.0,
            ),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Blog',
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