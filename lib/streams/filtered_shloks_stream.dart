import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinde_tech_aarti_sangrah/components/shloks_card.dart';
import 'package:shinde_tech_aarti_sangrah/components/shloks_display.dart';
import 'package:shinde_tech_aarti_sangrah/models/shloka_model.dart';

class FilteredShlokStream extends StatelessWidget {
  const FilteredShlokStream({
    super.key,
    required this.searchName,
    required this.filteredShlokStream,
    required this.plainShlokStream,
  });

  final String searchName;
  final Stream<RxList<ShlokaModel>> filteredShlokStream;
  final Stream<RxList<ShlokaModel>> plainShlokStream;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<RxList<ShlokaModel>>(
        stream: searchName.isNotEmpty ? filteredShlokStream : plainShlokStream,
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
            final shloks = snapshot.data!;
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.02, vertical: Get.height * 0.02),
              alignment: Alignment.center,
              child: GridView.builder(
                itemCount: shloks.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Get.width * 0.02,
                  mainAxisSpacing: Get.width * 0.02,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.off(
                      () => ShloksDisplay(shlokaModel: shloks, index: index),
                    ),
                    child: ShloksCard(shlokaModel: shloks, index: index),
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
