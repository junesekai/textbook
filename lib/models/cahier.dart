import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CahierTexte extends StatelessWidget {
  CahierTexte(this.data, {super.key}) {
    _documentReference =
        FirebaseFirestore.instance.collection('cahiertexte').doc(data['id']);

    //prendre la reference de potscahier dans le document

    _referencePostcahier = _documentReference.collection('postcahier');

    //get stream
    _streamPostcahier = _referencePostcahier.snapshots();
  }

  Map data;
  late DocumentReference _documentReference;
  late CollectionReference _referencePostcahier;
  late Stream<QuerySnapshot> _streamPostcahier;

  @override
  Widget build(BuildContext context) {
    final cahier = FirebaseFirestore.instance.collection('cahiertexte').doc();
    final contents = TextEditingController();
    final nomue = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('lol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Entrez la seance du jour',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextField(
                controller: nomue,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Nom de l'UE",
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextField(
                controller: contents,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Contenue de la seance du jour",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //Get data
                  Map<String, dynamic> postcahierToadd = {
                    'contents': contents.text,
                    'ajouter_le': FieldValue.serverTimestamp(),
                  };

                  Map<String, String> cahierToadd = {
                    'nom_ue': nomue.text,
                  };
                  _referencePostcahier.add(postcahierToadd);
                  cahier.set(cahierToadd);

                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPostCahierView() {
    return StreamBuilder<QuerySnapshot>(
        stream: _streamPostcahier,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }
          if (snapshot.hasData) {
            QuerySnapshot data = snapshot.data;
            List<QueryDocumentSnapshot> documents = data.docs;
            List<Map> items = documents
                .map((e) => {'id': e.id, 'contents': e['contents']})
                .toList();
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Map thisItem = items[index];
                  return ListTile(
                    title: Text(thisItem['contents'].toString()),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
