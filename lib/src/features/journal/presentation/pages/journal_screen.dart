import 'dart:math';
import 'dart:ui';
import 'package:fitapp/src/app/resources/boxes.dart';
import 'package:fitapp/src/app/resources/emoji_data.dart';
import 'package:fitapp/src/app/themes/app_button.dart';
import 'package:fitapp/src/app/themes/app_palette.dart';
import 'package:fitapp/src/app/themes/app_typography.dart';
import 'package:fitapp/src/app/themes/textfield_custom.dart';
import 'package:fitapp/src/app/widgets/journal_head.dart';
import 'package:fitapp/src/features/journal/data/models/journal_model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen>
    with SingleTickerProviderStateMixin {
  final PageController pageController = PageController(
    viewportFraction: 0.4,
    initialPage: 2,
  );

  DateTime generateRandomDate() {
    final random = Random();
    final currentYear = DateTime.now().year;

    final randomYear = random.nextInt(5) + (currentYear - 3);
    final randomMonth = random.nextInt(12) + 1;
    final randomDay = random.nextInt(28) + 1;

    return DateTime(randomYear, randomMonth, randomDay);
  }

  Emoji? selectedMood;
  Emoji? focusedemoiji;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  Future addjournal({
    String? journalText,
    int? moodid,
    String? moodname,
    DateTime? todaysDate,
  }) async {
    final journal =
        JournalModelClass()
          ..journalText = journalText ?? ""
          ..moodid = selectedMood!.id
          ..name = selectedMood!.name
          ..jouralDate = todaysDate!;
    final box = Boxes.getJournal();
    box.add(journal);
  }

  void showCustomAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dismissal by tapping outside the dialog
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
          contentPadding: EdgeInsets.all(16), // Padding around the content
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Makes the dialog size match the content
            children: [
              Text(
                "Journal entry added successfully!",
                style: AppTypography().heading4.copyWith(color: Colors.green),

                // TextStyle(
                //   fontSize: 18,
                //   fontWeight: FontWeight.bold,
                //   color: Colors.green,
                // ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text("Close"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    focusedemoiji = emojis[2];

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });

    pageController.addListener(() {
      final page = pageController.page?.round() ?? 2;
      setState(() {
        focusedemoiji = emojis[page];
      });
    });
  }

  TextEditingController journalText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Building JournalScreen");
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(
              background: DarkenedImageWithText(
                imageUrl:
                    'https://images.pexels.com/photos/2924491/pexels-photo-2924491.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                text: "You're doing great! Keep it up!",
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 16.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Journal Entry",
                          style: AppTypography().heading1,
                        ),
                      ),
                      Divider(thickness: 2),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "How are you feeling today?",
                          style: AppTypography().heading3,
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 130,
                              child: PageView.builder(
                                controller: pageController,
                                itemCount: emojis.length,
                                itemBuilder: (context, index) {
                                  print("Building emoji at index: $index");
                                  return AnimatedBuilder(
                                    animation: pageController,
                                    builder: (context, child) {
                                      double value = 0;
                                      if (pageController
                                          .position
                                          .haveDimensions) {
                                        value = pageController.page! - index;
                                        value = (1 - (value.abs() * 0.4)).clamp(
                                          0.8,
                                          1.2,
                                        );
                                      }
                                      return Center(
                                        child: Transform.scale(
                                          scale: value,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: CupertinoButton(
                                      padding: EdgeInsets.all(0),
                                      onPressed: () {
                                        setState(() {
                                          if (selectedMood != emojis[index]) {
                                            selectedMood = emojis[index];
                                          } else {
                                            selectedMood = null;
                                          }
                                          HapticFeedback.lightImpact();
                                          pageController.animateToPage(
                                            index,
                                            duration: Duration(
                                              milliseconds: 100,
                                            ),
                                            curve: Curves.easeInOut,
                                          );
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          emojishower(
                                            selectedMood: selectedMood,
                                            focusedemoiji: focusedemoiji,
                                            index: index,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color:
                                    (selectedMood?.id == focusedemoiji?.id)
                                        ? Colors.teal.withOpacity(0.2)
                                        : Colors.white.withOpacity(0.2),
                                border: Border.all(
                                  color:
                                      (selectedMood?.id == focusedemoiji?.id)
                                          ? Colors.teal.withOpacity(0.3)
                                          : Colors.white.withOpacity(0.3),
                                  width: 3,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5.0,
                                    sigmaY: 5.0,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      focusedemoiji?.name ?? emojis[2].name,
                                      style: AppTypography().heading3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Write about your feelings today?",
                          style: AppTypography().heading3,
                        ),
                      ),
                      AppTextfield(
                        maxLines: 4,
                        hinttext: "Feelings",
                        controller: journalText,
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                      SlideTransition(
                        position: _slideAnimation,
                        child: AppButton(
                          isEnable:
                              (selectedMood != null &&
                                  journalText.text.isNotEmpty),
                          title: "Add Journal",
                          onTap: () {
                            HapticFeedback.mediumImpact();
                            final selectedEmoji = selectedMood ?? emojis[2];

                            addjournal(
                              moodid: selectedEmoji.id,
                              moodname: selectedEmoji.name,
                              journalText: journalText.text,
                              todaysDate: generateRandomDate(),
                            ).whenComplete(() {
                              selectedMood = null;
                              journalText.clear();
                              setState(() {});
                              showCustomAlertDialog(context);
                              print(
                                "Selected Emoji: ID=${selectedEmoji.id}, Name=${selectedEmoji.name}",
                              );
                            });
                          },
                        ),

                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

class emojishower extends StatelessWidget {
  emojishower({
    super.key,
    required this.selectedMood,
    required this.focusedemoiji,
    required this.index,
  });
  int index;
  final Emoji? selectedMood;
  final Emoji? focusedemoiji;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color:
            (selectedMood?.id == emojis[index].id)
                ? null // Set to null because we'll use the gradient instead
                : (focusedemoiji?.id == emojis[index].id)
                ? AppPalette.white
                : Colors.transparent,
        gradient:
            (selectedMood?.id == emojis[index].id)
                ? AppPalette.cardbluegreen
                : null, // No gradient when the condition is not met
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.white30, blurRadius: 2, offset: Offset(0, 4)),
        ],
      ),
      child: Image.asset(
        emojis[index].assetPath, // Ensure the asset paths are correct
        fit: BoxFit.cover,
      ),
    );
  }
}
