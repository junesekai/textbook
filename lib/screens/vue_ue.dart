import 'package:flutter/material.dart';


class VueUe extends StatefulWidget {
  const VueUe({super.key});

  @override
  State<VueUe> createState() => _VueUeState();
}

class _VueUeState extends State<VueUe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progression'),),
      backgroundColor: Colors.white,
      body: ListView.builder(itemBuilder: (context, index) => Container()),
    );
  }
}