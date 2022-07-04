import 'package:flutter/material.dart';
import 'package:lirarate/shared/constants.dart';

class FuelDataRow extends StatelessWidget {
  final String name;
  final String price;
  const FuelDataRow({
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          name,
          style: AppTextStyles.kFuelListStyle,
        ),
        Text(
          price,
          style: AppTextStyles.kFuelListStyle,
        )
      ],
    );
  }
}
