import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shinde_tech_aarti_sangrah/models/shloka_model.dart';

class ShloksCard extends StatelessWidget {
  const ShloksCard({super.key, required this.shlokaModel, required this.index});

  final RxList<ShlokaModel> shlokaModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(shlokaModel[index].image, scale: 4.3),
          opacity: 0.1,
        ),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: const Color.fromARGB(255, 247, 69, 5),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            shlokaModel[index].title,
            style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
