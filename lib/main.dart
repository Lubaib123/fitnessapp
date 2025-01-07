import 'package:fitapp/src/app/core/dependancy-injection/injection_container.dart'
    as di;
import 'package:fitapp/src/features/journal/data/models/journal_model_class.dart';
import 'package:fitapp/src/fitness_app_.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  di.registerDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(JournalModelClassAdapter());
  await Hive.openBox<JournalModelClass>('journal');
  runApp(const FitnessApp());
}
