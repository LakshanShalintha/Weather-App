import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Onboarding.dart';
import '../Components/NavBar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Dismiss the keyboard when tapping anywhere outside
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 7),
            child: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10), // Add some spacing
                    const Text(
                      "Lakshan", // Replace with the desired name
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextButton(context, "Profile", Icons.person, () {}),
                  const SizedBox(height: 10),
                  _buildTextButton(context, "Notification",
                      Icons.notifications_active, () {}),
                  const SizedBox(height: 10),
                  _buildTextButton(context, "Setting", Icons.settings, () {}),
                  const SizedBox(height: 10),
                  _buildTextButton(context, "Log Out", Icons.logout, () {
                    _showLogOutConfirmationDialog(context);
                  }, color: Colors.red),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }

  // Helper function to build a text button with icon and arrow
  Widget _buildTextButton(
      BuildContext context, String label, IconData icon, VoidCallback onPressed,
      {Color? color}) {
    final isLogOut = label == "Log Out";
    final defaultColor = isLogOut ? Colors.red : Colors.white;

    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color ?? defaultColor),
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, color: color ?? defaultColor),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: color ?? defaultColor),
        ],
      ),
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
      ),
    );
  }

  void _showLogOutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Log Out',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Onboarding()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
