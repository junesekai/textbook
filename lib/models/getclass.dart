import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetClasse extends StatefulWidget {
  const GetClasse({super.key});

  @override
  State<GetClasse> createState() => _GetClasseState();
}

class _GetClasseState extends State<GetClasse> {
  final CollectionReference classes =
      FirebaseFirestore.instance.collection('classe');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: classes.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return Text('lol');
        }
        return Text('Loanding');
      },
    );
  }
}

