import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/home_page/widgets/shimmer_widget_home.dart';

import '../../../../../common/constant.dart';
import '../../../../../common/theme.dart';


class PoinSection extends StatelessWidget {

  const PoinSection({
    super.key, this.schedulePickUp,
  });

  final String? schedulePickUp;

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
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
        padding:
        const EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
        child: InkWell(
          onTap: () {
            context.pushNamed('point', extra: {''});
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
                          initial: () => ShimmerWidgetsHome.point(),
                          loading: () => ShimmerWidgetsHome.point(),
                          success: (model, user, index, pointModel, statusOutletModel, bannerModel, boxPromoModel) {
                            if (pointModel?.data != null){
                              final itemPoint = pointModel?.data?.point!;
                              return Text(
                                '$itemPoint Point',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500, color: blackColor),
                              );
                            } else {
                              return Text('0 Point',
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w500, color: blackColor),
                              );
                            }
                          },
                          error: (message) => ShimmerWidgetsHome.point()
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
                      'Redeem your points for exciting rewards',
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
