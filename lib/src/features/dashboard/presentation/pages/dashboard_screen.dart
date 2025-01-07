import 'dart:developer';

import 'package:fitapp/src/app/resources/boxes.dart';
import 'package:fitapp/src/app/resources/emoji_data.dart';
import 'package:fitapp/src/app/themes/app_palette.dart';
import 'package:fitapp/src/app/themes/app_typography.dart';
import 'package:fitapp/src/app/widgets/animated_image.dart';
import 'package:fitapp/src/app/widgets/data_card.dart';
import 'package:fitapp/src/app/widgets/line_graph.dart';
import 'package:fitapp/src/features/journal/data/models/journal_model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fl_chart/fl_chart.dart';

class JournalDashboardScreen extends StatefulWidget {
  const JournalDashboardScreen({super.key});

  @override
  State<JournalDashboardScreen> createState() => _JournalDashboardScreenState();
}

class _JournalDashboardScreenState extends State<JournalDashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<Box<JournalModelClass>>(
        valueListenable: Boxes.getJournal().listenable(),
        builder: (context, box, _) {
          final journals = box.values.toList().cast<JournalModelClass>();
          return buildContent(journals);
        },
      ),
    );
  }

  // Function to get emoji asset path by ID
  String getEmojiAssetPath(int moodId) {
    final emoji = emojis.firstWhere(
      (emoji) => emoji.id == moodId,
      orElse: () => emojis[0],
    );
    return emoji.assetPath;
  }

  // Function to find the most repeated mood
  // Function to find the most positive mood (excluding Angry and Sad)
  // Function to find the most positive mood (excluding Angry and Sad)
  Emoji? getMostPositiveMood(List<JournalModelClass> journals) {
    if (journals.isEmpty) {
      // If there are no journals, return null or indicate no positive mood
      return null;
    }

    // Filter out mood IDs 1 (Angry) and 2 (Sad) as they are not considered positive
    final filteredJournals = journals
        .where(
          (journal) => (journal.moodid) > 2,
        ) // Exclude Angry (1) and Sad (2)
        .toList();

    if (filteredJournals.isEmpty) {
      // If no positive mood found, return null or indicate no positive mood
      return null;
    }

    // Find the journal entry with the highest moodid (most positive)
    final mostPositiveMoodId = filteredJournals
        .map(
          (journal) => journal.moodid,
        ) // Get all moodids, fallback to 0 if null
        .reduce((a, b) => a > b ? a : b); // Find the highest moodid

    // Return the corresponding emoji for the most positive mood
    return emojis.firstWhere((emoji) => emoji.id == mostPositiveMoodId);
  }

  // Function to build the line graph data
  List<FlSpot> getLineGraphData(List<JournalModelClass> journals) {
    // Get the latest 7 entries
    final recentJournals = journals.reversed.take(7).toList();
    // Reverse the list again to ensure the correct order (oldest first)
    final recentJournalsReversed = recentJournals.reversed.toList();

    return List.generate(recentJournalsReversed.length, (index) {
      final moodid =
          recentJournalsReversed[index].moodid; // Safe fallback for moodid
      log("${(index).toDouble() * 2}-- ${moodid.toDouble()}");
      return FlSpot((index).toDouble() * 2, moodid.toDouble()); // Add +1 to x
    });
  }

  Widget buildContent(List<JournalModelClass> journals) {
    // if (journals.isEmpty) {
    //   return const Center(
    //     child: Text('No journals yet!', style: TextStyle(fontSize: 24)),
    //   );
    // } else {
    Emoji? mostPositiveMood = getMostPositiveMood(journals);
    final lineGraphData = getLineGraphData(journals);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalette.backgroundColor,
        elevation: 0,
        centerTitle: false,
        title: Text('Mood Graph', style: AppTypography().heading1),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.all(12),
            onPressed: () {},
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/15014092/pexels-photo-15014092/free-photo-of-close-up-shot-of-a-man-wearing-black-shirt-on-white-background.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 28,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MoodGraphWrapper(lineGraphData: lineGraphData),

              // Use the LineGraphW
              MoodCard(mostPositiveMood: mostPositiveMood),

              DataCard(),
            ],
          ),
        ),
      ),
    );
    // }
  }
}

class MoodGraphWrapper extends StatelessWidget {
  const MoodGraphWrapper({super.key, required this.lineGraphData});

  final List<FlSpot> lineGraphData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withAlpha((0.1 * 255).toInt()), // Shadow color with opacity
            offset: Offset(0, 4), // Position of the shadow
            blurRadius: 6, // Blur radius
            spreadRadius: 1, // Spread radius
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 240, 235, 229),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 1.3,
          child: LineChartWidget(chartData: lineGraphData),
        ),
      ),
    );
  }
}

class MoodCard extends StatelessWidget {
  const MoodCard({super.key, required this.mostPositiveMood});

  final Emoji? mostPositiveMood;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16), // Add padding for better spacing
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: AppPalette.lighbrowGradient,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (mostPositiveMood != null)
            SizedBox(
              width: 80,
              height: 80,
              child: AnimatedImage(
                imagepath: mostPositiveMood?.assetPath ?? "",
              ),
            )
          else
            SizedBox.shrink(),
          SizedBox(width: 16), // Add spacing between the image and text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mostPositiveMood != null
                      ? 'Most Positive Mood'
                      : 'No positive mood added yet',
                  style: AppTypography().heading4,
                ),
                SizedBox(height: 8), // Space between title and subtitle
                Text(
                  mostPositiveMood != null
                      ? mostPositiveMood!.name
                      : 'Be Positive 😊. Keep moving forward',
                  style: AppTypography().body1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
