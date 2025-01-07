import 'package:fitapp/src/features/dashboard/data/repository/health_repository_impl.dart';
import 'package:fitapp/src/features/dashboard/domain/repositories/health_repository.dart';
import 'package:fitapp/src/features/dashboard/domain/usecase/get_health.dart';
import 'package:fitapp/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:fitapp/src/features/onboarding/data/repository/message_repository_impl.dart';
import 'package:fitapp/src/features/onboarding/domain/repositories/message_repository.dart';
import 'package:fitapp/src/features/onboarding/domain/usecase/get_messages.dart';
import 'package:fitapp/src/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void registerDependencies() {
  sl.registerLazySingleton<MessageRepository>(() => MessageRepositoryImpl());
  sl.registerLazySingleton<OnboardingBloc>(() => OnboardingBloc(
      getMessages: GetMessages(messageRepository: sl<MessageRepository>())));

  sl.registerLazySingleton<HealthRepository>(() => HealthRepositoryImpl());
  sl.registerLazySingleton<DashboardBloc>(() => DashboardBloc(
      GetHealthMetricsData(healthRepository: sl<HealthRepository>())));
}
