import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passpilot/core/providers.dart';
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
      Map<String, dynamic> user = {};
      for (var docSnapshot in value.docs) {
        user.addAll(docSnapshot.data());
      }
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

  Future<String> checkOutTime({
    required String idNumber,
    required Timestamp checkOutTime,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection('Logs')
        .where('uid', isEqualTo: idNumber)
        .orderBy('checkInDate', descending: true)
        .limit(1)
        .get();
    if (snapshot.docs.isNotEmpty) {
      final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          snapshot.docs[0];
      final String docId = docSnapshot.id;

      await _db
          .collection('Logs')
          .doc(docId)
          .update({'checkOutDate': checkOutTime});

      final userData = await getUserData(idNumber: idNumber);
      return userData['name'];
    }
    return '';
  }
}
