import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:tedikap_user_bloc/presentation/global_components/error_state.dart';
import 'package:tedikap_user_bloc/presentation/pages/notification_page/bloc/notification_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/notification_page/widgets/notification_shimer.dart';

import '../../../common/constant.dart';
import '../../../common/dimensions.dart';
import '../../../common/theme.dart';
import '../../global_components/common_button.dart';
import 'widgets/notification_box.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key, this.message});

  final RemoteMessage? message;

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getNotification());
  }

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('d MMMM yyyy • HH.mm').format(date);
    return formattedDate;
  }

  Future<void> _selectDate(BuildContext context,
      {required bool isStartDate}) async {
    DateTime initialDate = isStartDate
        ? DateTime.now().subtract(const Duration(days: 365))
        : DateTime.now();
    DateTime firstDate = DateTime(2000);
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
        context
            .read<NotificationBloc>()
            .add(NotificationEvent.setStartDate(picked));
      } else {
        context
            .read<NotificationBloc>()
            .add(NotificationEvent.setEndDate(picked));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double dpi = MediaQuery.of(context).devicePixelRatio * 160;
    TextStyle textDateStyle = dpi < 380 ? txtSecondarySubTitle : txtPrimarySubTitle;

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            color: baseColor,
          ),
          padding:
              const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    context.pop();
                  } else {
                    context.goNamed('dashboard',
                        pathParameters: {'pageIndex': '0'});
                  }
                },
              ),
              Text(
                'Notification',
                style: txtSecondaryHeader.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              InkWell(
                  onTap: () {
                    _showFilterNotification(context, textDateStyle);
                  },
                  child: const Icon(
                    Icons.filter_list,
                    size: 26,
                    color: primaryColor,
                  )),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: Dimensions.paddingSizeLarge),
              const SizedBox(height: Dimensions.paddingSizeLarge),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge),
                child: Column(
                  children: [
                    BlocBuilder<NotificationBloc, NotificationState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () {
                            return const NotificationShimmer();
                          },
                          loading: () {
                            return const NotificationShimmer();
                          },
                          success:
                              (model, isInfo, isVoucher, startDate, endDate) {
                            if (model?.data != null) {
                              print('LENGHT DATA NOTIFIKASI : ${model!.data!
                                  .length}');
                              if (model.data!.isEmpty) {
                                return SizedBox(
                                  width: screenWidth,
                                  height: screenHeight * 0.7,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(icNotificationEmpty,
                                            width: screenWidth * 0.5),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                          width: screenWidth * 0.8,
                                          child: Column(
                                            children: [
                                              Text(
                                                'No notification yet',
                                                style: txtPrimaryTitle.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: blackColor,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                'You have not have notifications right now \n Come back later',
                                                style: txtSecondarySubTitle.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: blackColor,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return ListView.builder(
                                itemCount: model.data!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final notificationData = model.data![index];
                                  return BoxNotification(
                                    onTap: () {},
                                    color: primaryColor,
                                    title: notificationData.title ?? '',
                                    description: notificationData.body ?? '',
                                    time: formatDate(
                                        notificationData.createdAt.toString()),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          },
                          error: (message) {
                            return ErrorWidgetStatic.buildErrorState(context, message!);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilterNotification(BuildContext context, TextStyle textDateStyle) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                padding: const EdgeInsets.all(20.0),
                child: BlocBuilder<NotificationBloc, NotificationState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                        orElse: () {
                      return const SizedBox();
                    }, success: (model, isInfo, isVoucher, startDate, endDate) {
                      print('INI BOOL IS INFO  $isInfo');
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

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tipe Notifikasi',
                            style: txtPrimaryTitle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Informasi',
                                style: txtPrimarySubTitle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ),
                              Checkbox(
                                  value: isInfo,
                                  activeColor: primaryColor,
                                  onChanged: (newValue) {
                                    context.read<NotificationBloc>().add(
                                        NotificationEvent.toggleInfo(
                                            newValue, newValue));
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Voucher',
                                style: txtPrimarySubTitle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: blackColor,
                                ),
                              ),
                              Checkbox(
                                  value: isVoucher,
                                  activeColor: primaryColor,
                                  onChanged: (newValue) {
                                    context.read<NotificationBloc>().add(
                                        NotificationEvent.toggleVoucher(
                                            newValue, newValue));
                                  }),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Periode Notifikasi',
                            style: txtPrimaryTitle.copyWith(
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () =>
                                    _selectDate(context, isStartDate: true),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: grey, width: 1)),
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Mulai',
                                            style:
                                                txtSecondarySubTitle.copyWith(
                                                    color: blackColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            startDateText,
                                            style: textDateStyle.copyWith(
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                              InkWell(
                                onTap: () =>
                                    _selectDate(context, isStartDate: false),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: grey, width: 1)),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Berakhir',
                                            style:
                                                txtSecondarySubTitle.copyWith(
                                                    color: blackColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            endDateText,
                                            style: textDateStyle.copyWith(
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
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
                          const SizedBox(
                            height: 45,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonButton(
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                width: MediaQuery.of(context).size.width * 0.4,
                                borderColor: blackColor,
                                borderWidth: 1,
                                text: 'Reset',
                                onPressed: () {
                                  context.read<NotificationBloc>().add(const NotificationEvent.resetFilters());
                                  Future.delayed(const Duration(seconds: 2), (){
                                    context.pop();
                                  });
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
                                  if (isInfo == false && isVoucher == false) {
                                    context.read<NotificationBloc>().add(
                                        NotificationEvent.getFilterNotification(
                                            'null',
                                            startDateText,
                                            endDateText));
                                  } else if (isInfo == true &&
                                      isVoucher == false) {
                                    context.read<NotificationBloc>().add(
                                        NotificationEvent.getFilterNotification(
                                            'common',
                                            startDateText,
                                            endDateText));
                                  } else if (isInfo == false &&
                                      isVoucher == true) {
                                    context.read<NotificationBloc>().add(
                                        NotificationEvent.getFilterNotification(
                                            'voucher',
                                            startDateText,
                                            endDateText));
                                  } else if (isInfo == true &&
                                      isVoucher == true) {
                                    context.read<NotificationBloc>().add(
                                        const NotificationEvent
                                            .getNotification());
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
                        ],
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
