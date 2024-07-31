import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/presentation/global_components/common_button.dart';
import 'package:tedikap_user_bloc/presentation/pages/detail_order_page/bloc/detail_order_bloc.dart';

import '../../../../common/dimensions.dart';

import 'dart:async';

import 'package:intl/intl.dart';


class SectionButton extends StatefulWidget {
  const SectionButton({super.key});

  @override
  _SectionButtonState createState() => _SectionButtonState();
}

class _SectionButtonState extends State<SectionButton> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer(DateTime createdAt) {
    final endTime = createdAt.add(Duration(minutes: 1));
    _remainingTime = endTime.difference(DateTime.now());

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        final now = DateTime.now();
        if (now.isBefore(endTime)) {
          _remainingTime = endTime.difference(now);
        } else {
          _remainingTime = Duration.zero;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<DetailOrderBloc, DetailOrderState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => Center(child: CircularProgressIndicator()),
          success: (model, modelReward) {
            if (model != null) {
              final createdAt = model.order!.createdAt!;
              if (_remainingTime == Duration.zero && (_timer == null || !_timer!.isActive)) {
                startTimer(createdAt);
              }
              final minutes = _remainingTime.inMinutes.remainder(60);
              final seconds = _remainingTime.inSeconds.remainder(60);
              final timerText = 'Lanjutkan Pembayaran ($minutes:${seconds.toString().padLeft(2, '0')})';

              return Container(
                width: screenWidth,
                padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: CommonButton(
                    width: screenWidth,
                    text: timerText,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    textColor: baseColor,
                    backgroundColor: navyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    borderRadius: 15,
                  ),
                ),
              );
            } else {
              return Center();
            }
          },
        );
      },
    );
  }
}


