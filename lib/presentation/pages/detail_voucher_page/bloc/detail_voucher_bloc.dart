import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/detail_voucher_response_model.dart';

import '../../../../data/datasource/voucher_datasource.dart';

part 'detail_voucher_event.dart';
part 'detail_voucher_state.dart';
part 'detail_voucher_bloc.freezed.dart';

class DetailVoucherBloc extends Bloc<DetailVoucherEvent, DetailVoucherState> {
  final VoucherDatasource voucherDatasource;
  DetailVoucherBloc(this.voucherDatasource) : super(const DetailVoucherState.initial()) {
    on<_GetDetailVoucher>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await voucherDatasource.getDetailVoucher(event.id);
        result.fold(
                (l) => emit(_Error(message: 'Failed to access data product')),
                (r) => emit(_Success(model: r)) // Update products in _Success state
        );
      } catch (e){
        emit(const _Error(message: 'Failed to access data voucher'));
      }
    });
  }
}
