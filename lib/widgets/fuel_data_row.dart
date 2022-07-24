import 'package:flutter/material.dart';

import 'package:lirarate/shared/constants.dart';

class FuelDataRow extends StatelessWidget {
  final String name;
  final String price;
  const FuelDataRow({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Text(
            name,
            style: AppTextStyles.kFuelListStyle,
          ),
          Text(
            price,
            style: AppTextStyles.kFuelListStyle,
          ),
        ]),
      ],
    );
  }
}
