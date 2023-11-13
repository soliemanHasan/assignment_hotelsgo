import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum Rate {
  veryBad,
  bad,
  good,
  verygood,
  exelent,
}

final Map<Rate, Map<String, dynamic>> rateValues = {
  Rate.veryBad: {'value': 0, 'color': AppColors.index1},
  Rate.bad: {'value': 7, 'color': AppColors.index2},
  Rate.good: {'value': 7.5, 'color': AppColors.index3},
  Rate.verygood: {'value': 8, 'color': AppColors.index4},
  Rate.exelent: {'value': 8.5, 'color': AppColors.index5},
};

class RateContainer extends StatelessWidget {
  final Rate rate;

  const RateContainer({Key? key, required this.rate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = rateValues[rate]!['value'];
    final color = rateValues[rate]!['color'];

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          '+$value',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
