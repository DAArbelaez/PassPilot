import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passpilot/common/rounded_small_button.dart';
import 'package:passpilot/constants/text_constants.dart';
import 'package:passpilot/core/utils.dart';
import 'package:passpilot/features/check/controller/check_controller.dart';
import 'package:passpilot/features/check/widgets/identification_field.dart';
import 'package:passpilot/features/check/widgets/user_data.dart';

class ExitView extends ConsumerStatefulWidget {
  const ExitView({super.key});

  @override
  ConsumerState<ExitView> createState() => _EntryViewState();
}

class _EntryViewState extends ConsumerState<ExitView> {
  var identificationController = TextEditingController();
  String _user = '';
  String _userId = '';

  @override
  void dispose() {
    identificationController.dispose();
    super.dispose();
  }

  void onCheck() {
    if (_userId == identificationController.text) {
      showSnackBar(context, "You can't update the date again");
      setState(() {
        _userId = identificationController.text;
        identificationController = TextEditingController(
          text: '',
        );
      });
      return;
    }
    var user = ref.read(checkControllerProvider).checkOut(
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
                'Exit',
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
