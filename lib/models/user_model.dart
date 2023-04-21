import 'package:flutter/material.dart';

@immutable
class UserModel {
  final String name;
  final String idNumber;

  const UserModel({
    required this.name,
    required this.idNumber,
  });

  UserModel copyWith({
    String? name,
    String? idNumber,
  }) {
    return UserModel(
      name: name ?? this.name,
      idNumber: idNumber ?? this.idNumber,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'idNumber': idNumber});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      idNumber: map['idNumber'] ?? '',
    );
  }

  @override
  String toString() => 'UserModel(name: $name, idNumber: $idNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.idNumber == idNumber;
  }

  @override
  int get hashCode => name.hashCode ^ idNumber.hashCode;
}
