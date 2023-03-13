import 'package:flutter/material.dart';
class Profil extends StatefulWidget {
  static const String routeName = 'profil';

  const Profil({Key? key}) : super(key: key);
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  @override
  Widget build(BuildContext context) {
    return Text("Profil à faire");
  }
}
