import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/models/response/cart_response_model.dart';
import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../../common/constant.dart';
import '../bloc/detail_product_bloc.dart';
import 'option_row.dart';

class BoxOptionProduct extends StatelessWidget {
  const BoxOptionProduct({super.key, });


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: BlocBuilder<DetailProductBloc, DetailProductState>(
            builder: (context, state) {
             return state.maybeWhen(
               orElse: (){
                 return buildLoadingShimmer(screenWidth);
               },
               success: (
                   modelProduct,
                   modelProductReward,
                   modelCartPost,
                   modelCartPostReward,
                   modelCartItem,
                   modelCartUpdate,
                   modelCartItemReward,
                   modelCartRewardUpdate,
                   modelPostFavorite,
                   modelFavorite,
                   isTempSelected,
                   selectedTemp,
                   isSizeSelected,
                   selectedSize,
                   isIceSelected,
                   selectedIce,
                   isSugarSelected,
                   selectedSugar,
                   qty,
                   totalPrice,
                   note,

                   ){


                 return Column(
                   children: [
                     BlocBuilder<DetailProductBloc, DetailProductState>(
                       builder: (context, state) {
                         return state.when(
                           initial: () => Center(
                             child: CircularProgressIndicator(),
                           ),
                           loading: () => Center(
                             child: CircularProgressIndicator(),
                           ),
                           success: (
                               modelProduct,
                               modelProductReward,
                               modelCartPost,
                               modelCartPostReward,
                               modelCartItem,
                               modelCartUpdate,
                               modelCartItemReward,
                               modelCartRewardUpdate,
                               modelPostFavorite,
                               modelFavorite,
                               isTempSelected,
                               selectedTemp,
                               isSizeSelected,
                               selectedSize,
                               isIceSelected,
                               selectedIce,
                               isSugarSelected,
                               selectedSugar,
                               qty,
                               totalPrice,
                               note,

                               ) {

                             return OptionRow(
                               label: 'Temperature',
                               option1: 'Hot',
                               option2: 'Ice',
                               border1: selectedTemp == 'ice'
                                   ? Border.all(color: grey, width: 1)
                                   : Border.all(color: Colors.transparent),
                               border2: selectedTemp == 'hot'
                                   ? Border.all(color: grey, width: 1)
                                   : Border.all(color: Colors.transparent),
                               option1Style: selectedTemp == 'ice'
                                   ? txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black38)
                                   : txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: baseColor),
                               option2Style: selectedTemp == 'hot'
                                   ? txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black38)
                                   : txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: baseColor),
                               option1Color:
                               selectedTemp == 'ice' ? baseColor : navyColor,
                               option2Color:
                               selectedTemp == 'hot' ? baseColor : navyColor,
                               borderColor: grey,
                               onTap1: () {
                                 context
                                     .read<DetailProductBloc>()
                                     .add(DetailProductEvent.toggleTemp());
                               },
                               onTap2: () {
                                 context
                                     .read<DetailProductBloc>()
                                     .add(DetailProductEvent.toggleTemp());
                               },
                             );
                           },
                           error: (message) => Center(
                             child: Text(message!),
                           ),
                         );
                       },
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     BlocBuilder<DetailProductBloc, DetailProductState>(
                       builder: (context, state) {
                         return state.when(
                           initial: () => Center(
                             child: CircularProgressIndicator(),
                           ),
                           loading: () => Center(
                             child: CircularProgressIndicator(),
                           ),
                           success: (
                               modelProduct,
                               modelProductReward,
                               modelCartPost,
                               modelCartPostReward,
                               modelCartItem,
                               modelCartUpdate,
                               modelCartItemReward,
                               modelCartRewardUpdate,
                               modelPostFavorite,
                               modelFavorite,
                               isTempSelected,
                               selectedTemp,
                               isSizeSelected,
                               selectedSize,
                               isIceSelected,
                               selectedIce,
                               isSugarSelected,
                               selectedSugar,
                               qty,
                               totalPrice,
                               note,

                               ) {
                             return OptionRow(
                               label: 'Size',
                               option1: 'Large',
                               option2: 'Regular',
                               border1: selectedSize == 'regular'
                                   ? Border.all(color: grey, width: 1)
                                   : Border.all(color: Colors.transparent),
                               border2: selectedSize == 'large'
                                   ? Border.all(color: grey, width: 1)
                                   : Border.all(color: Colors.transparent),
                               option1Style: selectedSize == 'regular'
                                   ? txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black38)
                                   : txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: baseColor),
                               option2Style: selectedSize == 'large'
                                   ? txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black38)
                                   : txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: baseColor),
                               option1Color: selectedSize == 'regular'
                                   ? baseColor
                                   : navyColor,
                               option2Color:
                               selectedSize == 'large' ? baseColor : navyColor,
                               borderColor: grey,
                               onTap1: () {
                                 context
                                     .read<DetailProductBloc>()
                                     .add(DetailProductEvent.toggleSize());
                               },
                               onTap2: () {
                                 context
                                     .read<DetailProductBloc>()
                                     .add(DetailProductEvent.toggleSize());
                               },
                             );
                           },
                           error: (message) => Center(
                             child: Text(message!),
                           ),
                         );
                       },
                     ),
                     Visibility(
                       visible: selectedTemp == 'hot' ? false : true,
                       child: SizedBox(
                         height: 20,
                       ),
                     ),
                     Visibility(
                       visible: selectedTemp == 'hot' ? false : true,
                       child: BlocBuilder<DetailProductBloc, DetailProductState>(
                         builder: (context, state) {
                           return state.when(
                             initial: () => Center(
                               child: CircularProgressIndicator(),
                             ),
                             loading: () => Center(
                               child: CircularProgressIndicator(),
                             ),
                             success: (
                                 modelProduct,
                                 modelProductReward,
                                 modelCartPost,
                                 modelCartPostReward,
                                 modelCartItem,
                                 modelCartUpdate,
                                 modelCartItemReward,
                                 modelCartRewardUpdate,
                                 modelPostFavorite,
                                 modelFavorite,
                                 isTempSelected,
                                 selectedTemp,
                                 isSizeSelected,
                                 selectedSize,
                                 isIceSelected,
                                 selectedIce,
                                 isSugarSelected,
                                 selectedSugar,
                                 qty,
                                 totalPrice,
                                 note,

                                 ) {
                               return OptionRow(
                                 label: 'Ice',
                                 option1: 'Less',
                                 option2: 'Normal',
                                 border1: selectedIce == 'normal'
                                     ? Border.all(color: grey, width: 1)
                                     : Border.all(color: Colors.transparent),
                                 border2: selectedIce == 'less'
                                     ? Border.all(color: grey, width: 1)
                                     : Border.all(color: Colors.transparent),
                                 option1Style: selectedIce == 'normal'
                                     ? txtPrimarySubTitle.copyWith(
                                     fontWeight: FontWeight.w500,
                                     color: Colors.black38)
                                     : txtPrimarySubTitle.copyWith(
                                     fontWeight: FontWeight.w500,
                                     color: baseColor),
                                 option2Style: selectedIce == 'less'
                                     ? txtPrimarySubTitle.copyWith(
                                     fontWeight: FontWeight.w500,
                                     color: Colors.black38)
                                     : txtPrimarySubTitle.copyWith(
                                     fontWeight: FontWeight.w500,
                                     color: baseColor),
                                 option1Color:
                                 selectedIce == 'normal' ? baseColor : navyColor,
                                 option2Color:
                                 selectedIce == 'less' ? baseColor : navyColor,
                                 borderColor: grey,
                                 onTap1: () {
                                   context
                                       .read<DetailProductBloc>()
                                       .add(DetailProductEvent.toggleIce());
                                 },
                                 onTap2: () {
                                   context
                                       .read<DetailProductBloc>()
                                       .add(DetailProductEvent.toggleIce());
                                 },
                               );
                             },
                             error: (message) => Center(
                               child: Text(message!),
                             ),
                           );
                         },
                       ),
                     ),
                     SizedBox(
                       height: 20,
                     ),
                     BlocBuilder<DetailProductBloc, DetailProductState>(
                       builder: (context, state) {
                         return state.when(
                           initial: () => Center(
                             child: CircularProgressIndicator(),
                           ),
                           loading: () => Center(
                             child: CircularProgressIndicator(),
                           ),
                           success: (
                               modelProduct,
                               modelProductReward,
                               modelCartPost,
                               modelCartPostReward,
                               modelCartItem,
                               modelCartUpdate,
                               modelCartItemReward,
                               modelCartRewardUpdate,
                               modelPostFavorite,
                               modelFavorite,
                               isTempSelected,
                               selectedTemp,
                               isSizeSelected,
                               selectedSize,
                               isIceSelected,
                               selectedIce,
                               isSugarSelected,
                               selectedSugar,
                               qty,
                               totalPrice,
                               note,

                               ) {
                             return OptionRow(
                               label: 'Sugar',
                               option1: 'Less',
                               option2: 'Normal',
                               border1: selectedSugar == 'normal'
                                   ? Border.all(color: grey, width: 1)
                                   : Border.all(color: Colors.transparent),
                               border2: selectedSugar == 'less'
                                   ? Border.all(color: grey, width: 1)
                                   : Border.all(color: Colors.transparent),
                               option1Style: selectedSugar == 'normal'
                                   ? txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black38)
                                   : txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: baseColor),
                               option2Style: selectedSugar == 'less'
                                   ? txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black38)
                                   : txtPrimarySubTitle.copyWith(
                                   fontWeight: FontWeight.w500,
                                   color: baseColor),
                               option1Color: selectedSugar == 'normal'
                                   ? baseColor
                                   : navyColor,
                               option2Color:
                               selectedSugar == 'less' ? baseColor : navyColor,
                               borderColor: grey,
                               onTap1: () {
                                 context
                                     .read<DetailProductBloc>()
                                     .add(DetailProductEvent.toggleSugar());
                               },
                               onTap2: () {
                                 context
                                     .read<DetailProductBloc>()
                                     .add(DetailProductEvent.toggleSugar());
                               },
                             );
                           },
                           error: (message) => Center(
                             child: Text(message!),
                           ),
                         );
                       },
                     ),
                   ],
                 );
               }
             );
            },
          ),
        ),
      ],
    );
  }
  Widget buildLoadingShimmer(double screenWidth) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth * 0.3,
                height: 20.0,
                color: Colors.white,
              ),
              Container(
                width: screenWidth * 0.2,
                height: 20.0,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Container(
            width: screenWidth * 0.8,
            height: 40.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
