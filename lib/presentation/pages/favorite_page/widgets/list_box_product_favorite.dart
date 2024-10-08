import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tedikap_user_bloc/presentation/pages/favorite_page/bloc/favorite_bloc.dart';

import '../../../../common/constant.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/theme.dart';
import '../../../../data/repository/tedikap_repository.dart';

class ListBoxProductFavorite extends StatelessWidget {
  const ListBoxProductFavorite({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.image,
    required this.title,
    required this.desc,
    required this.category,
    required this.price,
    required this.productId,
    required this.isLiked,
  });

  final double screenWidth;
  final double screenHeight;
  final String image;
  final String title;
  final String desc;
  final int price;
  final String category;
  final int productId;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: Dimensions.marginSizeLarge,
          right: Dimensions.marginSizeLarge,
          top: Dimensions.marginSizeLarge),
      height: screenHeight * 0.09,
      width: screenWidth,
      child: Row(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: Dimensions.marginSizeSmall),
                  width: 70,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: const Color(0x0C56473C),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    image: DecorationImage(
                      image: NetworkImage(TedikapApiRepository.getImage + image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: Dimensions.marginSizeLarge,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text(title,
                        style: txtPrimaryTitle.copyWith(
                            fontWeight: FontWeight.w500, color: blackColor))),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: txtSecondarySubTitle.copyWith(
                      fontWeight: FontWeight.w500, color: blackColor90),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              return Expanded(
                child: InkWell(
                  onTap: () {
                    context.read<FavoriteBloc>().add(
                      FavoriteEvent.postFavorite(productId),
                    );
                  },
                  child: Center(
                    child: isLiked
                        ? SvgPicture.asset(
                      icHeartActive,
                      width: 24,
                      height: 24,
                    )
                        : SvgPicture.asset(
                      icHeart,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
