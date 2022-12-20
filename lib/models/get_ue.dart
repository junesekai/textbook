import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUe extends StatelessWidget {
  final String documenid;
  const GetUe({required this.documenid});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference ue =
        FirebaseFirestore.instance.collection('ue');
    return FutureBuilder(
        future: ue.doc(documenid).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text('${data['nom_ue']}');
          }
          return Text('Loanding');
        }));
  }
}

