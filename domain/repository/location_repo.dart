import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationRepository {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _locationsCollection;
   LocationRepository() {
    _locationsCollection = _firestore.collection('locations');
  }

  Future<void> saveLocationToFirestore(LatLng location) async {
    try {
      await _locationsCollection.add({
        'latitude': location.latitude,
        'longitude': location.longitude,
      });
    } catch (e) {
      print('Error saving location to Firestore: $e');
    }
  }
  Future<List<LatLng>> getLocationsFromFirestore() async {
    try {
      QuerySnapshot querySnapshot = await _locationsCollection.get();
      List<LatLng> locations = querySnapshot.docs.map((doc) {
        return LatLng(doc['latitude'], doc['longitude']);
      }).toList();
      return locations;
    } catch (e) {
      print('Error getting locations from Firestore: $e');
      return [];
    }
  }
  }