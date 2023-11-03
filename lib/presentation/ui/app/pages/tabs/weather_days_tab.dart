import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/domain/entites/day_week_entity.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/helpers/img_by_status_helper.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/custom_app_bar_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/weather_day_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/size_device_util.dart';

class WeatherDaysTab extends StatefulWidget {
  final TimeEntity time;
  final void Function()? onTapLeading;
  final void Function(DayWeekEntity) onTapDay;
  const WeatherDaysTab({super.key, required this.time, this.onTapLeading, required this.onTapDay});

  @override
  State<WeatherDaysTab> createState() => _WeatherDaysTabState();
}

class _WeatherDaysTabState extends State<WeatherDaysTab> {

  List<DayWeekEntity?> daysWeek = [];

  @override
  void initState() {
    daysWeek.addAll([
      widget.time.segunda,
      widget.time.terca,
      widget.time.quarta,
      widget.time.quinta,
      widget.time.sexta,
      widget.time.sabado,
      widget.time.domingo,
    ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarComponent(
          title: "7 Dias", 
          onTapLeading: widget.onTapLeading,
        ),
        const SizedBox(height: 15,),

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10
          ),
          child: Column(
            children: [
              Text(
                getWeekDay(weekday: DateTime.now().weekday)?.name ?? "",
                style: const TextStyle(
                  fontFamily: ConstsUtils.fontregular,
                  fontSize: 18.35,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ),

              const SizedBox(height: 10,),
        
              Container(
                width: context.sizedDevice.width,
                height: 165,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.5),
                  borderRadius: BorderRadius.circular(15),
                  gradient: ConstsUtils.gradientForCard
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      imgByStatus(status: getWeekDay(weekday: DateTime.now().weekday)?.manha?.tempo ?? ""),
                      height: 132,
                      width: 169,
                      fit: BoxFit.cover,
                    ),
        
        
                    Text(
                      "${(getWeekDay(weekday: DateTime.now().weekday)?.manha?.graus ?? 0)}º",
                      style: const TextStyle(
                        fontFamily: ConstsUtils.fontregular,
                        fontSize: 55,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),
        
        
                  ],
                ),
              ),


              SizedBox(height: context.sizedDevice.height / 10),

               Column(
                children: daysWeek.sublist(
                  daysWeek.indexOf(
                    daysWeek.firstWhere((element) => element?.number == DateTime.now().weekday)
                  ) + 1,
                  daysWeek.length
                ).map(
                  (dayweek) => WeatherDayComponent(
                    day: dayweek?.name ?? "",
                    status: dayweek?.manha?.tempo ?? "", 
                    imgstatus: imgByStatus(status: dayweek?.manha?.tempo ?? ""), 
                    grau: "${dayweek?.manha?.graus ?? ""}º",
                    onTap: ()=> widget.onTapDay(dayweek!),
                  ) 
                ).toList()
               ),

               Column(
                children: daysWeek.sublist(
                  0,
                  daysWeek.indexOf(
                    daysWeek.firstWhere((element) => element?.number == DateTime.now().weekday)
                  )
                ).map(
                  (dayweek) => WeatherDayComponent(
                    day: dayweek?.name ?? "",
                    status: dayweek?.manha?.tempo ?? "", 
                    imgstatus: imgByStatus(status: dayweek?.manha?.tempo ?? ""), 
                    grau: "${dayweek?.manha?.graus ?? ""}º",
                    onTap: ()=> widget.onTapDay(dayweek!),
                  ) 
                ).toList()
               )
            ],
          ),
        )
      ],

    );
  }

  DayWeekEntity? getWeekDay({ required int weekday }) {
    switch (weekday) {
      case 1: return widget.time.segunda;
      case 2: return widget.time.terca;
      case 3: return widget.time.quarta;
      case 4: return widget.time.quinta;
      case 5: return widget.time.sexta;
      case 6: return widget.time.sabado;
      case 7: return widget.time.sabado;
      default: return widget.time.segunda;
    }
  }
}