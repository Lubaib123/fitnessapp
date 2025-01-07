part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final HealthMetricsEntity healthdata;

  const DashboardLoaded({required this.healthdata});
}

class DashboardFailed extends DashboardState {
  final String error;

  const DashboardFailed({required this.error});
}
