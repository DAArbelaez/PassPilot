import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passpilot/common/rounded_small_button.dart';
import 'package:passpilot/constants/text_constants.dart';
import 'package:passpilot/features/check/controller/check_controller.dart';
import 'package:passpilot/features/check/widgets/identification_field.dart';
import 'package:passpilot/features/check/widgets/user_data.dart';

class EntryView extends ConsumerStatefulWidget {
  const EntryView({super.key});

  @override
  ConsumerState<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends ConsumerState<EntryView> {
  var identificationController = TextEditingController();
  String _user = '';
  String _userId = '';

  @override
  void dispose() {
    identificationController.dispose();
    super.dispose();
  }

  void onCheck() {
    var user = ref.read(checkControllerProvider).checkIn(
          idNumber: identificationController.text,
          context: context,
        );
    user.then(
      (value) {
        setState(() {
          _user = value;
          _userId = identificationController.text;
          identificationController = TextEditingController(
            text: '',
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
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
                  onTap: onCheck,
                  label: 'Done',
                ),
              ),
              if (_user != '')
                UserData(
                  userName: _user,
                  idNumber: _userId,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
