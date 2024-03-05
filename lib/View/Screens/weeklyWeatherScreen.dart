import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/Controller/helper/utils.dart';
import 'package:weather_application/Controller/provider/theme_provider.dart';
import 'package:weather_application/Controller/provider/weatherProvider.dart';

class WeeklyScreen extends StatelessWidget {
  static const routeName = '/weeklyScreen';

  Widget dailyWidget(dynamic weather, BuildContext context, ThemeProvider themeProvider) {
    final dayOfWeek = DateFormat('EEEEE').format(weather.date);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                dayOfWeek,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              Text(
                '${weather.dailyTemp.toStringAsFixed(1)}°',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 15),
                child: MapString.mapStringToIcon(context, weather.condition, 25, themeProvider),
              ),
            ],
          ),
          Divider(color: Colors.black),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    final mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Consumer<ThemeProvider>(builder: (context, ThemeProvider themeProvider, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              'Next 7 Days',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Container(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            child: Column(
              children: weatherData.sevenDayWeather.map((item) => dailyWidget(item, context, themeProvider)).toList(),
            ),
          ),
        );
      }),
    );
  }
}
