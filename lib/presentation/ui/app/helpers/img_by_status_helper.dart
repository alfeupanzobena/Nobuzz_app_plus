
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';

String imgByStatus({ required String status }) {
  switch (status) {
    case "Sol": return ConstsUtils.sun;
    case "Tempestade": return ConstsUtils.cloudMoonRain;
    case "Nublado": return ConstsUtils.cloudSunRain;
    case "Chuva": return ConstsUtils.cloudRainThunder;
    case "Trovão": return ConstsUtils.cloudRainThunder;

    default: return ConstsUtils.cloudMoonRain;
  }
}