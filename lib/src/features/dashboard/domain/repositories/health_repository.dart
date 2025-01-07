import 'package:dartz/dartz.dart';
import 'package:fitapp/src/app/core/error/failure.dart';
import 'package:fitapp/src/features/dashboard/domain/entities/health_metrics_entity.dart';

abstract class HealthRepository {
  Future<Either<Failure, HealthMetricsEntity>> getHealth();
}
