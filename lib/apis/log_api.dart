import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passpilot/core/providers.dart';

final logAPIProvider = Provider((ref) {
  return LogAPI(db: ref.watch(firebaseDatabaseProvider));
});

class LogAPI {
  final FirebaseFirestore _db;
  LogAPI({
    required FirebaseFirestore db,
  }) : _db = db;

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getLogs() {
    return _db.collection('Logs').get().then((querySnapshot) {
      return querySnapshot.docs;
    });
  }
}
