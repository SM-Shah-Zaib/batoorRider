import 'dart:ui';
import 'package:batoorrider/view/dashboard/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/appColors.dart';
import '../controller/dashboardController.dart';
// import 'package:batoor/controller/homeController.dart';
// import 'DashboardComponents/homeHomeTab.dart';
// import 'MenuBar/helpFeedback.dart';
// import 'DashboardComponents/homeProfileTab.dart';
// import 'DashboardComponents/homeFavouriteTab.dart';
// import 'DashboardComponents/homeNotificationTab.dart';
class Dashboard extends StatelessWidget {
   Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Dashboardcontroller());

    final List<IconData> icons = [
      Icons.home_rounded,
      Icons.chat_bubble_outline_rounded,
      Icons.favorite_border_rounded,
      Icons.notifications_none_rounded,
      Icons.person_outline_rounded,
    ];

    final List<String> labels = [
      "Home",
      "Chat",
      "Favourite",
      "Notifications",
      "Profile"
    ];

    final List<Widget> screens = [
      HomeDashboard(),
      Text("data"),
      // Homehometab(),
      // Homehometab(),
      // HomeFavouriteTab(),
      // Homenotificationtab(),
      // ProfileTab()
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.secondary,

      // 🔝 AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        // 👇 Dynamic Title based on selectedIndex
        title: Obx(() {
          if (controller.selectedIndex.value == 0) {
            return const SizedBox.shrink();
          } else {
            return Text(
              labels[controller.selectedIndex.value],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            );
          }
        }),

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
            icon: const Icon(Icons.menu, color: AppColors.primary),
            onPressed: () {
              _openLeftMenu(context);
            },
          ),
        ),

        actions: [
          Obx(() {
            if (controller.selectedIndex.value == 0) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/icons/profile.png',
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),

      // 🔹 Body
      body: Obx(() => screens[controller.selectedIndex.value]),

      // 🔹 Bottom Navigation Bar
      bottomNavigationBar: Obx(
        () => Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, -3),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(icons.length, (index) {
                  final bool isSelected =
                      controller.selectedIndex.value == index;

                  return GestureDetector(
                    onTap: () => controller.changeTab(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          margin: EdgeInsets.only(bottom: isSelected ? 8 : 0),
                          height: isSelected ? 45 : 35,
                          width: isSelected ? 45 : 35,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color:
                                          AppColors.primary.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Icon(
                            icons[index],
                            color:
                                isSelected ? Colors.white : Colors.grey[600],
                            size: isSelected ? 25 : 22,
                          ),
                        ),
                        if (isSelected)
                          Text(
                            labels[index],
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Custom Left Drawer
  void _openLeftMenu(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return const SizedBox.shrink();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final width = MediaQuery.of(context).size.width;

        return Stack(
          children: [
            // 🔸 Blurred background
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),

            // 🔸 Sliding Left Drawer
            Transform.translate(
              offset: Offset(-width * (1 - animation.value) * 0.5, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: width * 0.65,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),

                      // 🔹 Header
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.secondary,
                            child: const Icon(Icons.person,
                                color: AppColors.primary, size: 28),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Welcome Back",
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Text(
                                "Rutaba",
                                style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Divider(color: Colors.white, thickness: 3),
                      const SizedBox(height: 12),

                      // 🔹 Menu Items (TextButtons)
                      _buildMenuItem(Icons.receipt_long, "Recent Orders"),
                      _buildMenuItem(Icons.report_problem_rounded, "Complaints"),
                      _buildMenuItem(Icons.help_outline_rounded, "Help & Feedback"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// 🔹 Helper Widget for menu items (now using TextButton)
Widget _buildMenuItem(IconData icon, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Icon(icon, color: AppColors.secondary, size: 22),
        const SizedBox(width: 12),
        TextButton(
          onPressed: () {
            // Get.to(Helpfeedback());
            },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.secondary,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    ),
  );
}
