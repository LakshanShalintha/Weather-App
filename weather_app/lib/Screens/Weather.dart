import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("Kharkiv, Ukraine", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Current Temperature Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("3°", style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text("Feels like -2°", style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
                const Icon(Icons.wb_sunny, size: 64, color: Colors.amber),
              ],
            ),
            const SizedBox(height: 16),
            // Tabs
            DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.amber,
                    tabs: const [
                      Tab(text: "Today"),
                      Tab(text: "Tomorrow"),
                      Tab(text: "10 days"),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            // Day Forecast
            Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text("Day Forecast", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 16),
                    // Replace this with a graph widget
                    Container(
                      height: 150,
                      color: Colors.grey[800],
                      child: const Center(child: Text("Graph Placeholder", style: TextStyle(color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Chance of Rain
            Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Chance of Rain", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 16),
                    ...List.generate(
                      4,
                          (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${7 + index} PM", style: const TextStyle(color: Colors.white)),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: (index + 1) * 0.25,
                              color: Colors.amber,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Text("${(index + 1) * 20}%", style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Sunrise and Sunset
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _infoCard("Sunrise", "4:20 AM"),
                _infoCard("Sunset", "4:50 PM"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
