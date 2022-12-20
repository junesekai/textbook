import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/list_ue_screen.dart';
import '../widgets/class_item.dart';

class AcceuilScreen extends StatefulWidget {
  @override
  State<AcceuilScreen> createState() => _AcceuilScreenState();
}

class _AcceuilScreenState extends State<AcceuilScreen> {
  final CollectionReference classes =
      FirebaseFirestore.instance.collection('classe');
  //final List<ClassModel> listeclass = [
  //ClassModel(id: '1', title: 'Niveau 1', images: 'assets/images/book.png'),
  //ClassModel(id: '2', title: 'Niveau 2', images: 'assets/images/book.png'),
  //ClassModel(id: '3', title: 'GIT 3', images: 'assets/images/book.png'),
  //ClassModel(id: '4', title: 'GIT 4', images: 'assets/images/book.png'),
  // ClassModel(id: '5', title: 'GIT 5', images: 'assets/images/book.png'),
  //];
  final String image = 'assets/images/book.png';

  //document IDs
  // List<String> docIDs = [];

//get docIDs
  /*Future getDocId() async {
    await FirebaseFirestore.instance.collection('classe').get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            },
          ),
        );
  }*/
/*
  @override
  void initState() {
    // TODO: implement initState
    getDocId();
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acceuil'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
        stream: classes.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListUeScreen(documentSnapshot: documentSnapshot,))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            title: Text(documentSnapshot['nom_class']),
            backgroundColor: Colors.purple,
          ),
        ),
      ),
    );
              },
              itemCount: streamSnapshot.data!.docs.length,
              padding: const EdgeInsets.all(10.0),
            );
          }
          return Text('Loanding');
        },
      ),
    );
  }
}
