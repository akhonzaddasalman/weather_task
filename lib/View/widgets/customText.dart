import 'package:flutter/material.dart';
import 'package:weather_application/Controller/provider/theme_provider.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextOverflow? overflow;
  final TextStyle? textStyle;

  const CustomTextWidget({key, required this.text, this.textStyle, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: textStyle ??
          TextStyle(color: CustomTheme.dark == true ? Colors.white : Colors.black, fontWeight: FontWeight.normal, fontSize: 16), // This can be
      // null if
      // textStyle is
      // not
      // provided
    );
  }
}
