import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/ue.dart';
import '../widgets/ue_item.dart';
import 'remplissage_ue_screen.dart';
//import 'acceuil_screen.dart';

class ListUeScreen extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const ListUeScreen({required this.documentSnapshot, super.key});

  @override
  State<ListUeScreen> createState() => _ListUeScreenState();
}

class _ListUeScreenState extends State<ListUeScreen> {
  //static const routeName = '/class-ue';
  @override
  Widget build(BuildContext context) {
    
    //final classTitle = ModalRoute.of(context)?.settings.arguments as classes;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.documentSnapshot['nom_class']),
      ),
      body: StreamBuilder<List<Ue>>(
          stream: readClass(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final ue = snapshot.data!;

              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: ue.map(buildUe).toList(),
                padding: const EdgeInsets.all(10.0),
              );
            } else if (snapshot.hasError) {
              return Text('Pas de UE ${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget buildUe(Ue ue) => InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RemplissageUe(ue: ue.nom_ue,))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Container(
            child: Text(
              ue.nom_ue,
              textAlign: TextAlign.center,
            ),
          ),
          footer: GridTileBar(
            title: Text(
              ue.nom_enseignant,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black87,
          ),
        ),
      ),
      );

  Stream<List<Ue>> readClass() =>
      FirebaseFirestore.instance.collection('ue').where('nom_classe', isEqualTo: widget.documentSnapshot['nom_class']).snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => Ue.fromJson(doc.data())).toList());
}
