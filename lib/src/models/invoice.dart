import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'item.dart';
import 'taxe.dart';

class Invoice extends Equatable {
  final String? token;
  final num totalAmount;
  final String? description;

  ///  Les "items" sont utilisés pour afficher au client sur la page de paiement la liste des articles qu'il a commandé.
  ///  PayDunya n'utilisera en aucun cas l'un des montants déclarés dans "[items]" pour facturer le client.
  final List<Item>? items;

  /// Si vous désirez afficher sur la facture PayDunya les [taxes] que vous appliquez (TVA, Frais de livraison...) vous pouvez le faire en utilisant le noeud JSON taxes comme illustré ci-dessous.
  final List<Taxe>? taxes;

  const Invoice({
    this.token,
    required this.totalAmount,
    this.description,
    this.items,
    this.taxes,
  });

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      token: map['token'] ?? '',
      totalAmount: map['total_amount'],
      description: map['description'] ?? '',
      items: _fromMapItems(map['items']),
      taxes: _fromMapTaxe(map['taxes']),
    );
  }

  static List<Item> _fromMapItems<T>(Map<String, dynamic> map) {
    final List<Item> list = [];
    for (var element in map.values) {
      list.add(Item.fromMap(element));
    }
    return list;
  }

  static List<Taxe> _fromMapTaxe<T>(Map<String, dynamic> map) {
    final List<Taxe> list = [];
    for (var element in map.values) {
      list.add(Taxe.fromMap(element));
    }
    return list;
  }

  static Map<String, dynamic> _tomMapItems(List<Item>? items) {
    Map<String, dynamic> map = {};
    if (items != null) {
      for (var index = 0; index < items.length; index++) {
        map.addAll({"item_$index": items[index].toMap()});
      }
    }
    return map;
  }

  static Map<String, dynamic> _tomMapTaxe(List<Taxe>? taxes) {
    Map<String, dynamic> map = {};
    if (taxes != null) {
      for (var index = 0; index < taxes.length; index++) {
        map.addAll({"tax_$index": taxes[index].toMap()});
      }
    }

    return map;
  }

  Map<String, dynamic> toMap() => {
        "total_amount": totalAmount,
        "description": description,
        "items": _tomMapItems(items),
        "taxes": _tomMapTaxe(taxes),
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [
        token,
        totalAmount,
        description,
        items,
        taxes,
      ];
}
