import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _centerNowGrid();
    });
  }

  // Function to center the "Now" grid based on the current time
  void _centerNowGrid() {
    int currentHour = DateTime
        .now()
        .hour;
    int nowIndex = _getNowIndex(currentHour);

    if (nowIndex != -1) {
      // Calculate the position to scroll to the center
      double scrollPosition = (nowIndex * 80.0) - MediaQuery
          .of(context)
          .size
          .width / 2 + 40;
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

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('EEEE, d MMM').format(DateTime.now());
    int currentHour = DateTime
        .now()
        .hour;

    return Scaffold(
      backgroundColor: Colors.black,
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    "Nochchiyagama",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
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
                                Icon(Icons.wb_sunny, color: Colors.orange,
                                    size: 35),
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
                      Expanded(child: _weatherDetail(
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
                      Expanded(child: _weatherDetail(
                          "Chance Of Rain", "50%", Icons.umbrella)),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
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
              Text(value, style: const TextStyle(color: Colors.white,
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
}
