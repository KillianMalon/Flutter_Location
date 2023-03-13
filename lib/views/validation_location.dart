import 'package:flutter/material.dart';

class ValidationLocation extends StatefulWidget {
  static const String routeName = 'validation_location';
  const ValidationLocation({Key? key}) : super(key: key);
  @override
  _ValidationLocationState createState() => _ValidationLocationState();
}

class _ValidationLocationState extends State<ValidationLocation> {
  @override
  Widget build(BuildContext context) {
    return Text("Profil à faire");
  }
}
