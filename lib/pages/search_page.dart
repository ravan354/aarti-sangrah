import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shinde_tech_aarti_sangrah/components/constants.dart';
import 'package:shinde_tech_aarti_sangrah/controllers/screen_index_provider.dart';
import 'package:shinde_tech_aarti_sangrah/models/shloka_model.dart';
import 'package:shinde_tech_aarti_sangrah/streams/filtered_aarti_stream.dart';
import 'package:shinde_tech_aarti_sangrah/streams/filtered_shloks_stream.dart';

import '../models/aarti_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchName = "";

  @override
  Widget build(BuildContext context) {
    final screenIndexProvider = Provider.of<ScreenIndexProvider>(context);
    int currentScreenIndex = screenIndexProvider.fetchCurrentScreenIndex;

    Stream<RxList<AartiModel>> plainAartiStream = FirebaseFirestore.instance
        .collection('Aartis')
        .snapshots()
        .map((event) => event.docs
            .map((e) => AartiModel.fromFirestore(e, null))
            .toList()
            .obs);
    Stream<RxList<AartiModel>> filteredAartiStream = FirebaseFirestore.instance
        .collection('Aartis')
        .where('search', arrayContains: searchName)
        .snapshots()
        .map((event) => event.docs
            .map((e) => AartiModel.fromFirestore(e, null))
            .toList()
            .obs);
    Stream<RxList<ShlokaModel>> plainShloksStream = FirebaseFirestore.instance
        .collection('Shlokas')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ShlokaModel.fromFirestore(e)).toList().obs);
    Stream<RxList<ShlokaModel>> filteredShloksStream = FirebaseFirestore
        .instance
        .collection('Shlokas')
        .where('search', arrayContains: searchName)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => ShlokaModel.fromFirestore(e)).toList().obs);

    return Column(
      children: [
        Container(
          color: Constants.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (value) {
              setState(
                () {
                  searchName = value;
                },
              );
            },
            decoration: const InputDecoration(
              hintText: 'Search aarti.....',
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            cursorColor: Colors.white54,
          ),
        ),
        const Gap(20),
        switch (currentScreenIndex) {
          0 => FilteredAartiStream(
              searchName: searchName,
              filteredAartiStream: filteredAartiStream,
              plainAartiStream: plainAartiStream),
          1 => FilteredShlokStream(
              searchName: searchName,
              filteredShlokStream: filteredShloksStream,
              plainShlokStream: plainShloksStream),
          _ => const Center(
              child: Text('No List Avilable '),
            )
        }
      ],
    );
  }
}
