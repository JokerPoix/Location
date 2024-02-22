import 'package:flutter/material.dart';

class LocationListArgument {
  final String routeNameNext;

  LocationListArgument(this.routeNameNext);
}

class LocationList extends StatelessWidget {
  static String routeName = 'location_list';
  final String routeNameNext;

  const LocationList(this.routeNameNext, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text("Widget à faire");
  }
}
