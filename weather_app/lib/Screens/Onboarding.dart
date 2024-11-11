import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
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
            top: 150, // Adjust the top position as needed
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
                      size: 24, // Small icon size
                    ),
                    const SizedBox(width: 8), // Space between icon and description
                    Text(
                      weatherDescription,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10), // Space between icon/description and temperature
                // Weather Temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      mainTemperature,
                      style: const TextStyle(
                        fontSize: 96,
                        color: Colors.white,
                        fontWeight: FontWeight.w200, // Thinner font weight for main temperature
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          highTemperature,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontWeight: FontWeight.w300, // Adjusted font weight for high temperature
                          ),
                        ),
                        Text(
                          lowTemperature,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white70,
                            fontWeight: FontWeight.w300, // Adjusted font weight for low temperature
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
            bottom: 150, // Distance from the bottom of the screen
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome to the App!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color for contrast
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Dark button color
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 16),
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
