import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Home.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Static weather information (e.g., temperature, high and low temperatures)
    String mainTemperature = '23°';
    String highTemperature = '28°C';
    String lowTemperature = '17°C';
    String weatherCondition = 'sunny'; // Can be 'sunny', 'rainy', 'cloudy'

    // Choose icon and description based on weather condition
    IconData weatherIcon;
    String weatherDescription;
    if (weatherCondition == 'sunny') {
      weatherIcon = Icons.wb_sunny;
      weatherDescription = 'Sunny';
    } else if (weatherCondition == 'rainy') {
      weatherIcon = Icons.beach_access; // Use umbrella icon for rain
      weatherDescription = 'Rainy';
    } else if (weatherCondition == 'cloudy') {
      weatherIcon = Icons.cloud;
      weatherDescription = 'Cloudy';
    } else {
      weatherIcon = Icons.wb_sunny; // Default to sunny icon
      weatherDescription = 'Sunny';
    }

    return Scaffold(
      body: Stack(
        children: [
          // Full-page background image
          Positioned.fill(
            child: Image.asset(
              'assets/Onboarding/Onboarding.webp',
              fit: BoxFit.cover, // Ensures the image covers the full screen
            ),
          ),
          // Display weather information at the top, centered
          Positioned(
            top: screenHeight * 0.18, // Adjust top position based on screen height
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Weather Icon and Description
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      weatherIcon,
                      color: Colors.yellow,
                      size: screenWidth * 0.08, // Responsive icon size
                    ),
                    SizedBox(width: screenWidth * 0.02), // Responsive spacing
                    Text(
                      weatherDescription,
                      style: TextStyle(
                        fontSize: screenWidth * 0.06, // Responsive font size
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive spacing
                // Weather Temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      mainTemperature,
                      style: TextStyle(
                        fontSize: screenWidth * 0.3, // Responsive font size for main temperature
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          highTemperature,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // Responsive font size for high temperature
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          lowTemperature,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05, // Responsive font size for low temperature
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Overlay content at the bottom
          Positioned(
            bottom: screenHeight * 0.1, // Responsive distance from the bottom
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome to the App!',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive spacing
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1, // Responsive horizontal padding
                      vertical: screenHeight * 0.02, // Responsive vertical padding
                    ),
                    textStyle: TextStyle(fontSize: screenWidth * 0.045),
                    elevation: 8, // Adds a shadow effect
                    shadowColor: Colors.white.withOpacity(0.5), // Shadow color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
