import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference orders =
    FirebaseFirestore.instance.collection('orders');
final CollectionReference payments =
    FirebaseFirestore.instance.collection('payments');

class DatabaseServices {
  // Order services

  static Future<void> addOrder(Map<String, dynamic> object) {
    return orders
        .add(object)
        .then((_) => print("Order added successfully.."))
        .catchError((error) => print("Failed to add order $error"));
  }

  static Stream<QuerySnapshot> orderStream() {
    return orders.orderBy('createdAt').snapshots();
  }
}
