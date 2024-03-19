import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Constants {
  static TextStyle fontSize =
      const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700);

  static EdgeInsets aartiPagePadding = const EdgeInsets.symmetric(vertical: 30);

  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static Color primaryColor = const Color.fromARGB(255, 192, 0, 0);
}
