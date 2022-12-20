import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class CahierTexte {
  String id;
  final String nom_ue;
  final String intitule;

  CahierTexte({
    this.id = '',
    required this.nom_ue,
    required this.intitule,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom_ue': nom_ue,
        'intitule': intitule,
        'ajouter_le': FieldValue.serverTimestamp(),
      };

  static CahierTexte fromJson(Map<String, dynamic> json) => CahierTexte(
    //id: json['id'],
    nom_ue: json['nom_ue'],
    intitule: json['intitule'],
  );
}
