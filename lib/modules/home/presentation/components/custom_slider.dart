import 'package:base_project_v2/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _value = 40.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Price Per Night'),
        Slider(
          activeColor: AppColors.slider,
          max: 100,
          min: 0,
          value: _value,
          label: 'dd',
          divisions: 10,
          onChanged: (dynamic value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ],
    );
  }
}
