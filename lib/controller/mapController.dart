import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  late GoogleMapController mapController;

  final LatLng destination = const LatLng(34.1951, 73.2356); // Islamabad
  final markers = <Marker>{}.obs;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;

    markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: destination,
        infoWindow: const InfoWindow(
          title: "Delivery Destination",
          snippet: "Customer’s location",
        ),
      ),
    );
  }
}
