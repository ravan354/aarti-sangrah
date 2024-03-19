import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shinde_tech_aarti_sangrah/controllers/screen_index_provider.dart';
import 'package:shinde_tech_aarti_sangrah/streams/aarti_stream.dart';
import 'package:shinde_tech_aarti_sangrah/streams/shloks_stream.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<dynamic> screens = [AartisStream(), ShlokasStream()];

  @override
  Widget build(BuildContext context) {
    final screenIndexProvider = Provider.of<ScreenIndexProvider>(context);
    int currentScreenIndex = screenIndexProvider.fetchCurrentScreenIndex;
    return Scaffold(
      body: screens[currentScreenIndex],
    );
  }
}
