import 'package:dartz/dartz.dart';
import 'package:fitapp/gen/assets.gen.dart';
import 'package:fitapp/src/app/core/error/failure.dart';
import 'package:fitapp/src/features/onboarding/data/model/messages.dart';
import 'package:fitapp/src/features/onboarding/domain/entities/message_entity.dart';
import 'package:fitapp/src/features/onboarding/domain/repositories/message_repository.dart';
import 'package:flutter/services.dart';

class MessageRepositoryImpl extends MessageRepository {
  @override
  Future<Either<Failure, MessageEntity>> getMessage() async {
    try {
      final String response =
          await rootBundle.loadString(Assets.json.motivationalMessages);
      // final data = await json.decode(response);
      final messageData = Messages.fromJson(response);
      return right(messageData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
