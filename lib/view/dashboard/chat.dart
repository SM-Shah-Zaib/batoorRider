import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/appColors.dart'; // make sure AppColors.primary exists

class ChatScreen extends StatelessWidget {
    ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "name": "Geopart Etdsien",
        "message": "Your Order Just Arrived!",
        "time": "13.47",
        "image": "assets/images/icons/profile.png",
        "status": "check"
      },
      {
        "name": "Stevano Clirvover",
        "message": "Your Order Just Arrived!",
        "time": "11.23",
                "image": "assets/images/icons/profile.png",

        "status": "badge"
      },
      {
        "name": "Elisia Justin",
        "message": "Your Order Just Arrived!",
        "time": "11.23",
        "image": "assets/images/icons/profile.png",

        "status": "none"
      },
      {
        "name": "Geopart Etdsien",
        "message": "Your Order Just Arrived!",
        "time": "13.47",
        "image": "assets/images/icons/profile.png",

        "status": "check"
      },
      {
        "name": "Stevano Clirvover",
        "message": "Your Order Just Arrived!",
        "time": "11.23",
           "image": "assets/images/icons/profile.png",

        "status": "badge"
      },
      {
        "name": "Elisia Justin",
        "message": "Your Order Just Arrived!",
        "time": "11.23",
              "image": "assets/images/icons/profile.png",

        "status": "none"
      },
    ];

    return Container(
      color: Colors.white,
      width: Get.width,
      height: Get.height,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final item = notifications[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // User Image
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(item["image"]),
                    ),
                    const SizedBox(width: 12),

                    // Name and message
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["name"],
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.5,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            item["message"],
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Time + icon/badge
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item["time"],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (item["status"] == "check")
                          Icon(Icons.check_circle,
                              color: AppColors.primary, size: 16)
                        else if (item["status"] == "badge")
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        else
                          const SizedBox(height: 16),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
