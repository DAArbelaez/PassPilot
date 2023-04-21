import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passpilot/core/providers.dart';
import 'package:passpilot/core/utils.dart';
import 'package:passpilot/models/log_model.dart';

final userAPIProvider = Provider((ref) {
  final db = ref.watch(firebaseDatabaseProvider);
  return UserAPI(db: db);
});

class UserAPI {
  final FirebaseFirestore _db;
  UserAPI({
    required FirebaseFirestore db,
  }) : _db = db;

  Future<Map<String, dynamic>> getUserData({
    required String idNumber,
  }) {
    return _db
        .collection("users")
        .where(
          'idNumber',
          isEqualTo: idNumber,
        )
        .get()
        .then((value) {
      print('Successfully completed');
      Map<String, dynamic> user = {};
      for (var docSnapshot in value.docs) {
        user.addAll(docSnapshot.data());
      }
      print(user.values);
      return user;
    }, onError: (e) {
      return null;
    });
  }

  Future<bool> checkInTime({
    required LogModel logModel,
  }) async {
    return _db.collection('Logs').add(logModel.toMap()).then(
          (value) => true,
          onError: (e) => false,
        );
  }
}
