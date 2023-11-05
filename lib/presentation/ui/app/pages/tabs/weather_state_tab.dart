import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/domain/entites/day_week_entity.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/helpers/img_by_status_helper.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/card_weath_state_horizontal_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/card_weath_state_shift_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/custom_app_bar_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/size_device_util.dart';

class WeatherStateTab extends StatelessWidget {
  final TimeEntity time;
  final List<TimeEntity> times;
  final DayWeekEntity dayweek;
  final void Function()? onTapLeading;
  final void Function()? onTapShiftCard;

  const WeatherStateTab(
      {super.key,
      required this.time,
      required this.dayweek,
      required this.times,
      this.onTapLeading,
      this.onTapShiftCard});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarComponent(
          title: time.estado ?? "",
          iconLeading: CupertinoIcons.square_grid_2x2_fill,
          showActions: true,
          onTapLeading: onTapLeading,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          dayweek.name ?? "",
          style: const TextStyle(
              fontFamily: ConstsUtils.fontregular,
              fontSize: 13,
              color: Color(0xffDEDDDD),
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          imgByStatus(status: dayweek.manha?.tempo ?? ""),
          height: 139,
          width: 172,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "${dayweek.manha?.graus ?? 0}º",
          style: const TextStyle(
              fontFamily: ConstsUtils.fontregular,
              fontSize: 81,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
        const Text(
          "26 de Maio de 2023",
          style: TextStyle(
              fontFamily: ConstsUtils.fontregular,
              fontSize: 13,
              color: Color(0xffDEDDDD),
              fontWeight: FontWeight.w600),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 10),
          alignment: Alignment.bottomLeft,
          child: const Text(
            "Hoje",
            style: TextStyle(
                fontFamily: ConstsUtils.fontregular,
                fontSize: 13,
                color: Color(0xffDEDDDD),
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 155,
          width: context.sizedDevice.width,
          child: Row(children: [
            CardWeathStateShiftComponent(
              index: 0,
              shift: "Manhã",
              imgDegree: imgByStatus(
                  status:
                      getWeekDay(weekday: DateTime.now().weekday, time: time)
                              ?.manha
                              ?.tempo ??
                          ""),
              degree:
                  "${getWeekDay(weekday: DateTime.now().weekday, time: time)?.manha?.graus ?? ""}º",
              onTap: onTapShiftCard,
            ),
            CardWeathStateShiftComponent(
              index: 1,
              shift: "Tarde",
              imgDegree: imgByStatus(
                  status:
                      getWeekDay(weekday: DateTime.now().weekday, time: time)
                              ?.tarde
                              ?.tempo ??
                          ""),
              degree:
                  "${getWeekDay(weekday: DateTime.now().weekday, time: time)?.tarde?.graus ?? ""}º",
              onTap: onTapShiftCard,
            ),
            CardWeathStateShiftComponent(
              index: 2,
              shift: "Noite",
              imgDegree: imgByStatus(
                  status:
                      getWeekDay(weekday: DateTime.now().weekday, time: time)
                              ?.noite
                              ?.tempo ??
                          ""),
              degree:
                  "${getWeekDay(weekday: DateTime.now().weekday, time: time)?.noite?.graus ?? ""}º",
              onTap: onTapShiftCard,
            )
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, bottom: 10),
          alignment: Alignment.bottomLeft,
          child: const Text(
            "Estados",
            style: TextStyle(
                fontFamily: ConstsUtils.fontregular,
                fontSize: 13,
                color: Color(0xffDEDDDD),
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 50,
          width: context.sizedDevice.width,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: times
                  .map((time) => CardWeathStateHorizontalCompoent(
                        index: times.indexOf(time),
                        state: time.estado ?? "",
                        degree:
                            "${getWeekDay(weekday: DateTime.now().weekday, time: time)?.manha?.graus ?? 0}",
                        imgDegree: imgByStatus(
                            status: getWeekDay(
                                        weekday: DateTime.now().weekday,
                                        time: time)
                                    ?.manha
                                    ?.tempo ??
                                ""),
                      ))
                  .toList()),
        ),
      ],
    );
  }

  DayWeekEntity? getWeekDay({required int weekday, required TimeEntity time}) {
    switch (weekday) {
      case 1:
        return time.segunda;
      case 2:
        return time.terca;
      case 3:
        return time.quarta;
      case 4:
        return time.quinta;
      case 5:
        return time.sexta;
      case 6:
        return time.sabado;
      case 7:
        return time.domingo;
      default:
        return time.segunda;
    }
  }
}
