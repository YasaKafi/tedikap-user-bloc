import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/theme.dart';
import '../../../global_components/common_button.dart';
import '../bloc/order_bloc.dart';

class ShowFilter {
  final BuildContext context;
  final int? tapIndex;
  final String query;
  final TextStyle titleDateStyle;
  final bool isMounted;

  ShowFilter(this.isMounted,
       {
         required this.titleDateStyle,
    required this.context,
    required this.tapIndex,
    required this.query,
  });

  bool get mounted => isMounted;


  Future<void> _selectDate(BuildContext context,
      {required bool isStartDate, required int filterIndex}) async {
    DateTime initialDate = isStartDate
        ? DateTime.now().subtract(const Duration(days: 365))
        : DateTime.now();
    DateTime firstDate = DateTime(2021);
    DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryColor, // header background color
              onPrimary: baseColor, // header text color
              onSurface: blackColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (isStartDate) {
        filterIndex == 0
            ? context.read<OrderBloc>().add(OrderEvent.setStartDate(picked))
            : context
            .read<OrderBloc>()
            .add(OrderEvent.setStartDateReward(picked));
      } else {
        filterIndex == 0
            ? context.read<OrderBloc>().add(OrderEvent.setEndDate(picked))
            : context
            .read<OrderBloc>()
            .add(OrderEvent.setEndDateReward(picked));
      }
    }
  }

  void call() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          padding: const EdgeInsets.only(top: 10.0),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () {
                    return const SizedBox();

                  }, success: (model,
                  modelReward,
                  filterIndex,
                  modelReOrder,
                  modelReOrderReward,
                  modelReview,
                  isPesananDitolak,
                  isPesananDibatalkan,
                  isPesananSelesai,
                  startDate,
                  endDate,
                  isPesananDitolakReward,
                  isPesananSelesaiReward,
                  startDateReward,
                  endDateReward) {

                String startDateText = DateFormat('yyyy-MM-dd')
                    .format(DateTime.now().subtract(const Duration(days: 365)));
                String endDateText =
                DateFormat('yyyy-MM-dd').format(DateTime.now());

                startDateText = startDate != null
                    ? DateFormat('yyyy-MM-dd').format(startDate)
                    : startDateText;
                endDateText = endDate != null
                    ? DateFormat('yyyy-MM-dd').format(endDate)
                    : endDateText;

                String startDateTextReward = DateFormat('yyyy-MM-dd')
                    .format(DateTime.now().subtract(const Duration(days: 365)));
                String endDateTextReward =
                DateFormat('yyyy-MM-dd').format(DateTime.now());

                startDateTextReward = startDateReward != null
                    ? DateFormat('yyyy-MM-dd').format(startDateReward)
                    : startDateTextReward;
                endDateTextReward = endDateReward != null
                    ? DateFormat('yyyy-MM-dd').format(endDateReward)
                    : endDateTextReward;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                              width: 50,
                              height: 6,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status Pesanan',
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 10),
                              Visibility(
                                visible: tapIndex == 1,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Selesai',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                      value: filterIndex == 0
                                          ? (isPesananSelesai ?? true)
                                          : (isPesananSelesaiReward ?? true),
                                      activeColor: primaryColor,
                                      onChanged: (newValue) {
                                        filterIndex == 0
                                            ? context.read<OrderBloc>().add(
                                            OrderEvent.togglePesananSelesai(
                                                newValue))
                                            : context.read<OrderBloc>().add(
                                            OrderEvent
                                                .togglePesananSelesaiReward(
                                                newValue));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: filterIndex == 0,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Dibatalkan',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: isPesananDibatalkan ?? false,
                                        activeColor: primaryColor,
                                        onChanged: (newValue) {
                                          context.read<OrderBloc>().add(
                                              OrderEvent
                                                  .togglePesananDibatalkan(
                                                  newValue));
                                        }),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tapIndex == 1,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ditolak',
                                      style: txtPrimarySubTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: blackColor,
                                      ),
                                    ),
                                    Checkbox(
                                        value: filterIndex == 0
                                            ? (isPesananDitolak ?? true)
                                            : (isPesananDitolakReward ?? true),
                                        activeColor: primaryColor,
                                        onChanged: (newValue) {
                                          filterIndex == 0
                                              ? context.read<OrderBloc>().add(
                                              OrderEvent
                                                  .togglePesananDitolak(
                                                  newValue))
                                              : context.read<OrderBloc>().add(
                                              OrderEvent
                                                  .togglePesananDitolakReward(
                                                  newValue));
                                        }),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Periode Pesanan',
                                style: txtPrimaryTitle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: blackColor,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => filterIndex == 0
                                        ? _selectDate(context,
                                        isStartDate: true, filterIndex: 0)
                                        : _selectDate(context,
                                        isStartDate: true, filterIndex: 1),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color: grey, width: 1)),
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Mulai',
                                                style: txtSecondarySubTitle
                                                    .copyWith(
                                                    color: blackColor,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                filterIndex == 0
                                                    ? startDateText
                                                    : startDateTextReward,
                                                style:
                                                titleDateStyle.copyWith(
                                                    color: blackColor,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                            padding:
                                            EdgeInsets.only(left: 15),
                                            child: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.15,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        )),
                                  ),
                                  InkWell(
                                    onTap: () => filterIndex == 0
                                        ? _selectDate(context,
                                        isStartDate: false, filterIndex: 0)
                                        : _selectDate(context,
                                        isStartDate: false, filterIndex: 1),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          border: Border.all(
                                              color: grey, width: 1)),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Berakhir',
                                                style: txtSecondarySubTitle
                                                    .copyWith(
                                                    color: blackColor,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                filterIndex == 0 ?
                                                endDateText : endDateTextReward,
                                                style:
                                                titleDateStyle.copyWith(
                                                    color: blackColor,
                                                    fontWeight:
                                                    FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                          const Padding(
                                            padding:
                                            EdgeInsets.only(left: 15),
                                            child: Icon(
                                              Icons.calendar_month_outlined,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonButton(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width * 0.4,
                            borderColor: blackColor,
                            borderWidth: 1,
                            text: 'Reset',
                            onPressed: () {
                              if (filterIndex == 0) {
                                context.read<OrderBloc>().add(
                                    OrderEvent.resetFilters(filterIndex, query, '', '', ''));
                                Future.delayed(const Duration(milliseconds: 1500), () {
                                  if (mounted){
                                    context.pop();
                                  }
                                });
                              } else if (filterIndex == 1) {
                                context.read<OrderBloc>().add(
                                    OrderEvent.resetFilters(filterIndex, query, '', '', ''));
                                Future.delayed(const Duration(milliseconds: 1500), () {
                                  if (mounted){
                                    context.pop();
                                  }
                                });
                              }

                            },
                            backgroundColor: baseColor,
                            textColor: blackColor,
                            borderRadius: 30,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          CommonButton(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            width: MediaQuery.of(context).size.width * 0.4,
                            text: 'Terapkan',
                            onPressed: () {
                              if (filterIndex == 0) {
                                if (isPesananSelesai == false &&
                                    isPesananDibatalkan == false &&
                                    isPesananDitolak == false) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      'Harap pilih setidaknya satu status untuk filter!',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w500, color: baseColor),
                                    ),
                                    backgroundColor: redMedium,
                                  ));
                                } else {
                                  if (isPesananSelesai == true &&
                                      isPesananDibatalkan == true &&
                                      isPesananDitolak == true) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: ''));
                                  } else if (isPesananSelesai == true &&
                                      isPesananDibatalkan == false &&
                                      isPesananDitolak == false) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: 'pesanan selesai',
                                            startDate: startDateText,
                                            endDate: endDateText));
                                  } else if (isPesananSelesai == false &&
                                      isPesananDibatalkan == true &&
                                      isPesananDitolak == false) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: 'pesanan dibatalkan',
                                            startDate: startDateText,
                                            endDate: endDateText));
                                  } else if (isPesananSelesai == false &&
                                      isPesananDibatalkan == false &&
                                      isPesananDitolak == true) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: 'pesanan ditolak',
                                            startDate: startDateText,
                                            endDate: endDateText));
                                  } else if (isPesananSelesai == true &&
                                      isPesananDibatalkan == true &&
                                      isPesananDitolak == false) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: 'finished_canceled',
                                            startDate: startDateText,
                                            endDate: endDateText));
                                  } else if (isPesananSelesai == true &&
                                      isPesananDibatalkan == false &&
                                      isPesananDitolak == true) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: 'finished_rejected',
                                            startDate: startDateText,
                                            endDate: endDateText));
                                  } else if (isPesananSelesai == false &&
                                      isPesananDibatalkan == true &&
                                      isPesananDitolak == true) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: 'canceled_rejected',
                                            startDate: startDateText,
                                            endDate: endDateText));
                                  }
                                }
                              } else if (filterIndex == 1) {
                                if (isPesananSelesaiReward == false &&
                                    isPesananDitolakReward == false) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      'Harap pilih setidaknya satu status untuk filter!',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w500, color: baseColor),
                                    ),
                                    backgroundColor: redMedium,
                                  ));
                                } else {
                                  if (isPesananSelesaiReward == true &&
                                      isPesananDitolakReward == false) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: 'pesanan selesai',
                                            startDate: startDateTextReward,
                                            endDate: endDateTextReward));
                                  } else if (isPesananSelesaiReward == false &&
                                      isPesananDitolakReward == true) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: 'pesanan ditolak',
                                            startDate: startDateTextReward,
                                            endDate: endDateTextReward));
                                  } else if (isPesananSelesaiReward == true &&
                                      isPesananDitolakReward == true) {
                                    context.read<OrderBloc>().add(
                                        OrderEvent.doFilterOrder(
                                            filterIndex: filterIndex,
                                            query: query,
                                            statusOrder: '',
                                            startDate: startDateTextReward,
                                            endDate: endDateTextReward));
                                  }
                                }
                              }

                              Navigator.pop(context);
                            },

                            backgroundColor: primaryColor,
                            textColor: baseColor,
                            borderRadius: 30,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
            },
          ),
        );
      },
    );
  }
}