import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinde_tech_aarti_sangrah/components/aarti_card.dart';
import 'package:shinde_tech_aarti_sangrah/components/aarti_display.dart';
import 'package:shinde_tech_aarti_sangrah/models/aarti_model.dart';

class FilteredAartiStream extends StatelessWidget {
  const FilteredAartiStream({
    super.key,
    required this.searchName,
    required this.filteredAartiStream,
    required this.plainAartiStream,
  });

  final String searchName;
  final Stream<RxList<AartiModel>> filteredAartiStream;
  final Stream<RxList<AartiModel>> plainAartiStream;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<RxList<AartiModel>>(
        stream: searchName.isNotEmpty ? filteredAartiStream : plainAartiStream,
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
                    onTap: () => Get.off(
                      () => AartiDisplay(aartiModel: aartis, index: index),
                    ),
                    child: AartiCard(aartiModel: aartis, index: index),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
