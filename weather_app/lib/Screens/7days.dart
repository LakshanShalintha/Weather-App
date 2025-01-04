import 'package:flutter/material.dart';

class SevenDaysForecast extends StatelessWidget {
  const SevenDaysForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return WeatherCard(
                  day: _getDayLabel(index),
                  temp: "3°",
                  minTemp: "-2°",
                  weatherIcon: index % 2 == 0 ? Icons.wb_sunny : Icons.cloud,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getDayLabel(int index) {
    final today = DateTime.now();
    final targetDay = today.add(Duration(days: index));
    return "${targetDay.weekday == today.weekday ? "Today" : "Thursday, Jan ${targetDay.day}"}";
  }
}

class WeatherCard extends StatelessWidget {
  final String day;
  final String temp;
  final String minTemp;
  final IconData weatherIcon;

  const WeatherCard({
    Key? key,
    required this.day,
    required this.temp,
    required this.minTemp,
    required this.weatherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade900,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: ListTile(
        leading: Icon(
          weatherIcon,
          size: 40,
          color: Colors.yellow,
        ),
        title: Text(
          day,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Row(
          children: [
            Text(
              "$temp ",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 8),
            Text(
              minTemp,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
