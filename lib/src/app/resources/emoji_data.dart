import 'package:fitapp/gen/assets.gen.dart';

class Emoji {
  final int id;
  final String assetPath;
  final String name;

  Emoji({required this.id, required this.assetPath, required this.name});
}

final List<Emoji> emojis = [
  Emoji(id: 1, assetPath: Assets.icons.angryemoji.keyName, name: "Angry"),
  Emoji(id: 2, assetPath: Assets.icons.sadEmoji.keyName, name: "Sad"),
  Emoji(id: 3, assetPath: Assets.icons.neutralEmoji.keyName, name: "Neutral"),
  Emoji(id: 4, assetPath: Assets.icons.confusedEmoji.keyName, name: "Confused"),
  Emoji(id: 5, assetPath: Assets.icons.happyEmoji.keyName, name: "Happy"),
];
