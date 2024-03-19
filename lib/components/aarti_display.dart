import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinde_tech_aarti_sangrah/components/constants.dart';
import 'package:shinde_tech_aarti_sangrah/controllers/aarti_controller.dart';
import 'package:shinde_tech_aarti_sangrah/models/aarti_model.dart';

class AartiDisplay extends StatelessWidget {
  AartiDisplay({super.key, required this.aartiModel, required this.index});

  final AartiController aartiController = Get.put(AartiController());
  final RxList<AartiModel> aartiModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    aartiController.aartiList =
        (aartiModel[index].aarti.keys.toList()..sort()).obs;
    return Scaffold(
      appBar: AppBar(
        title: SelectableText(
          aartiModel[index].title,
          style: const TextStyle(
            fontSize: 29.84,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(aartiModel[index].image, scale: 0.9),
              opacity: 0.11,
            ),
          ),
          width: Get.width * 0.95,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var x in aartiController.aartiList)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      children: [
                        for (var y in aartiModel[index].aarti[x])
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: SelectableText(
                              y.toString()..trim(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 95, 27, 23),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
