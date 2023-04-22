import 'package:flutter/material.dart';
import 'package:passpilot/features/check/widgets/user_data_field.dart';

class UserData extends StatelessWidget {
  final String userName;
  final String idNumber;
  const UserData({
    Key? key,
    required this.userName,
    required this.idNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          const SizedBox(
            height: 20,
          ),
          UserDataField(text1: 'User Name ', text2: userName),
          const SizedBox(
            height: 20,
          ),
          UserDataField(text1: 'Identification number ', text2: idNumber),
        ],
      ),
    );
  }
}
