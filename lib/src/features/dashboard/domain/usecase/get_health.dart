import 'package:dartz/dartz.dart';
import 'package:fitapp/src/app/core/error/failure.dart';
import 'package:fitapp/src/app/core/params/no_params.dart';
import 'package:fitapp/src/app/core/usecase/usecase.dart';
import 'package:fitapp/src/features/dashboard/domain/entities/health_metrics_entity.dart';
import 'package:fitapp/src/features/dashboard/domain/repositories/health_repository.dart';

class GetHealthMetricsData
    extends UseCase<Either<Failure, HealthMetricsEntity>, NoParams> {
  final HealthRepository healthRepository;

  GetHealthMetricsData({required this.healthRepository});

  @override
  Future<Either<Failure, HealthMetricsEntity>> call(
      {required NoParams params}) {
    return healthRepository.getHealth();
  }
}
