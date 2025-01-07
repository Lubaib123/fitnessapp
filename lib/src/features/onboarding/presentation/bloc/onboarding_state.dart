part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {
  final MessageEntity messages;

  const OnboardingLoaded({required this.messages});
}

class OnboardingFailed extends OnboardingState {
  final String error;

  const OnboardingFailed({required this.error});
}
