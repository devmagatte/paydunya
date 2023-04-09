import 'dart:convert';

import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String name;
  final num quantity;
  final num unitPrice;
  final num totalPrice;
  final String description;

  const Item({
    required this.name,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    required this.description,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? 0,
      unitPrice: map['unit_price'] ?? 0,
      totalPrice: map['total_price'] ?? 0,
      description: map['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "quantity": quantity,
        "unit_price": unitPrice,
        "total_price": totalPrice,
        "description": description
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        name,
        quantity,
        unitPrice,
        totalPrice,
        description,
      ];
}
