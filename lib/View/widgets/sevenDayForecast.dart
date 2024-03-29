import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/Controller/helper/utils.dart';
import 'package:weather_application/Controller/provider/theme_provider.dart';
import 'package:weather_application/Controller/provider/weatherProvider.dart';
import 'package:weather_application/View/Constants/Colors/colors.dart';

class SevenDayForecast extends StatelessWidget {
  Widget dailyWidget(dynamic weather, BuildContext context, ThemeProvider themeProvider) {
    final dayOfWeek = DateFormat('EEE').format(weather.date);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Column(
        children: [
          FittedBox(
            child: Text(
              dayOfWeek,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
            child: MapString.mapStringToIcon(context, '${weather.condition}', 35, themeProvider),
          ),
          Text(
            '${weather.condition}',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, ThemeProvider themeProvider, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0),
            child: Text(
              'Next 7 Days',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(15),
              color: themeProvider.isDarkMode ? kPrimaryColor : kWhiteColor,
              child: ListView(
                padding: const EdgeInsets.all(25.0),
                shrinkWrap: true,
                children: [
                  Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              '${weatherProv.weather.temp.toStringAsFixed(1)}°',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            MapString.mapInputToWeather(
                              context,
                              '${weatherProv.weather.currently}',
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: MapString.mapStringToIcon(context, '${weatherProv.weather.currently}', 45, themeProvider),
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 15),
                  Consumer<WeatherProvider>(builder: (context, weatherProv, _) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: weatherProv.sevenDayWeather.map((item) => dailyWidget(item, context, themeProvider)).toList(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
