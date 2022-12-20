import 'dart:convert';

import 'package:flutter/foundation.dart';

class Ue {
  final String id_ue;
  final String nom_ue;
  final String nom_enseignant;
  final String nom_classe;

  Ue({required this.id_ue, required this.nom_ue, required this.nom_enseignant, required this.nom_classe});

  Map<String, dynamic> toJson() => {
        'id_ue': id_ue,
        'nom_ue': nom_ue,
        'nom_enseignant': nom_enseignant,
        'nom_classe': nom_classe,
      };

  static Ue fromJson(Map<String, dynamic> json) => Ue(
        id_ue: json['id_ue'],
        nom_ue: json['nom_ue'],
        nom_enseignant: json['nom_enseignant'],
        nom_classe: json['nom_classe'],
      );
}
