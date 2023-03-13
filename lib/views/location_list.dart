import 'package:flutter/material.dart';
import 'package:location/models/location.dart';
import 'package:location/services/location_service.dart';

class LocationList extends StatefulWidget {
  static const String routeName = 'location_list';
  const LocationList({Key? key}) : super(key: key);
  @override
  _LocationList createState() => _LocationList();
}

class _LocationList extends State<LocationList> {
  late List<Location> _locations;
  final LocationService serviceLocation = LocationService();

  @override
  void initState() {
    super.initState();
    _locations = serviceLocation.getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes locations"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _locations.length,
          itemBuilder: (context, index) =>
              _buildRow(_locations[index], context),
          itemExtent: 285,
        ),
      ),
    );
  }
}

_buildRow(Location location, BuildContext context) {
  return Container(
    margin: EdgeInsets.all(4.0),
    child: Expanded(
      child: Row(
        children: [
          Row(children: [
            Text(location.habitation!.libelle),
            Text("${location.montanttotal} €")
          ]),
        ],
      ),
    ),
  );
}
