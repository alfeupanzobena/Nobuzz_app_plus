import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:nobuzz_app_plus/domain/entites/day_week_entity.dart';
import 'package:nobuzz_app_plus/domain/entites/time_entity.dart';
import 'package:nobuzz_app_plus/presentation/controllers/time_controller/time_controller.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/loaders/loader_home.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/pages/tabs/home_tab.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/pages/tabs/informations_tab.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/pages/tabs/weather_days_tab.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/pages/tabs/weather_state_tab.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/menu_item_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/size_device_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  int indexMenu = 0;
  List<IconData> menuItens = [
    Icons.home,
    Icons.search,
    CupertinoIcons.person,
    CupertinoIcons.bell
  ];

  TimeEntity time = TimeEntity();
  DayWeekEntity dayWeek = DayWeekEntity(name: "", number: 0);

  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 200)
    );
    timesController.getTimes();
    super.initState();
  }

  selectItemMenu({required int index})  {
    controller.reset();
    controller.forward(); 
    setState(() => indexMenu = index);
  }

  final timesController = GetIt.I.get<TimeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: context.sizedDevice.height,
          width: context.sizedDevice.width,
          decoration: const BoxDecoration(
            color: Colors.red,
            gradient: ConstsUtils.gradientForPage,
          ),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: indexMenu == 3 ? 0 : .2,
            child: Image.asset(
              ConstsUtils.backgroundCloud,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Observer(
          builder: (context) {
            return timesController.isLoading ? const LoaderHome() : Scaffold(
              backgroundColor: Colors.transparent,
              body: SizedBox(
                height: context.sizedDevice.height,
                width: context.sizedDevice.width,
                child: FadeIn(
                  controller: (animationCtrl) => controller = animationCtrl,
                  child: switchTab(index: indexMenu, times: timesController.times)
                ),
              ),
        
              bottomNavigationBar: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: (context.sizedDevice.width / 20) / 2
                ),
                child: Row(
                  children: menuItens.map(
                    (item) => MenuItemComponent(
                      icon: item,
                      selected: indexMenu == menuItens.indexOf(item),  
                    )
                  ).toList(),
                ),
              ),
            );
          }
        )
      ],
    );
  }


  Widget switchTab({ required int index, required List<TimeEntity> times}) {
    switch (index) {
      case 0: return HomeTab(
        times: times,
        onChanged: (time) {
          setState(() => this.time = time);
          selectItemMenu(index: 1);
        },
      );
      case 1: return WeatherDaysTab(
        time: time,
        onTapLeading: () => selectItemMenu(index: 0),
        onTapDay: (dayWeek) {
          setState(() => this.dayWeek = dayWeek);
          selectItemMenu(index: 2);
        },
      );
      case 2: return WeatherStateTab(
        onTapLeading: () => selectItemMenu(index: 0),
        time: time,
        times: times,
        dayweek: dayWeek,
        onTapShiftCard: () => selectItemMenu(index: 3),
      );
      case 3: return InformationTab(
        onTapLeading: () => selectItemMenu(index: 2),
      );
      default: return const InformationTab();
    }
  }
}