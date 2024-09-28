import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/repository/location_repo.dart';
import '../listed_map_page/listed_map_screen.dart';


class LocationListPage extends StatefulWidget {
  @override
  _LocationListPageState createState() => _LocationListPageState();
}

class _LocationListPageState extends State<LocationListPage> {
  final LocationRepository _locationRepository = LocationRepository();
  List<LatLng> _locations = [];

  @override
  void initState() {
    super.initState();
    _getLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location List'),
      ),
      body: ListView.builder(
        itemCount: _locations.length,
        itemBuilder: (context, index) {
          return Card(elevation: 3,
          color: const Color.fromARGB(255, 164, 246, 232),
            child: ListTile(
              title: Text('Latitude: ${_locations[index].latitude}, Longitude: ${_locations[index].longitude}'),
              onTap: (){
Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationMapPage(_locations[index])));

              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _getLocations() async {
    List<LatLng> locations = await _locationRepository.getLocationsFromFirestore();
    setState(() {
      _locations = locations;
    });
  }
}