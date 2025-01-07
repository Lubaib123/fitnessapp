import 'dart:convert';

import 'package:fitapp/src/app/themes/app_palette.dart';
import 'package:fitapp/src/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:fitapp/src/features/journal/presentation/pages/journal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    fetchMotivationalMessage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (selectedIndex == 0) ? JournalDashboardScreen() : JournalScreen(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(gradient: AppPalette.cardbluegreen),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          selectedItemColor: Colors.yellowAccent,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 0 ? Icons.home_filled : CupertinoIcons.home,
              ),
              label: "Dashboard",
            ),

            BottomNavigationBarItem(
              icon: Icon(
                selectedIndex == 1
                    ? CupertinoIcons.person_alt_circle_fill
                    : CupertinoIcons.person_alt,
              ),
              label: "Journal",
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> fetchMotivationalMessage() async {
  await Future.delayed(Duration(seconds: 2)); // Simulating network delay
  final String response = await rootBundle.loadString(
    'assets/motivational_messages.json',
  );
  final data = jsonDecode(response);
  return data['message'];
}
