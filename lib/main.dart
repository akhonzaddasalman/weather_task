import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/Controller/provider/theme_provider.dart';
import 'package:weather_application/Controller/provider/weatherProvider.dart';
import 'package:weather_application/View/Screens/homeScreen.dart';
import 'package:weather_application/View/Screens/hourlyWeatherScreen.dart';
import 'package:weather_application/View/Screens/weeklyWeatherScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => WeatherProvider())),
          ChangeNotifierProvider(create: ((context) => ThemeProvider(context))),
        ],
        child: Builder(builder: (context) {
          return Consumer<ThemeProvider>(builder: (context, ThemeProvider themeProvider, _) {
            return MaterialApp(
              title: 'Weather Application',
              debugShowCheckedModeBanner: false,
              theme: themeProvider.themeData,
              home: HomeScreen(),
              routes: {
                WeeklyScreen.routeName: (myCtx) => WeeklyScreen(),
                HourlyScreen.routeName: (myCtx) => HourlyScreen(),
              },
            );
          });
        }));
  }
}
