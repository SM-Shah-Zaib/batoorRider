import 'package:batoorrider/view/dashboard/home/map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orderController.dart'; // <-- update path to match your folder

class OrderDetailScreen extends StatelessWidget {
  final Map<String, dynamic> order;
  final OrderController controller = Get.find<OrderController>();

  OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Delivery details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
        ),
      ),

      // --------------- BODY ----------------
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header ---
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.delivery_dining,
                        color: Colors.orange, size: 28),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "hinree",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Ref ID: ${order["refId"] ?? "-"}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    order["date"] ?? "11 Nov, 4:39 PM",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // --- Pickup + Dropoff ---
              _buildLocationSection(order),

              const SizedBox(height: 20),

              // --- Order Details ---
              Row(
                children: [
                  Expanded(
                    child: _buildLabelValue(
                        "What you are sending", order["orderType"]),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child:
                        _buildLabelValue("Recipient", order["recipientName"]),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _buildLabelValue(
                  "Recipient contact number", order["recipientContact"]),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _buildLabelValue("Payment", order["paymentType"]),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildLabelValue(
                        "Fee", "${order["paymentAmount"] ?? "-"} Pkr"),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // --- Package Info ---
              const Text(
                "Package Information",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Number Of Packages: ${order["packageCount"] ?? 1}",
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 10),
              const Text(
                "Package 1:",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Detail: ${order["packageDetail"] ?? "-"}",
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 12),
              const Text(
                "Image:",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/box.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // --- ACTION BUTTONS ---
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        controller.rejectOrder(order["refId"]);
                        Get.snackbar(
                          "Order Rejected",
                          "Order ${order["refId"]} has been moved to Rejected list.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red.shade50,
                          colorText: Colors.red.shade800,
                        );
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Reject",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.completeOrder(order["refId"]);
                        Get.snackbar(
                          "Order Accepted",
                          "Order ${order["refId"]} has been marked as completed.",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green.shade50,
                          colorText: Colors.green.shade800,
                        );
                        Get.to(MapScreen(order: order));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text(
                        "Accept",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  Widget _buildLocationSection(Map<String, dynamic> order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.location_pin, color: Colors.pink, size: 18),
            SizedBox(width: 6),
            Text("Pickup Location",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 4),
          child: Text(order["pickupLocation"] ?? "-",
              style: const TextStyle(fontSize: 13)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
          child: Column(
            children: List.generate(
              3,
              (index) => Container(
                height: 4,
                width: 2,
                margin: const EdgeInsets.symmetric(vertical: 2),
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
        Row(
          children: const [
            Icon(Icons.location_on_outlined, color: Colors.green, size: 18),
            SizedBox(width: 6),
            Text("Delivery Location",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 4),
          child: Text(order["dropoffLocation"] ?? "-",
              style: const TextStyle(fontSize: 13)),
        ),
      ],
    );
  }

  Widget _buildLabelValue(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 2),
        Text(
          value ?? "-",
          style: const TextStyle(
            fontSize: 13.5,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
