import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/size_device_util.dart';

class CardWeatherState extends StatelessWidget {
  final String state;
  final String imgWeather;
  final void Function()? onTap;
  const CardWeatherState({
    super.key, 
    required this.state, 
    required this.imgWeather, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sizedDevice.width,
      margin: const EdgeInsets.only(bottom: 10),
      height: 114,
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              width: context.sizedDevice.width / 1.3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                gradient: ConstsUtils.gradientForCard,
                borderRadius: BorderRadius.circular(15)
              ),
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                state,
                style: TextStyle(
                  fontFamily: ConstsUtils.fontregular,
                  fontSize: context.sizedDevice.width / 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
            ),
            
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                imgWeather,
                fit: BoxFit.cover,
                width: 145,
                height: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
