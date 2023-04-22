import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseDatabaseProvider = Provider((ref) {
  FirebaseFirestore db = FirebaseFirestore.instance;
  return db;
});
