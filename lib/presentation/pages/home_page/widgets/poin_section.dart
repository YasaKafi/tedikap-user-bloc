import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';


class PoinSection extends StatelessWidget {

  const PoinSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: baseColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(
                    0, 4),
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(12))),
        margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
        padding:
        const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
        child: InkWell(
          onTap: () {
            context.pushNamed('point');
          },
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    icLogoPrimary,
                    width: 44,
                    height: 44,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return state.when(
                          initial: () => ShimmerUserHome(),
                          loading: () => ShimmerUserHome(),
                          success: (model, user, index, pointModel) {
                            final point = pointModel?.data;
                            if (point != null && point.isNotEmpty){
                              final itemPoint = point.first.point;
                              return Text(
                                '$itemPoint Poin',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500, color: blackColor),
                              );
                            } else {
                              return Text('0 Poin',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500, color: blackColor),
                              );
                            }
                          },
                          error: (message) {
                            return Text(message!);
                          }
                      );
                    },
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Divider(
                  color: grey,
                  height: 2,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Tukarkan poinmu dengan hadiah menarik',
                      style: txtSecondarySubTitle.copyWith(
                          fontWeight: FontWeight.w500, color: blackColor),
                    ),
                  ),
                  SvgPicture.asset(
                    icArrowRight,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class ShimmerUserHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 16,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}