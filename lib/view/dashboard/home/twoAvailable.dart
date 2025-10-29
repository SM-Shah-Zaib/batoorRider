import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orderController.dart';
import 'orderDetail.dart'; // 👉 Screen for product info
import 'viewAll.dart';
class AvailableRequests extends StatelessWidget {
  final OrderController controller = Get.find<OrderController>();

  AvailableRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Header Row ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Available Requests",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => ViewAllOrdersScreen());
                },
                child: const Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // --- Only show first 2 orders ---
        Padding(
  padding: const EdgeInsets.all(6.0), // ✅ Added padding
  child: Obx(() {
    final orders = controller.upcomingOrders.take(2).toList();
    return Column(
      children: orders.map((order) {
        return _buildOrderCard(context, order);
      }).toList(),
    );
  }),
),

        ],
      ),
    );
  }

  // --- Card for each order ---
  Widget _buildOrderCard(BuildContext context, Map<String, dynamic> order) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Order type ---
          Text(
            order["orderType"].toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),

          // --- Recipient ---
          Text(
            "Recipient: ${order["recipientName"]}",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),

          // --- Drop-off info ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.delivery_dining,
                  color: Colors.orange,
                  size: 22,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drop off label + icon in one row
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.orange,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Drop off",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order["dropoffLocation"].toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // --- Buttons: Reject / Accept ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Reject Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    controller.rejectOrder(order["refId"]);
                    Get.snackbar(
                      "Order Rejected",
                      "Order ${order["refId"]} has been rejected.",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.orange),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Reject",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // Accept Button
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    controller.completeOrder(order["refId"]);
                    Get.to(() => OrderDetailScreen(order: order));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  ),
                  child: const Text(
                    "Accept",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

