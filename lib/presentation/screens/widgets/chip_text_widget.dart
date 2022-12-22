import 'package:flutter/material.dart';

import '../../../app/constants/app_colors/app_colors.dart';

class ChipTextWidget extends StatelessWidget {
  final String? titleText;
  const ChipTextWidget({
    required this.titleText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Chip(
      backgroundColor: Colors.black45,
      // elevation: 0.0,
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Text(
          titleText!,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: size.height * 0.03,
          ),
        ),
      ),
    );
  }
}
