import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/size_device_util.dart';

class WeatherDayComponent extends StatelessWidget {
  final String day;
  final String status;
  final String imgstatus;
  final String grau;
  final void Function()? onTap;
  const WeatherDayComponent({super.key,
    required this.day,
    required this.status,
    required this.imgstatus,
    required this.grau,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: context.sizedDevice.width / 2.5,
            child: Text(
              day,
              style: TextStyle(
                fontFamily: ConstsUtils.fontregular,
                fontSize: context.sizedDevice.width / 25,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
            ),
          ),
    
          Image.asset(
            imgstatus,
            height: 57,
            width: 50,
          ),
          const SizedBox(width: 10,),    
          Text(
            status,
            style: TextStyle(
              fontFamily: ConstsUtils.fontregular,
              fontSize: context.sizedDevice.width / 25,
              fontWeight: FontWeight.w600,
              color: const Color(0xffFFFFFF).withOpacity(.6)
            ),
          ),
    
          const Spacer(),
          Text(
            grau,
            style: TextStyle(
              fontFamily: ConstsUtils.fontregular,
              fontSize: context.sizedDevice.width / 25,
              fontWeight: FontWeight.w600,
              color: const Color(0xffFFFFFF).withOpacity(.6)
            ),
          ),
        ],
      ),
    );
  }
}
