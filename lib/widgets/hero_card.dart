import 'package:flutter/material.dart';

import 'package:lirarate/shared/app_colors.dart';
import 'package:lirarate/shared/constants.dart';

class HeroCard extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  const HeroCard({
    Key? key,
    this.width = 100,
    this.height = 100,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kSecondaryBlue,
        borderRadius: BorderRadius.circular(AppSize.d28),
        border: Border.all(
          color: AppColors.kThirdBlue,
          width: 2,
        ),
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
