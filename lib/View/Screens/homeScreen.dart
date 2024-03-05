import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/Controller/provider/theme_provider.dart';
import 'package:weather_application/Controller/provider/weatherProvider.dart';
import 'package:weather_application/View/Constants/Colors/colors.dart';
import 'package:weather_application/View/Screens/Drawer/drawer_screen.dart';
import 'package:weather_application/View/widgets/searchBar.dart';

import '../widgets/fadeIn.dart';
import '../widgets/locationError.dart';
import '../widgets/mainWeather.dart';
import '../widgets/requestError.dart';
import '../widgets/sevenDayForecast.dart';
import '../widgets/weatherDetail.dart';

GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.getWeatherData();
    _isLoading = false;
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false).getWeatherData(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    final themeContext = Theme.of(context);

    return Consumer<ThemeProvider>(builder: (context, ThemeProvider themeProvider, _) {
      return Scaffold(
        key: mainScaffoldKey,
        resizeToAvoidBottomInset: false,
        drawerEnableOpenDragGesture: false,
        drawer: const MainDrawer(),
        appBar: AppBar(
          backgroundColor: themeProvider.isDarkMode ? kPrimaryColor : kWhiteColor,
          leading: InkWell(
            onTap: () {
              mainScaffoldKey.currentState?.openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: themeProvider.isDarkMode ? kWhiteColor : kBlackColor,
              size: 28,
            ),
          ),
          title: Text(
            'Weather Task',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: themeProvider.isDarkMode ? kWhiteColor : kBlackColor),
          ),
        ),
        body: SafeArea(
          child: Consumer<WeatherProvider>(
            builder: (context, weatherProv, _) {
              if (weatherProv.isLocationError) {
                return LocationError();
              }
              if (weatherProv.isRequestError) {
                return RequestError();
              }
              return Column(
                children: [
                  SearchBarWidget(),
                  _isLoading || weatherProv.isLoading
                      ? Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: themeContext.primaryColor,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Expanded(
                          child: RefreshIndicator(
                            onRefresh: () async => _refreshData(context),
                            child: ListView(
                              padding: const EdgeInsets.all(10),
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              children: [
                                FadeIn(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 250),
                                  child: MainWeather(),
                                ),
                                FadeIn(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 250),
                                  child: SevenDayForecast(),
                                ),
                                FadeIn(
                                  curve: Curves.easeIn,
                                  duration: Duration(milliseconds: 500),
                                  child: WeatherDetail(),
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      );
    });
  }
}
