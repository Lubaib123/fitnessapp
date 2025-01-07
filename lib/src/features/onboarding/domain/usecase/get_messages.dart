import 'package:dartz/dartz.dart';
import 'package:fitapp/src/app/core/error/failure.dart';
import 'package:fitapp/src/app/core/params/no_params.dart';
import 'package:fitapp/src/app/core/usecase/usecase.dart';
import 'package:fitapp/src/features/onboarding/domain/entities/message_entity.dart';
import 'package:fitapp/src/features/onboarding/domain/repositories/message_repository.dart';

class GetMessages extends UseCase<Either<Failure, MessageEntity>, NoParams> {
  final MessageRepository messageRepository;

  GetMessages({required this.messageRepository});

  @override
  Future<Either<Failure, MessageEntity>> call({required NoParams params}) {
    return messageRepository.getMessage();
  }
}
