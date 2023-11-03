import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/domain/entites/day_week_entity.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/helpers/img_by_status_helper.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/card_weather_state_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/custom_app_bar_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  final List<TimeEntity> times;
  final void Function(TimeEntity) onChanged;
  HomeTab({super.key, required this.times, required this.onChanged});

  List<String> imgsTime = [
    ConstsUtils.cloudSun,
    ConstsUtils.cloudSunRain,
    ConstsUtils.cloudMoonRain,
    ConstsUtils.cloudSunRain,
    ConstsUtils.cloudSunRain,
    ConstsUtils.cloudSun,
    ConstsUtils.cloudSunRain,
    ConstsUtils.cloudMoonRain,
    ConstsUtils.cloudSunRain,
    ConstsUtils.cloudSunRain
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBarComponent(title: "Search for City",),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 30,
              bottom: 20
            ),
            children: times.map(
              (time) => CardWeatherState(
                state: time.estado ?? "", 
                imgWeather: imgByStatus(status: getWeekDay(weekday: DateTime.now().weekday, time: time)!.manha?.tempo ?? "" ),
                onTap: () {
                  onChanged(time);
                },
              )
            ).toList(),
          ),
        ),
      ],
    );
  }

  DayWeekEntity? getWeekDay({ required int weekday, required TimeEntity time }) {
    switch (weekday) {
      case 1: return time.segunda;
      case 2: return time.terca;
      case 3: return time.quarta;
      case 4: return time.quinta;
      case 5: return time.sexta;
      case 6: return time.sabado;
      case 7: return time.sabado;
      default: return time.segunda;
    }
  }
}