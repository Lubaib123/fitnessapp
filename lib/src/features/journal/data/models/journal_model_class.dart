import 'package:hive/hive.dart';
part 'journal_model_class.g.dart';

@HiveType(typeId: 0)
class JournalModelClass extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late DateTime jouralDate;
  @HiveField(2)
  late int moodid;
  @HiveField(3)
  late String journalText;
}
