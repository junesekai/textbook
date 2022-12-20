import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/cahier_text.dart';
import '../screens/progression_ue.dart';

class RemplissageUe extends StatelessWidget {
  //static const routeName = '/ue-remplissage';
  final String ue;
  RemplissageUe({required this.ue, super.key});

  final _intituleCours = TextEditingController();

  //final _nomUe = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final ueTitle = ModalRoute.of(context)?.settings.arguments as String;
    final lue = ue;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(ue),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(
                  width: 300,
                  height: 34,
                  child: Text(
                    'Entrez la seance du jour',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 34.0,
              ),
              /*TextField(
                controller: _nomUe,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Nom de l'UE",
                  prefixIcon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
              ),*/
              const SizedBox(
                height: 34.0,
              ),
              TextField(
                controller: _intituleCours,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Contenue de la seance du jour",
                ),
              ),
              const SizedBox(
                height: 34.0,
              ),
              ElevatedButton(
                onPressed: () {
                  final cahier = CahierTexte(
                    nom_ue: ue,
                    intitule: _intituleCours.text,
                  );
                  createCahier(cahier);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ProgressionUeAff(
                                nom_eu: ue,
                              )));
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future createCahier(CahierTexte cahier) async {
    final docCahier = FirebaseFirestore.instance.collection('cahier').doc();
    cahier.id = docCahier.id;
    final json = cahier.toJson();
    await docCahier.set(json);
  }
}
