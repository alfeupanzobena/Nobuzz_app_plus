import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/components/custom_app_bar_component.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';

class InformationTab extends StatefulWidget {
  final void Function()? onTapLeading;
  const InformationTab({super.key, this.onTapLeading});

  @override
  State<InformationTab> createState() => _InformationTabState();
}

class _InformationTabState extends State<InformationTab> {

  List<InformationModel> informations = [
    InformationModel(name: "Sol", img: ConstsUtils.sun),
    InformationModel(name: "Nublado", img: ConstsUtils.cloudSunRain),
    InformationModel(name: "Chuva", img: ConstsUtils.cloudMoonRain),
    InformationModel(name: "Neve", img: ConstsUtils.cloudSnow),
    InformationModel(name: "Tempestade", img: ConstsUtils.cloudStorm),
    InformationModel(name: "Trovão", img: ConstsUtils.cloudRainThunder),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarComponent(
          title: "Informações",
          onTapLeading: widget.onTapLeading,
        ),

        Expanded(
          child: GridView.count(
            padding: EdgeInsets.zero,
            crossAxisCount: 3,
            childAspectRatio: .8,
            children: informations.map(
              (information) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: ConstsUtils.colorForInfo,
                      shape: BoxShape.circle
                    ),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: Image.asset(
                      information.img
                    ),
                  ),
                  const SizedBox(height: 10,),
        
                   Text(
                    information.name,
                    style: const TextStyle(
                      fontFamily: ConstsUtils.fontregular,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xffFFFFFF)
                    ),
                  )
                ],
              )
            ).toList()
          ),
        )

        
      ],
    );
  }
}

class InformationModel {
  final String name;
  final String img;

  InformationModel({
    required this.name,
    required this.img
  });
}