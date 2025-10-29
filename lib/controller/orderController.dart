import 'package:get/get.dart';

class OrderController extends GetxController {
  /// --- Model for each order ---
  final upcomingOrders = <Map<String, dynamic>>[
    {
      "refId": "ORD-1001",
      "date": "2025-10-25",
      "pickupLocation": "Gulberg, Lahore",
      "dropoffLocation": "DHA Phase 5, Lahore",
      "orderType": "Electronics",
      "recipientName": "Ali Raza",
      "recipientContact": "0301-1234567",
      "paymentType": "COD",
      "paymentAmount": 2500,
      "packageCount": 2,
      "packageDetail": "20 x 16 x 10 (inch), 32lbs",
      "status": "upcoming",
    },
    {
      "refId": "ORD-1002",
      "date": "2025-10-24",
      "pickupLocation": "Model Town, Lahore",
      "dropoffLocation": "Faisal Town, Lahore",
      "orderType": "Pharmacy",
      "recipientName": "Ahsan Khan",
      "recipientContact": "0302-4455667",
      "paymentType": "Easypaisa",
      "paymentAmount": 1800,
      "packageCount": 1,
      "packageDetail": "12 x 8 x 6 (inch), 10lbs",
      "status": "upcoming",
    },
    {
      "refId": "ORD-1003",
      "date": "2025-10-23",
      "pickupLocation": "Bahria Town, Lahore",
      "dropoffLocation": "Johar Town, Lahore",
      "orderType": "Grocery",
      "recipientName": "Sara Malik",
      "recipientContact": "0334-7788990",
      "paymentType": "COD",
      "paymentAmount": 950,
      "packageCount": 3,
      "packageDetail": "10 x 10 x 8 (inch), 20lbs",
      "status": "upcoming",
    },
  ].obs;

  final completedOrders = <Map<String, dynamic>>[
    {
      "refId": "ORD-0901",
      "date": "2025-10-20",
      "pickupLocation": "Iqbal Town, Lahore",
      "dropoffLocation": "Garden Town, Lahore",
      "orderType": "Clothing",
      "recipientName": "Hassan Ali",
      "recipientContact": "0315-2255668",
      "paymentType": "Easypaisa",
      "paymentAmount": 3400,
      "packageCount": 1,
      "packageDetail": "15 x 12 x 6 (inch), 8lbs",
      "status": "completed",
    },
    {
      "refId": "ORD-0902",
      "date": "2025-10-18",
      "pickupLocation": "Wapda Town, Lahore",
      "dropoffLocation": "Township, Lahore",
      "orderType": "Documents",
      "recipientName": "Ahmed Khan",
      "recipientContact": "0320-9988776",
      "paymentType": "COD",
      "paymentAmount": 500,
      "packageCount": 1,
      "packageDetail": "A4 Size Envelope, 2lbs",
      "status": "completed",
    },
  ].obs;

  final rejectedOrders = <Map<String, dynamic>>[
    {
      "refId": "ORD-0801",
      "date": "2025-10-15",
      "pickupLocation": "Shadman, Lahore",
      "dropoffLocation": "Model Town, Lahore",
      "orderType": "Electronics",
      "recipientName": "Usman Shah",
      "recipientContact": "0306-5556677",
      "paymentType": "COD",
      "paymentAmount": 2200,
      "packageCount": 1,
      "packageDetail": "22 x 18 x 10 (inch), 28lbs",
      "status": "rejected",
    },
    {
      "refId": "ORD-0802",
      "date": "2025-10-14",
      "pickupLocation": "Cantt, Lahore",
      "dropoffLocation": "Defence, Lahore",
      "orderType": "Documents",
      "recipientName": "Maryam Fatima",
      "recipientContact": "0345-2233445",
      "paymentType": "Easypaisa",
      "paymentAmount": 800,
      "packageCount": 2,
      "packageDetail": "File Packets, 3lbs",
      "status": "rejected",
    },
  ].obs;

  /// --- Methods to get total counts ---
  int get totalUpcoming => upcomingOrders.length;
  int get totalCompleted => completedOrders.length;
  int get totalRejected => rejectedOrders.length;

  /// --- Example: Add new order ---
  void addUpcomingOrder(Map<String, dynamic> order) {
    upcomingOrders.add(order);
  }

  /// --- Example: Move order to completed ---
  void completeOrder(String refId) {
    var order = upcomingOrders.firstWhereOrNull((o) => o["refId"] == refId);
    if (order != null) {
      order["status"] = "completed";
      completedOrders.add(order);
      upcomingOrders.remove(order);
    }
  }

  /// --- Example: Reject an order ---
  void rejectOrder(String refId) {
    var order = upcomingOrders.firstWhereOrNull((o) => o["refId"] == refId);
    if (order != null) {
      order["status"] = "rejected";
      rejectedOrders.add(order);
      upcomingOrders.remove(order);
    }
  }
}
