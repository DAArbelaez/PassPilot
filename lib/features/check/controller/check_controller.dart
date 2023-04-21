import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:passpilot/apis/user_api.dart';
import 'package:passpilot/core/utils.dart';
import 'package:passpilot/models/log_model.dart';

final checkControllerProvider = Provider((ref) {
  return CheckController(userAPI: ref.watch(userAPIProvider));
});

class CheckController extends StateNotifier<bool> {
  final UserAPI _userAPI;
  CheckController({
    required UserAPI userAPI,
  })  : _userAPI = userAPI,
        super(false);

  Future<String> check({
    required String idNumber,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _userAPI.getUserData(
      idNumber: idNumber,
    );
    state = false;
    if (res.isEmpty) {
      print("User doesn't exist");
      // ignore: use_build_context_synchronously
      showSnackBar(context, "The user doesn't exist");
      return '';
    } else {
      try {
        DateTime now = DateTime.now();
        Timestamp timestamp = Timestamp.fromDate(now.toUtc());
        LogModel logModel = LogModel(
          checkInDate: timestamp,
          checkOutDate: timestamp,
          uid: idNumber,
        );
        await _userAPI.checkInTime(logModel: logModel);
        return res['name'];
      } catch (e) {
        return '';
      }
    }
  }
}
