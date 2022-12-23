import 'package:flutter/material.dart';
import 'package:tapshyrma_9/app/constants/app_texts/app_texts.dart';

import '../../../app/constants/app_text_style/app_text_style.dart';

TextEditingController controller = TextEditingController();

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: AppTexts.search,
        hintStyle: AppTextStyles.whiteColor30,
      ),
      controller: controller,
    );
  }
}
