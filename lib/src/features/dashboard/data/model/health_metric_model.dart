// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:fitapp/src/features/dashboard/domain/entities/health_metrics_entity.dart';

class HealthMetricModel extends HealthMetricsEntity {
  @override
  final int steps;
  @override
  final int heartRate;
  final String lastUpdated;
  HealthMetricModel(this.steps, this.heartRate, this.lastUpdated)
      : super(heartRate: heartRate, steps: steps, lastupdated: lastUpdated);

  Map<String, dynamic> toMap() {
    return {'steps': steps, 'heartRate': heartRate, 'lastUpdated': lastUpdated};
  }

  factory HealthMetricModel.fromMap(Map<String, dynamic> map) {
    return HealthMetricModel(
      map['steps'] ?? '',
      map['heartRate'] ?? '',
      map['lastUpdated'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthMetricModel.fromJson(String source) =>
      HealthMetricModel.fromMap(json.decode(source));
}
