import 'package:flutter/material.dart';

class ConstsUtils {

  // Strings
  static const titleApp = "Weather App";

  // IMAGES
  static const backgroundCloud    = "assets/imgs/background_cloud.png";
  static const cloudMoonRain      = "assets/imgs/clouds/cloud_moon_rain.png";
  static const cloudRainThunder   = "assets/imgs/clouds/cloud_rain_thunder.png";
  static const cloudSunRain       = "assets/imgs/clouds/cloud_sun_rain.png";
  static const cloudSun           = "assets/imgs/clouds/cloud_sun.png";
  static const cloudSnow          = "assets/imgs/clouds/cloud_snow.png";
  static const cloudStorm         = "assets/imgs/clouds/cloud_storm.png";
  static const sun                = "assets/imgs/clouds/sun.png";

  // FONTS
  static const fontregular  = "Regular";
  static const fontLight    = "Light";
  static const fontBold     = "Bold";


  // GRADIENTS
  static const gradientForPage = LinearGradient(
    colors: [
      Color(0xff352163),
      Color(0xff331972),
      Color(0xff33143C)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  );

  static LinearGradient  gradientForCard = LinearGradient(
    colors: [
      const Color(0xff957DCD).withOpacity(.5),
      const Color(0xff523D7F).withOpacity(.5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter
  );

  // COLORS 
  static  Color colorForInfo = const Color(0xff030303).withOpacity(.23);
  
}