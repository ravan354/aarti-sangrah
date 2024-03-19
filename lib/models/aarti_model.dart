import 'package:cloud_firestore/cloud_firestore.dart';

class AartiModel {
  final String title, image;
  final Map<String, dynamic> aarti;

  AartiModel({required this.aarti, required this.title, required this.image});

  factory AartiModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return AartiModel(
      title: data?['title'],
      image: data?['image'],
      aarti: data?['Aarti'],
    );
  }
}
