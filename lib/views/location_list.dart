import 'package:flutter/material.dart';
import 'package:location/models/location.dart';
import 'package:location/services/location_service.dart';
import 'package:location/views/share/bottom_navigation_bar_widget.dart';

class LocationListArgument {
  final String routeNameNext;

  LocationListArgument(this.routeNameNext);
}

class LocationList extends StatefulWidget {
  static String routeName = '/locations';
  final String routeNameNext;
  const LocationList(this.routeNameNext, {Key? key}) : super(key: key);

  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  final LocationService service = LocationService();
  late Future<List<Location>> _locations;

  @override
  void initState() {
    super.initState();
    _locations = service.getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Locations'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _locations,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) =>
                    _buildRow(snapshot.data![index], context),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(2),
    );
  }

  _buildRow(Location location, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Column(children: [
        SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: (Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(location.id.toString()),
                  subtitle: Text(
                      'Dates : ${location.dateDebut} - ${location.dateFin}'),
                ),
              ],
            ),
          )),
        )
      ]),
    );
  }
}
