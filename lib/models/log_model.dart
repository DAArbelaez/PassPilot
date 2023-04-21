import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class LogModel {
  final Timestamp checkInDate;
  final Timestamp checkOutDate;
  final String uid;
  const LogModel({
    required this.checkInDate,
    required this.checkOutDate,
    required this.uid,
  });

  LogModel copyWith({
    Timestamp? checkInDate,
    Timestamp? checkOutDate,
    String? uid,
  }) {
    return LogModel(
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'checkInDate': checkInDate});
    result.addAll({'checkOutDate': checkOutDate});
    result.addAll({'uid': uid});

    return result;
  }

  @override
  String toString() =>
      'LogModel(checkInDate: $checkInDate, checkOutDate: $checkOutDate, uid: $uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LogModel &&
        other.checkInDate == checkInDate &&
        other.checkOutDate == checkOutDate &&
        other.uid == uid;
  }

  @override
  int get hashCode =>
      checkInDate.hashCode ^ checkOutDate.hashCode ^ uid.hashCode;
}
