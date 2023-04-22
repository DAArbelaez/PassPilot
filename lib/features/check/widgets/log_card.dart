import 'package:flutter/material.dart';
import 'package:passpilot/features/check/widgets/user_data_field.dart';

class LogCard extends StatelessWidget {
  final String uid;
  final String checkInDate;
  final String checkOutDate;
  const LogCard({
    super.key,
    required this.uid,
    required this.checkInDate,
    required this.checkOutDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          UserDataField(text1: 'User id ', text2: uid),
          UserDataField(text1: 'Entry date ', text2: checkInDate),
          UserDataField(text1: 'Exit date ', text2: checkOutDate),
        ],
      ),
    );
  }
}
