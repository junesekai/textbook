import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cahier_text.dart';

class ProgressionUeAff extends StatelessWidget {
  final String nom_eu;
  const ProgressionUeAff({required this.nom_eu, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progression de UE'),
      ),
      body: StreamBuilder<List<CahierTexte>>(
        stream: readCahier(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Desole ${snapshot.error}');
          } else if (snapshot.hasData) {
            final cahier = snapshot.data!;

            return ListView(
              children: cahier.map(buildCahier).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildCahier(CahierTexte cahier) => Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(cahier.intitule, style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              
            },
            child: const Text('Modifier'),
          ),
        ],
      );

  Stream<List<CahierTexte>> readCahier() => FirebaseFirestore.instance
      .collection('cahier')
      .where('nom_ue', isEqualTo: nom_eu)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => CahierTexte.fromJson(doc.data()))
          .toList());
}
