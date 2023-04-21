import 'package:flutter/material.dart';
import 'package:passpilot/constants/text_constants.dart';

class UserDataField extends StatelessWidget {
  final String text1;
  final String text2;

  const UserDataField({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text1,
          style: TextConstants.kRegularStyleText,
          children: [
            TextSpan(
              text: text2,
              style: TextConstants.kRegularStyleText.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ]),
    );
  }
}
