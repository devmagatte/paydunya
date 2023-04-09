import 'package:equatable/equatable.dart';

class CustomData extends Equatable {
  final String categorie;
  final String periode;
  final int numeroGagnant;
  final String prix;

  const CustomData({
    required this.categorie,
    required this.periode,
    required this.numeroGagnant,
    required this.prix,
  });

  factory CustomData.fromMap(Map<String, dynamic> map) {
    return CustomData(
      categorie: map['categorie'] ?? '',
      periode: map['periode'] ?? '',
      numeroGagnant: map['numero_gagnant'] ?? 0,
      prix: map['prix'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "categorie": categorie,
        "periode": periode,
        "numero_gagnant": numeroGagnant,
        "prix": prix
      };

  @override
  List<Object?> get props => [
        categorie,
        periode,
        numeroGagnant,
        prix,
      ];
}
