import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';

class CardWeathStateHorizontalCompoent extends StatelessWidget {
  final String state;
  final String degree;
  final String imgDegree;
  final int index;
  const CardWeathStateHorizontalCompoent({
    super.key,
    required this.state,
    required this.degree,
    required this.imgDegree,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: index == 2 ? 10 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        gradient: ConstsUtils.gradientForCard,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Center(
            child: Image.asset(
              imgDegree,
              width: 37,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            state,
            style: const TextStyle(
              fontFamily: ConstsUtils.fontregular,
              fontSize: 13,
              color: Color(0xffDEDDDD),
              fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 10,
          ),
           Center(
            child: Text(
              "$degreeº",
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
    );
  }
}
