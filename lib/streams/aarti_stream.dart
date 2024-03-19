import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:provider/provider.dart';
import 'package:shinde_tech_aarti_sangrah/components/aarti_card.dart';
import 'package:shinde_tech_aarti_sangrah/components/aarti_display.dart';
import 'package:shinde_tech_aarti_sangrah/components/constants.dart';
import 'package:shinde_tech_aarti_sangrah/controllers/aarti_controller.dart';
import 'package:shinde_tech_aarti_sangrah/controllers/screen_index_provider.dart';
import 'package:shinde_tech_aarti_sangrah/models/aarti_model.dart';
import 'package:shinde_tech_aarti_sangrah/pages/search_page.dart';

class AartisStream extends StatelessWidget {
  AartisStream({
    super.key,
  });

  final AartiController aartiController = AartiController();

  @override
  Widget build(BuildContext context) {
    final screenIndexProvider = Provider.of<ScreenIndexProvider>(context);
    int currentScreenIndex = screenIndexProvider.fetchCurrentScreenIndex;

    return Scaffold(
      appBar: AppBar(
        title: const SelectableText(
          'आरती संग्रह',
          style: TextStyle(
              fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
        actions: [
          GestureDetector(
            onTap: () {
              aartiController.shareAppLink();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: LineIcon.share(
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: StreamBuilder<RxList<AartiModel>>(
        stream: aartiController.getAartis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error is ${snapshot.error}'),
            );
          } else {
            final aartis = snapshot.data!;
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
              alignment: Alignment.center,
              child: GridView.builder(
                itemCount: aartis.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Get.width * 0.02,
                  mainAxisSpacing: Get.width * 0.02,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.to(
                      () => AartiDisplay(aartiModel: aartis, index: index),
                      popGesture: true,
                      transition: Transition.circularReveal,
                      duration: const Duration(milliseconds: 500),
                    ),
                    child: AartiCard(aartiModel: aartis, index: index),
                  );
                },
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        fixedColor: Constants.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: currentScreenIndex,
        onTap: (i) {
          screenIndexProvider.updateScreenIndex(i);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.read_more),
            label: 'आरती',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.read_more_outlined),
            label: 'श्लोक/स्तोत्र',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(
            const SearchPage(),
            backgroundColor: Colors.white,
            clipBehavior: Clip.antiAlias,
            isDismissible: true,
          );
        },
        backgroundColor: Constants.primaryColor,
        label: const Icon(
          Icons.search_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
