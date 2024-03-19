import 'package:appinio_social_share/appinio_social_share.dart';
import 'package:get/get.dart';
import 'package:shinde_tech_aarti_sangrah/firebase/firebase_db.dart';
import 'package:shinde_tech_aarti_sangrah/models/aarti_model.dart';
import 'package:shinde_tech_aarti_sangrah/models/shloka_model.dart';

class AartiController extends GetxController {
  // instance of firestore database
  final FirestoreDb firestoreDb = FirestoreDb();

  // aartilist to fetch and display aarti
  RxList<String> aartiList = RxList<String>();

  // shloks List to fetch and display aarti
  RxList<String> shloksList = RxList<String>();

  // Stream to fetch aartis from firestore database
  Stream<RxList<AartiModel>> getAartis() {
    return firestoreDb.getAartis();
  }

  // Stream to fetch aartis from firestore database
  Stream<RxList<ShlokaModel>> getShlokas() {
    return firestoreDb.getShlokas();
  }

  // Share the app features
  Future<void> shareAppLink() async {
    final AppinioSocialShare appinioSocialShare = AppinioSocialShare();
    const String applink =
        "https://play.google.com/store/apps/details?id=com.shinde.tech.aarti.sangrah.shinde_tech_aarti_sangrah";
    const String message = 'Share this beautiful app for aartis and shloks';

    await appinioSocialShare.shareToSystem(message, applink);
  }
}
