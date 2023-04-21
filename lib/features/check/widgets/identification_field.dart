import 'package:flutter/material.dart';
import 'package:passpilot/constants/text_constants.dart';
import 'package:passpilot/theme/pallette.dart';

class IdentificateField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const IdentificateField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Pallete.blueColor,
            width: 2.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Pallete.greyColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(22),
        hintText: hintText,
        hintStyle: TextConstants.kRegularStyleText,
      ),
    );
  }
}
