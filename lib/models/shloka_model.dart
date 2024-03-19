import 'package:cloud_firestore/cloud_firestore.dart';

class ShlokaModel {
  final String title, image;
  final Map<String, dynamic> shloks;

  ShlokaModel({required this.title, required this.image, required this.shloks});

  factory ShlokaModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;

    return ShlokaModel(
        title: data['title'], image: data['image'], shloks: data['Shloks']);
  }
}
