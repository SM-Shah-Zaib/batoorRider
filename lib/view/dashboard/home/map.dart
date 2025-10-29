import 'package:batoorrider/constants/appColors.dart';
import 'package:batoorrider/view/dashboard/home/completeDelivery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/mapController.dart';

class MapScreen extends StatelessWidget {
  final Map<String, dynamic> order;

  MapScreen({super.key, required this.order});

  final MapController controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// --- Google Map ---
          Obx(() => GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: controller.destination,
                  zoom: 14.0,
                ),
                markers: controller.markers.value,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
                compassEnabled: true,
                mapType: MapType.normal,
              )),

          /// --- Gradient Overlay ---
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),

          /// --- "Reached Destination" Button ---
          Positioned(
            bottom: 40,
            left: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => CompleteDelivery(order: order));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 10,
                shadowColor: Colors.black45,
              ),
              child: const Text(
                "I'm reached the destination",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
