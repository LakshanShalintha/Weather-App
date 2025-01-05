import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Components/NavBar.dart';
import '../Components/SearchBar.dart';
import '7days.dart';
import 'Tomorrow.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  String searchQuery = "";
  bool _isSearchVisible = false;
  String _selectedButton = "Today";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerNowGrid();
    });
  }

  // Function to center the "Now" grid based on the current time
  void _centerNowGrid() {
    int currentHour = DateTime.now().hour;
    int nowIndex = _getNowIndex(currentHour);

    if (nowIndex != -1) {
      // Calculate the position to scroll to the center
      double scrollPosition =
          (nowIndex * 80.0) - MediaQuery.of(context).size.width / 2 + 40;
      _scrollController.animateTo(
        scrollPosition,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // Determines the index of the "Now" slot based on the current hour
  int _getNowIndex(int currentHour) {
    List<String> timeSlots = [
      "00:00",
      "02:00",
      "04:00",
      "06:00",
      "08:00",
      "10:00",
      "12:00",
      "14:00",
      "16:00",
      "18:00",
      "20:00",
      "22:00"
    ];
    return timeSlots.indexWhere((time) {
      int slotHour = int.parse(time.split(":")[0]);
      return (slotHour == currentHour || slotHour == currentHour - 1);
    });
  }

  void _handleSearch(String query) {
    setState(() {
      searchQuery = query; // Update the query
    });
    print("Search query: $query"); // Handle search logic here
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, d MMM').format(DateTime.now());
    int currentHour = DateTime.now().hour;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Dismiss the keyboard when tapping anywhere outside
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 7),
            child: Text(
              "Weather",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_rounded),
              onPressed: () {
                setState(() {
                  _isSearchVisible =
                      !_isSearchVisible; // Toggle search bar visibility
                });
              },
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'),
                radius: 18,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (_isSearchVisible) ...[
                CustomSearchBar(
                    onSearch: _handleSearch), // Show search bar when visible
                const SizedBox(height: 20), // Spacing after the search bar
              ],
              Center(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on, // Location icon
                          color: Colors.white70, // Match text color
                          size: 20, // Icon size
                        ),
                        SizedBox(width: 5), // Spacing between the icon and the text
                        Text(
                          "Nochchiyagama",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 350,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF333232),
                            Color(0xFF4F4F50),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud, color: Colors.yellow, size: 80),
                              SizedBox(width: 20),
                              Text(
                                "10°",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Mostly cloudy",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 20),
                                  ),
                                  Text(
                                    currentDate,
                                    style: const TextStyle(
                                        color: Colors.white38, fontSize: 14),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              const Row(
                                children: [
                                  Icon(Icons.wb_sunny,
                                      color: Colors.orange, size: 35),
                                  SizedBox(width: 10),
                                  Icon(Icons.air, color: Colors.blue, size: 35),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: _weatherDetail(
                                "Real Feel", "23.8°", Icons.thermostat)),
                        const SizedBox(width: 8),
                        Expanded(
                            child: _weatherDetail("SO2", "0.9", Icons.opacity)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: _weatherDetail("Wind", "9km/h", Icons.air)),
                        const SizedBox(width: 8),
                        Expanded(
                            child: _weatherDetail(
                                "Chance Of Rain", "50%", Icons.umbrella)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread buttons evenly
                  children: [
                    _buildWeatherButton("Today"),
                    _buildWeatherButton("Tomorrow"),
                    _buildWeatherButton("7 Days"),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 120,
                child: ListView(
                  controller: _scrollController,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  scrollDirection: Axis.horizontal,
                  children: _buildHourlyForecastList(currentHour),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }

  bool isNow(String timeSlot, int currentHour) {
    int slotHour = int.parse(timeSlot.split(":")[0]);
    return (slotHour == currentHour || slotHour == currentHour - 1);
  }

  List<Widget> _buildHourlyForecastList(int currentHour) {
    List<String> timeSlots = [
      "00:00",
      "02:00",
      "04:00",
      "06:00",
      "08:00",
      "10:00",
      "12:00",
      "14:00",
      "16:00",
      "18:00",
      "20:00",
      "22:00"
    ];
    return timeSlots.map((time) {
      bool showNow = isNow(time, currentHour);
      return _hourlyForecast(
          showNow ? "Now" : time, "26", Icons.wb_sunny, showNow);
    }).toList();
  }

  Widget _weatherDetail(String title, String value, IconData icon) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              Icon(icon, color: Colors.blue, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  // Updated _buildWeatherButton method
  Widget _buildWeatherButton(String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add spacing between buttons
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedButton = label; // Update selected button
            });

            if (label == "Tomorrow") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tomorrow()),
              );
            } else if (label == "7 Days") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SevenDaysForecast()),
              );
            }
            print("$label button clicked");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedButton == label
                ? const Color(0xFF4F4F50)
                : const Color(0xFF1F1F1F), // Highlight selected button
            foregroundColor: Colors.white, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: const Size(0, 20),
            padding: const EdgeInsets.symmetric(vertical: 5.0),
          ),
          child: Text(label),
        ),
      ),
    );
  }


  Widget _hourlyForecast(
      String time, String temp, IconData icon, bool showNow) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: showNow ? Colors.lightBlue : Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time,
              style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 5),
          Icon(icon, color: Colors.orange, size: 24),
          const SizedBox(height: 5),
          Text("$temp°",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
              )
          ),
        ],
      ),
    );
  }
}
