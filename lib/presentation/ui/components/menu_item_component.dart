import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/size_device_util.dart';

class MenuItemComponent extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final void Function()? onTap;
  const MenuItemComponent({
    super.key, 
    required this.icon, 
    required this.selected, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: context.sizedDevice.height / 15,
          margin: EdgeInsets.symmetric(
            horizontal: context.sizedDevice.width / 20
          ),
          decoration: BoxDecoration(
            color: selected ? Colors.white.withOpacity(.5) : Colors.transparent,
            gradient: ConstsUtils.gradientForCard,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22), 
              topRight: Radius.circular(22)
            )
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
