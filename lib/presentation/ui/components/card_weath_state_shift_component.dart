import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';

class CardWeathStateShiftComponent extends StatelessWidget {
  final String shift;
  final String degree;
  final String imgDegree;
  final int index;
  final void Function()? onTap;
  const CardWeathStateShiftComponent({
    super.key,
    required this.shift,
    required this.degree,
    required this.imgDegree,
    required this.index,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(left: 10, right: index == 2 ? 10 : 0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.5),
            gradient: ConstsUtils.gradientForCard,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shift,
                style: const TextStyle(
                  fontFamily: ConstsUtils.fontregular,
                  fontSize: 13,
                  color: Color(0xffDEDDDD),
                  fontWeight: FontWeight.w600
                ),
              ),
      
              Center(
                child: Image.asset(
                  imgDegree,
                  width: 74,
                  height: 47,
                ),
              ),
      
              Center(
                child: Text(
                  degree,
                  style: const TextStyle(
                    fontFamily: ConstsUtils.fontregular,
                    fontSize: 13,
                    color: Color(0xffDEDDDD),
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
