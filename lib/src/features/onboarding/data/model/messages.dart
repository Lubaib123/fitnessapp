import 'dart:convert';

import 'package:fitapp/src/features/onboarding/domain/entities/message_entity.dart';

class Messages extends MessageEntity {
  final String messages;
  Messages(this.messages) : super(message: messages);

  Map<String, dynamic> toMap() {
    return {
      'message': messages,
    };
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    return Messages(
      map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Messages.fromJson(String source) =>
      Messages.fromMap(json.decode(source));
}
