import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitapp/src/app/core/params/no_params.dart';
import 'package:fitapp/src/features/dashboard/domain/entities/health_metrics_entity.dart';
import 'package:fitapp/src/features/dashboard/domain/usecase/get_health.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetHealthMetricsData getHealthMetricsData;
  DashboardBloc(this.getHealthMetricsData) : super(DashboardInitial()) {
    on<GetHealthEvent>(_getMessages);
  }
  _getMessages(GetHealthEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardInitial());
    emit(DashboardLoading());
    try {
      final response = await getHealthMetricsData.call(params: NoParams());

      response.fold(
        (error) {
          log("123456 ${error.message}");
          emit(DashboardFailed(error: "Something went wrong"));
        },
        (healthdata) {
          emit(DashboardLoaded(healthdata: healthdata));
          log("33${healthdata.toString()}");
        },
      );
    } catch (e) {
      log("catch ${e.toString()}");
      emit(DashboardFailed(error: e.toString()));
    }
  }
}
