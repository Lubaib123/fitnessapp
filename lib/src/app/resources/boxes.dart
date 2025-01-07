import 'package:fitapp/src/features/journal/data/models/journal_model_class.dart';

import 'package:hive/hive.dart';

class Boxes {
  static Box<JournalModelClass> getJournal() =>
      Hive.box<JournalModelClass>('journal');
}
