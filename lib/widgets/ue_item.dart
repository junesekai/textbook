import 'package:flutter/material.dart';
import '../screens/remplissage_ue_screen.dart';

class UeItem extends StatelessWidget {
  final String id;
  final String title;
  final String enseignant;
  /*void selectUe(BuildContext context) {
    Navigator.of(context).pushNamed(RemplissageUe.routeName, arguments: title,);
  }*/
  const UeItem(this.id, this.title, this.enseignant);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {} , //selectUe(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Container(
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          footer: GridTileBar(
            title: Text(
              enseignant,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black87,
          ),
        ),
      ),
    );
    ;
  }
}
