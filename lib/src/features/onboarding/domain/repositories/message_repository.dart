import 'package:dartz/dartz.dart';
import 'package:fitapp/src/app/core/error/failure.dart';
import 'package:fitapp/src/features/onboarding/domain/entities/message_entity.dart';

abstract class MessageRepository {
  Future<Either<Failure, MessageEntity>> getMessage();
}
