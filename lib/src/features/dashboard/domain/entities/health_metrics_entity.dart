class HealthMetricsEntity {
  final String lastupdated;
  final int steps;
  final int heartRate;

  HealthMetricsEntity(
      {required this.steps,
      required this.heartRate,
      required this.lastupdated});
}
