import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitapp/src/app/core/params/no_params.dart';
import 'package:fitapp/src/features/onboarding/domain/entities/message_entity.dart';

import 'package:fitapp/src/features/onboarding/domain/usecase/get_messages.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetMessages getMessages;
  OnboardingBloc({required this.getMessages}) : super(OnboardingInitial()) {
    on<GetMotivationalMessagesEvent>(_getMessages);
  }

  _getMessages(
      GetMotivationalMessagesEvent event, Emitter<OnboardingState> emit) async {
    emit(OnboardingInitial());
    emit(OnboardingLoading());
    try {
      final response = await getMessages.call(params: NoParams());

      response.fold(
        (error) {
          log("123456 ${error.message}");
          emit(OnboardingFailed(error: "Something went wrong"));
        },
        (messages) {
          emit(OnboardingLoaded(messages: messages));
          log("33${messages.message.toString()}");
        },
      );
    } catch (e) {
      log("catch ${e.toString()}");
      emit(OnboardingFailed(error: e.toString()));
    }
  }
}
