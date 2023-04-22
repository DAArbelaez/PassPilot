import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passpilot/apis/log_api.dart';
import 'package:passpilot/apis/user_api.dart';
import 'package:passpilot/core/utils.dart';
import 'package:passpilot/models/log_model.dart';

final checkControllerProvider = Provider((ref) {
  return CheckController(
    userAPI: ref.watch(userAPIProvider),
    logAPI: ref.watch(logAPIProvider),
  );
});

final getLogsProvider = FutureProvider((ref) async {
  final checkController = ref.watch(checkControllerProvider);
  return checkController.getLogs();
});

class CheckController extends StateNotifier<bool> {
  final LogAPI _logAPI;
  final UserAPI _userAPI;
  CheckController({
    required UserAPI userAPI,
    required LogAPI logAPI,
  })  : _userAPI = userAPI,
        _logAPI = logAPI,

  return CheckController(userAPI: ref.watch(userAPIProvider));
});

class CheckController extends StateNotifier<bool> {
  final UserAPI _userAPI;
  CheckController({
    required UserAPI userAPI,
  })  : _userAPI = userAPI,
        super(false);

  Future<String> checkIn({
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

  Future<String> checkOut({
    required String idNumber,
    required BuildContext context,
  }) async {
    state = true;
    DateTime now = DateTime.now();
    Timestamp timestamp = Timestamp.fromDate(now.toUtc());
    final res = await _userAPI.checkOutTime(
      idNumber: idNumber,
      checkOutTime: timestamp,
    );
    state = false;

    if (res.isEmpty) {
      print("User doesn't exist");
      // ignore: use_build_context_synchronously
      showSnackBar(context, "The user doesn't exist");
      return '';
    } else {
      return res;
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getLogs() async {
    final logsList = await _logAPI.getLogs();
    return logsList;
  }

}
