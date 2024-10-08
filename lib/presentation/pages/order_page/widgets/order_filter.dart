import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/theme.dart';
import '../bloc/order_bloc.dart';

class OrderFilter extends StatelessWidget {
  final List<String> options = ['Common Order', 'Reward Order'];

  OrderFilter({
    super.key,
    this.query,
    this.statusOrder,
    this.startDate,
    this.endDate,
  });

  final String? query;
  final String? statusOrder;
  final String? startDate;
  final String? endDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        int filterIndex = state.maybeMap(
          success: (successState) => successState.filterIndex,
          orElse: () => 0,
        );
        return ChipsChoice<int>.single(
          value: filterIndex,
          onChanged: (val) {
            if (val != filterIndex) {
              if (query == 'history') {
                context.read<OrderBloc>().add(OrderEvent.doFilterOrder(
                      filterIndex: val,
                      query: query!,
                      statusOrder: statusOrder,
                      startDate: startDate,
                      endDate: endDate,
                    ));
              } else {
                context.read<OrderBloc>().add(OrderEvent.doFilterOrder(
                      filterIndex: val,
                      query: query!,
                  statusOrder: '',
                  endDate: '',
                  startDate: '',
                    ));
              }
            }
          },
          choiceItems: C2Choice.listFrom<int, String>(
            source: options,
            value: (i, v) => i,
            label: (i, v) => v,
          ),
          choiceStyle: C2ChipStyle.outlined(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            foregroundStyle: txtPrimarySubTitle.copyWith(
                fontWeight: FontWeight.w500, color: Colors.black38),
            color: Colors.black12,
            avatarForegroundColor: Colors.black12,
            borderStyle: BorderStyle.solid,
            borderOpacity: 0.3,
            selectedStyle: C2ChipStyle(
              checkmarkColor: primaryColor,
              checkmarkStyle: C2ChipCheckmarkStyle.round,
              foregroundStyle: txtPrimarySubTitle.copyWith(
                  fontWeight: FontWeight.w500, color: primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              borderColor: primaryColor,
              borderWidth: 2,
            ),
          ),
        );
      },
    );
  }
}
