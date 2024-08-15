import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/notification_response_model.dart';

import '../../../../data/datasource/user_datasource.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final UserDatasource userDatasource;

  bool isInformation = true;
  bool isVoucher = true;
  DateTime startDate = DateTime.now().subtract(Duration(days: 365));
  DateTime endDate = DateTime.now();

  NotificationBloc(this.userDatasource) : super(const NotificationState.initial()) {
    on<_GetNotification>((event, emit) async {
      emit(const _Loading());
      final result = await userDatasource.getNotification();
      result.fold((l) => emit(const _Error('Failed to get data user')), (r) => emit(_Success( r, true, true)));
    });

    on<_GetFilterNotification>((event, emit) async {
      emit(const _Loading());
      final result = await userDatasource.getFilterNotification(type: event.type, startDate: event.startDate, endDate: event.endDate);
      result.fold((l) => emit(const _Error('Failed to get data user')), (r) => emit(_Success( r, isInformation, isVoucher, startDate: startDate, endDate: endDate)));
    });

    on<_ToggleInfo>((event, emit) {
      isInformation = event.newValueFilter!;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(isInformation: event.newValue, ));
      }
    });

    on<_ToggleVoucher>((event, emit) {
      isVoucher = event.newValueFilter!;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(isVoucher: event.newValue));
      }
    });

    on<_SetStartDate>((event, emit) {
      startDate = event.date;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(startDate: event.date));
      }
    });

    on<_SetEndDate>((event, emit) {
      endDate = event.date;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(endDate: event.date));
      }
    });



    on<_ResetFilters>((event, emit) async {
      startDate = DateTime.now().subtract(Duration(days: 365));
      endDate = DateTime.now();
      isInformation = true;
      isVoucher = true;

      emit(_Loading());
      // Fetch all notifications after resetting filters
      final result = await userDatasource.getNotification();
      result.fold(
            (l) => emit(const _Error('Failed to get data user')),
            (r) => emit(_Success(r, isInformation, isVoucher, startDate: startDate, endDate: endDate)),
      );
    });



  }
}
