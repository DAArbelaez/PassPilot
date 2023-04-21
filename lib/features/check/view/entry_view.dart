import 'package:flutter/material.dart';
import 'package:passpilot/common/rounded_small_button.dart';
import 'package:passpilot/constants/text_constants.dart';
import 'package:passpilot/features/check/widgets/identification_field.dart';

class EntryView extends StatefulWidget {
  const EntryView({super.key});

  @override
  State<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> {
  final identificationController = TextEditingController();

  @override
  void dispose() {
    identificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const Text(
            'Entry',
            style: TextConstants.kSubTitleStyleText,
          ),
          const SizedBox(height: 45),
          IdentificateField(
            controller: identificationController,
            hintText: 'Identification Number',
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topRight,
            child: RoundedSmallButton(
              onTap: () {},
              label: 'Done',
            ),
          ),
        ],
      ),
    );
  }
}
