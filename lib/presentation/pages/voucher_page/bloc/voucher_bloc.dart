import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/datasource/cart_datasource.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/voucher_active_response_model.dart';
import 'package:tedikap_user_bloc/data/models/response/voucher_applied_remove_response_model.dart';

import '../../../../data/datasource/voucher_datasource.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';
part 'voucher_bloc.freezed.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherDatasource voucherDatasource;
  final CartDatasource cartDatasource;

  VoucherBloc(this.voucherDatasource, this.cartDatasource) : super(const VoucherState.initial()) {

    on<_GetVoucher>((event, emit) async {
      emit(const _Loading());
      try {
        final result = await voucherDatasource.getVoucher();
        await result.fold(
                (l) async => emit(_Error(message: 'Failed to access data voucher')),
                (r) async {
                  final getCartResult = await cartDatasource.getCart();
                  final getCartDetails = getCartResult.fold((l) => null, (cart) => cart);
                  final isUseVoucher = getCartDetails?.cart?.voucherId != null;

                  emit(_Success(
                      modelVoucher: r,
                      modelCart: getCartDetails,
                      modelVoucherAppliedRemove: null,
                    isUseVoucher: isUseVoucher,
                    cartModel: getCartDetails
                  ));
                } // Update products in _Success state
        );
      } catch (e) {
        emit(const VoucherState.error(message: 'Failed to access data voucher wkkw'));
      }
    });


    on<_ApplyVoucher>((event, emit) async {
      final currentState = state;
      if (currentState is _Success)  {
        emit(const _Loading());
        try {
          final response = await voucherDatasource.postApplyVoucher(event.voucherId!);
          await response.fold(
                (l) async => emit(_Error(message: l)),
                (r) async{
                  final updatedVoucherResult = await voucherDatasource.getVoucher();
                  final updatedVoucherDetails = updatedVoucherResult.fold((l) => null, (voucher) => voucher);

                  emit((currentState.copyWith(
                      modelVoucher: updatedVoucherDetails,
                      modelCart: null,
                      modelVoucherAppliedRemove: r,
                      isUseVoucher: true
                  )));
                }
          );
        } catch (e) {
          emit(_Error(message: 'An error occurred: $e'));
        }
      }
    });

    on<_RemoveVoucher>((event, emit) async {
      final currentState = state;
      if (currentState is _Success) {
        emit(const _Loading());
        try {
          final response = await voucherDatasource.postRemoveVoucher(event.voucherId!);
          await response.fold(
                (l) async => emit(_Error(message: l)),
                (r) async{
                  final updatedVoucherResult = await voucherDatasource.getVoucher();
                  final updatedVoucherDetails = updatedVoucherResult.fold((l) => null, (voucher) => voucher);

                  emit((currentState.copyWith(
                      modelVoucher: updatedVoucherDetails,
                      modelCart: null,
                      modelVoucherAppliedRemove: r,
                      isUseVoucher: false
                  )));
                }

          );
        } catch (e) {
          emit(_Error(message: 'An error occurred: $e'));
        }
      }
    });

  }
}
