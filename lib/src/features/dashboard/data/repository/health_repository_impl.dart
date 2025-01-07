import 'package:dartz/dartz.dart';
import 'package:fitapp/gen/assets.gen.dart';
import 'package:fitapp/src/app/core/error/failure.dart';
import 'package:fitapp/src/features/dashboard/data/model/health_metric_model.dart';
import 'package:fitapp/src/features/dashboard/domain/entities/health_metrics_entity.dart';
import 'package:fitapp/src/features/dashboard/domain/repositories/health_repository.dart';
import 'package:flutter/services.dart';

class HealthRepositoryImpl extends HealthRepository {
  @override
  Future<Either<Failure, HealthMetricsEntity>> getHealth() async {
    try {
      final String response =
          await rootBundle.loadString(Assets.json.wearableData);
      // final data = await json.decode(response);
      final healthData = HealthMetricModel.fromJson(response);
      return right(healthData);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
