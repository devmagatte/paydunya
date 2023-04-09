import 'dart:convert';

import 'package:equatable/equatable.dart';

class Taxe extends Equatable {
  final String name;
  final num amount;

  const Taxe({
    required this.name,
    required this.amount,
  });

  factory Taxe.fromMap(Map<String, dynamic> map) {
    return Taxe(
      name: map['name'] ?? '',
      amount: map['amount'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'amount': amount,
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        name,
        amount,
      ];
}
