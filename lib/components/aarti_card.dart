import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AartiCard extends StatelessWidget {
  const AartiCard({super.key, required this.aartiModel, required this.index});

  final RxList aartiModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(aartiModel[index].image, scale: 4.3),
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
            aartiModel[index].title,
            style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
