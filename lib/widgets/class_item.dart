import 'package:flutter/material.dart';
//import '../screens/list_ue_screen.dart';


class ClassItem extends StatelessWidget {
  
  final String title;
  final String images;
  /*void selectClass(BuildContext context) {
    Navigator.of(context).pushNamed(ListUeScreen.routeName, arguments: {'title': title},);
  }*/
  const ClassItem(this.title, this.images);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {} ,//selectClass(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Image.asset(
            images,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            title: Text(title),
            backgroundColor: Colors.purple,
          ),
        ),
      ),
    );
  }
}
