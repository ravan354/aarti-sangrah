import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shinde_tech_aarti_sangrah/components/constants.dart';
import 'package:shinde_tech_aarti_sangrah/models/aarti_model.dart';
import 'package:shinde_tech_aarti_sangrah/models/shloka_model.dart';

class FirestoreDb {
  Stream<RxList<AartiModel>> getAartis() {
    return Constants.firebaseFirestore.collection('Aartis').snapshots().map(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => snapshot.docs
              .map(
                (e) => AartiModel.fromFirestore(e, null),
              )
              .toList()
              .obs,
        );
  }

  Stream<RxList<ShlokaModel>> getShlokas() {
    return Constants.firebaseFirestore.collection('Shlokas').snapshots().map(
          (QuerySnapshot<Map<String, dynamic>> snapshot) => snapshot.docs
              .map(
                (e) => ShlokaModel.fromFirestore(e),
              )
              .toList()
              .obs,
        );
  }
}
