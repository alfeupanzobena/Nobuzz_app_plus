import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/size_device_util.dart';
import 'package:skeletons/skeletons.dart';

class LoaderHome extends StatelessWidget {
  const LoaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.sizedDevice.height,
        width: context.sizedDevice.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: ConstsUtils.gradientForPage
        ),
        child: Column(
          children: [

            Expanded(
              child: SkeletonLine(
              style: SkeletonLineStyle(
                  height: double.infinity,
                  width: context.sizedDevice.width,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}