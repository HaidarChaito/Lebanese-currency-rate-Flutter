import 'package:flutter/material.dart';
import 'package:lirarate/shared/app_colors.dart';
import 'package:lirarate/shared/constants.dart';

class BottomCard extends StatelessWidget {
  final List<String> child;
  final double width;
  final double height;
  const BottomCard({
    required this.child,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          height: height * 0.15,
          margin: EdgeInsets.symmetric(
              vertical: height * 0.05, horizontal: width * 0.05),
          decoration: BoxDecoration(
            color: AppColors.kPrimaryWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.kSecondaryWhite.withOpacity(0.8),
                offset: const Offset(-6.0, -6.0),
                blurRadius: 16.0,
              ),
              BoxShadow(
                color: AppColors.kPrimaryBlue.withOpacity(0.4),
                offset: const Offset(6.0, 6.0),
                blurRadius: 16.0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(AppSize.d8),
            child: Text(
              child[index],
              style: AppTextStyles.kFuelListStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        itemCount: 4,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.d28),
          topRight: Radius.circular(AppSize.d28),
        ),
        color: AppColors.kSecondaryWhite,
      ),
    );
  }
}
