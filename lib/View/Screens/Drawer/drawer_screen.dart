import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_application/Controller/provider/theme_provider.dart';
import 'package:weather_application/View/widgets/customText.dart';

import '../../Constants/Colors/colors.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, ThemeProvider themeProvider, _) {
      return Drawer(
        width: (MediaQuery.of(context).size.width) / 1.3,
        backgroundColor: themeProvider.isDarkMode ? kPrimaryColor : kWhiteColor,
        child: Container(
          color: themeProvider.isDarkMode ? kPrimaryColor.withOpacity(0.4) : kWhiteColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_outlined,
                    size: 35,
                    color: themeProvider.isDarkMode ? kWhiteColor : kBlackColor,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  bool isSystemTheme = themeProvider.themeMode == CustomTheme.system;
                  themeProvider.toggleTheme(isSystemTheme ? CustomTheme.dark : CustomTheme.system);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: kLightGreyColor, // You can use any color you want
                        width: 1.0, // Adjust the width of the border
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Default",
                        textStyle:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: themeProvider.isDarkMode ? kWhiteColor : kDrawerTextColor),
                      ),
                      const Spacer(),
                      themeProvider.themeMode == CustomTheme.system
                          ? Icon(
                              Icons.check,
                              size: 26,
                              color: themeProvider.isDarkMode ? kWhiteColor : kBlackColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  bool isSystemTheme = themeProvider.themeMode == CustomTheme.light;
                  themeProvider.toggleTheme(isSystemTheme ? CustomTheme.dark : CustomTheme.light);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: kLightGreyColor, // You can use any color you want
                        width: 1.0, // Adjust the width of the border
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Light",
                        textStyle:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: themeProvider.isDarkMode ? kWhiteColor : kDrawerTextColor),
                      ),
                      const Spacer(),
                      themeProvider.themeMode == CustomTheme.light
                          ? Icon(
                              Icons.check,
                              size: 26,
                              color: themeProvider.isDarkMode ? kWhiteColor : kBlackColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  bool isSystemTheme = themeProvider.themeMode == CustomTheme.dark;
                  themeProvider.toggleTheme(isSystemTheme ? CustomTheme.light : CustomTheme.dark);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: kLightGreyColor, // You can use any color you want
                        width: 1.0, // Adjust the width of the border
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Dark",
                        textStyle:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: themeProvider.isDarkMode ? kWhiteColor : kDrawerTextColor),
                      ),
                      const Spacer(),
                      themeProvider.themeMode == CustomTheme.dark
                          ? Icon(
                              Icons.check,
                              size: 26,
                              color: themeProvider.isDarkMode ? kWhiteColor : kBlackColor,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
