import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/size_device_util.dart';

class CustomAppBarComponent extends StatelessWidget {
  final String title;
  final IconData? iconLeading;
  final bool showActions;
  final void Function()? onTapLeading;
  const CustomAppBarComponent({
    super.key, 
    required this.title, 
    this.onTapLeading, 
    this.iconLeading, 
    this.showActions = false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: ConstsUtils.fontregular,
          fontWeight: FontWeight.w600,
          color: Colors.white),
      ),
      leading: GestureDetector(
        onTap: onTapLeading,
        child: Container(
          margin: EdgeInsets.all(context.sizedDevice.width / 50),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.3),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: Icon(
              iconLeading ?? Icons.arrow_back,
              color: Colors.white,
              size: context.sizedDevice.width / 15,
            ),
          ),
        ),
      ),
      actions: !showActions ? [] : [

        Container(
        margin: EdgeInsets.all(context.sizedDevice.width / 50),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Icon(
            Icons.refresh,
            color: Colors.white,
            size: context.sizedDevice.width / 15,
          ),
        ),
      ),

      ],
    );
  }
}
