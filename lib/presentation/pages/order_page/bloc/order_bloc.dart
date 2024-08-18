import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/cart_datasource.dart';
import 'package:tedikap_user_bloc/data/datasource/order_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/history_order_reward_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_reorder_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/post_reorder_reward_response_model.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderDatasource datasource;
  final CartDatasource cartDatasource;


  bool isPesananDitolakReward = true;
  bool isPesananSelesaiReward = true;

  bool isPesananDibatalkan = true;
  bool isPesananSelesai = true;
  bool isPesananDitolak = true;


  DateTime startDate = DateTime.now().subtract(Duration(days: 365));
  DateTime endDate = DateTime.now();

  DateTime startDateReward = DateTime.now().subtract(Duration(days: 365));
  DateTime endDateReward = DateTime.now();

  OrderBloc(this.datasource, this.cartDatasource)
      : super(const OrderState.initial()) {

    on<_GetAllHistoryOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getAllHistoryOrder();

        result.fold(
          (l) => emit(const _Error(
              message: 'Oops, something went wrong. Please try again later')),
          (r) => emit(OrderState.success(
            r,
            null,
            0,
            null,
            null,
              isPesananDitolak: isPesananDitolak,
              isPesananDibatalkan: isPesananDibatalkan,
              isPesananSelesai: isPesananSelesai,
              startDate: startDate,
              endDate: endDate,
              isPesananSelesaiReward : isPesananSelesaiReward,
              isPesananDitolakReward: isPesananDitolakReward,
              startDateReward: startDateReward,
              endDateReward: endDateReward
          )),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_PostReOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.postReOrder(event.orderId!);

        result.fold(
          (l) => emit(const _Error(
              message: 'Oops, something went wrong. Please try again later')),
          (r) => emit(OrderState.success(null, null, 0, r, null)),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_PostReOrderReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.postReOrderReward(event.orderRewardId!);

        result.fold(
          (l) => emit(const _Error(
              message: 'Oops, something went wrong. Please try again later')),
          (r) => emit(OrderState.success(
            null,
            null,
            0,
            null,
            r,
          )),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetAllHistoryOrderReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getAllHistoryOrderReward();

        result.fold(
          (l) => emit(const _Error(
              message: 'Oops, something went wrong. Please try again later')),
          (r) => emit(OrderState.success(
            null,
            r,
            1,
            null,
            null,
              isPesananDitolak: isPesananDitolak,
              isPesananDibatalkan: isPesananDibatalkan,
              isPesananSelesai: isPesananSelesai,
              startDate: startDate,
              endDate: endDate,
              isPesananSelesaiReward : isPesananSelesaiReward,
              isPesananDitolakReward: isPesananDitolakReward,
              startDateReward: startDateReward,
              endDateReward: endDateReward
          )),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetCategoryOrder>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getFilterTypeOrder(event.query, event.query, event.startDate, event.endDate);

        await result.fold(
          (l) async => emit(const _Error(
              message: 'Oops, something went wrong. Please try again later')),
          (r) async => emit(OrderState.success(
            r,
            null,
            0,
            null,
            null,
              isPesananDitolak: isPesananDitolak,
              isPesananDibatalkan: isPesananDibatalkan,
              isPesananSelesai: isPesananSelesai,
              startDate: startDate,
              endDate: endDate,
              isPesananSelesaiReward : isPesananSelesaiReward,
              isPesananDitolakReward: isPesananDitolakReward,
              startDateReward: startDateReward,
              endDateReward: endDateReward

          )),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_GetCategoryOrderReward>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await datasource.getFilterTypeOrderReward(event.query, event.query, event.startDate, event.endDate);

        await result.fold(
          (l) async => emit(const _Error(
              message: 'Oops, something went wrong. Please try again later')),
          (r) async => emit(OrderState.success(
            null,
            r,
            0,
            null,
            null,
              isPesananDitolak: isPesananDitolak,
              isPesananDibatalkan: isPesananDibatalkan,
              isPesananSelesai: isPesananSelesai,
              startDate: startDate,
              endDate: endDate,
              isPesananSelesaiReward : isPesananSelesaiReward,
              isPesananDitolakReward: isPesananDitolakReward,
              startDateReward: startDateReward,
              endDateReward: endDateReward

          )),
        );
      } catch (e) {
        emit(_Error(message: e.toString()));
      }
    });

    on<_DoFilterOrder>((event, emit) async {
      emit(const OrderState.loading());
      final filterIndex = event.filterIndex;
      try {
        if (filterIndex == 0) {
          final result = await datasource.getFilterTypeOrder(event.query, event.statusOrder, event.startDate, event.endDate );
          emit(result.fold(
            (l) => const OrderState.error(
                message: 'Oops, something went wrong. Please try again later'),
            (r) => OrderState.success(
              r,
              null,
              filterIndex,
              null,
              null,
                isPesananDitolak: isPesananDitolak,
                isPesananDibatalkan: isPesananDibatalkan,
                isPesananSelesai: isPesananSelesai,
                startDate: startDate,
                endDate: endDate,
                isPesananSelesaiReward : isPesananSelesaiReward,
                isPesananDitolakReward: isPesananDitolakReward,
                startDateReward: startDateReward,
                endDateReward: endDateReward

            ),
          ));
        } else if (filterIndex == 1) {

          final result = await datasource.getFilterTypeOrderReward(event.query, event.statusOrderReward, event.startDateReward, event.endDateReward);
          emit(result.fold(
            (l) => const OrderState.error(
                message: 'Oops, something went wrong. Please try again later'),
            (r) => OrderState.success(
              null,
              r,
              filterIndex,
              null,
              null,
                isPesananDitolak: isPesananDitolak,
                isPesananDibatalkan: isPesananDibatalkan,
                isPesananSelesai: isPesananSelesai,
              endDate: endDate,
              startDate: startDate,
                isPesananSelesaiReward : isPesananSelesaiReward,
                isPesananDitolakReward: isPesananDitolakReward,
                startDateReward: startDateReward,
                endDateReward: endDateReward
            ),
          ));
        }
      } catch (e) {
        emit(OrderState.error(message: e.toString()));
      }
    });

    //Toggle Filter Status Order
    on<_ToggleDitolak>((event, emit) {
      isPesananDitolak = event.newValue!;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(isPesananDitolak : event.newValue));
      }
    });

    on<_ToggleDitolakReward>((event, emit) {
      isPesananDitolakReward = event.newValue!;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(isPesananDitolakReward : event.newValue));
      }
    });

    on<_ToggleDibatalkan>((event, emit) {
      isPesananDibatalkan = event.newValue!;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(isPesananDibatalkan : event.newValue));
      }
    });

    on<_ToggleSelesai>((event, emit) {
      isPesananSelesai = event.newValue!;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(isPesananSelesai : event.newValue));
      }
    });

    on<_ToggleSelesaiReward>((event, emit) {
      isPesananSelesaiReward = event.newValue!;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(isPesananSelesaiReward : event.newValue));
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

    on<_SetStartDateReward>((event, emit) {
      startDate = event.date;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(startDateReward: event.date));
      }
    });

    on<_SetEndDateReward>((event, emit) {
      endDateReward = event.date;
      if (state is _Success) {
        final currentState = state as _Success;
        emit(currentState.copyWith(endDateReward: event.date));
      }
    });

    // on<_ResetFilters>((event, emit) async {
    //   startDate = DateTime.now().subtract(Duration(days: 365));
    //   endDate = DateTime.now();
    //   isPesananSelesai = true;
    //   isPesananDibatalkan = true;
    //   isPesananDitolak = true;
    //
    //   emit(const OrderState.loading());
    //   final filterIndex = event.filterIndex;
    //   try {
    //     if (filterIndex == 0) {
    //       final result = await datasource.getFilterTypeOrder(event.query, event.statusOrder);
    //       emit(result.fold(
    //             (l) => const OrderState.error(
    //             message: 'Oops, something went wrong. Please try again later'),
    //             (r) => OrderState.success(
    //             r,
    //             null,
    //             filterIndex,
    //             null,
    //             null,
    //             isPesananDitolak: isPesananDitolak,
    //             isPesananDibatalkan: isPesananDibatalkan,
    //             isPesananSelesai: isPesananSelesai
    //         ),
    //       ));
    //     } else {
    //       final result = await datasource.getFilterTypeOrderReward(event.query);
    //       emit(result.fold(
    //             (l) => const OrderState.error(
    //             message: 'Oops, something went wrong. Please try again later'),
    //             (r) => OrderState.success(
    //             null,
    //             r,
    //             filterIndex,
    //             null,
    //             null,
    //             isPesananDitolak: isPesananDitolak,
    //             isPesananDibatalkan: isPesananDibatalkan,
    //             isPesananSelesai: isPesananSelesai
    //         ),
    //       ));
    //     }
    //   } catch (e) {
    //     emit(OrderState.error(message: e.toString()));
    //   }
    // });

  }
}
