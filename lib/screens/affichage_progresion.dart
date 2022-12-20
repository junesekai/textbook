import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AffichageProgresion extends StatelessWidget {
  AffichageProgresion(this.data,{super.key}) {
    _documentReference =
        FirebaseFirestore.instance.collection('cahiertexte').doc(data['id']);

    //prendre la reference de potscahier dans le document

    _referencePostcahier = _documentReference.collection('postcahier');

    //get stream
    _streamPostcahier = _referencePostcahier.orderBy('ajouter_le', descending: false).snapshots();
  }

  Map data;
  late DocumentReference _documentReference;
  late CollectionReference _referencePostcahier;
  late Stream<QuerySnapshot> _streamPostcahier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data['nom_ue'])),
      body: Column(
        children: [
          Expanded(child: buildPostCahierView(),),
        ],
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