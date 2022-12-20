import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetClasse extends StatelessWidget {
  final String documentid;
   const GetClasse({required this.documentid});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference classe =
        FirebaseFirestore.instance.collection('classe');

    return FutureBuilder(
        future: classe.doc(documentid).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['nom_class']}');
          }
          return Text('Loanding');
        }));
  }
}
