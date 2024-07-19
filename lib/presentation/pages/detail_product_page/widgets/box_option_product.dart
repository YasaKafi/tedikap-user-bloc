// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '../../../../../common/dimensions.dart';
// import '../../../../../common/theme.dart';
// import '../../../../../common/constant.dart';
// import 'option_row.dart';
//
// class BoxOptionProduct extends StatelessWidget {
//   const BoxOptionProduct({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Obx(() {
//           return Visibility(
//             visible: !controller.isSnackCategory.value,
//             child: Container(
//               padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
//               decoration: BoxDecoration(
//                 color: baseColor,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 children: [
//                   Obx(() {
//                     return OptionRow(
//                       label: 'Temperature',
//                       option1: 'Hot',
//                       option2: 'Ice',
//                       border1: controller.selectedTemp.value == 'ice'
//                           ? Border.all(color: grey, width: 1)
//                           : Border.all(color: Colors.transparent),
//                       border2: controller.selectedTemp.value == 'hot'
//                           ? Border.all(color: grey, width: 1)
//                           : Border.all(color: Colors.transparent),
//                       option1Style: controller.selectedTemp.value == 'ice'
//                           ? txtPrimarySubTitle.copyWith(
//                           fontWeight: FontWeight.w500, color: Colors.black38)
//                           : txtPrimarySubTitle.copyWith(
//                           fontWeight: FontWeight.w500, color: baseColor),
//                       option2Style: controller.selectedTemp.value == 'hot'
//                           ? txtPrimarySubTitle.copyWith(
//                           fontWeight: FontWeight.w500, color: Colors.black38)
//                           : txtPrimarySubTitle.copyWith(
//                           fontWeight: FontWeight.w500, color: baseColor),
//                       option1Color: controller.selectedTemp.value == 'ice'
//                           ? baseColor
//                           : navyColor,
//                       option2Color: controller.selectedTemp.value == 'hot'
//                           ? baseColor
//                           : navyColor,
//                       borderColor: grey,
//                       onTap1: controller.toggleTemp,
//                       onTap2: controller.toggleTemp,
//                     );
//                   }),
//                   SizedBox(height: 20),
//                   Obx(() {
//                     return OptionRow(
//                       label: 'Size',
//                       option1: 'Large',
//                       option2: 'Regular',
//                       border1: controller.selectedSize.value == 'regular'
//                           ? Border.all(color: grey, width: 1)
//                           : Border.all(color: Colors.transparent),
//                       border2: controller.selectedSize.value == 'large'
//                           ? Border.all(color: grey, width: 1)
//                           : Border.all(color: Colors.transparent),
//                       option1Style: controller.selectedSize.value == 'regular'
//                           ? txtPrimarySubTitle.copyWith(
//                           fontWeight: FontWeight.w500, color: Colors.black38)
//                           : txtPrimarySubTitle.copyWith(
//                           fontWeight: FontWeight.w500, color: baseColor),
//                       option2Style: controller.selectedSize.value == 'large'
//                           ? txtPrimarySubTitle.copyWith(
//                           fontWeight: FontWeight.w500, color: Colors.black38)
//                           : txtPrimarySubTitle.copyWith(
//                           fontWeight: FontWeight.w500, color: baseColor),
//                       option1Color: controller.selectedSize.value == 'regular'
//                           ? baseColor
//                           : navyColor,
//                       option2Color: controller.selectedSize.value == 'large'
//                           ? baseColor
//                           : navyColor,
//                       borderColor: grey,
//                       onTap1: controller.toggleSize,
//                       onTap2: controller.toggleSize,
//
//                     );
//                   }),
//                   SizedBox(height: 20),
//                   Obx(() {
//                     return Visibility(
//                       visible: !controller.isTempSelected.value,
//                       child: Obx(() {
//                         return OptionRow(
//                             label: 'Ice',
//                             option1: 'Less',
//                             option2: 'Normal',
//                             border1: controller.selectedIce.value == 'normal'
//                                 ? Border.all(color: grey, width: 1)
//                                 : Border.all(color: Colors.transparent),
//                             border2: controller.selectedIce.value == 'less'
//                                 ? Border.all(color: grey, width: 1)
//                                 : Border.all(color: Colors.transparent),
//                             option1Style: controller.selectedIce.value == 'normal'
//                                 ? txtPrimarySubTitle.copyWith(
//                                 fontWeight: FontWeight.w500, color: Colors.black38)
//                                 : txtPrimarySubTitle.copyWith(
//                                 fontWeight: FontWeight.w500, color: baseColor),
//                             option2Style: controller.selectedIce.value == 'less'
//                                 ? txtPrimarySubTitle.copyWith(
//                                 fontWeight: FontWeight.w500, color: Colors.black38)
//                                 : txtPrimarySubTitle.copyWith(
//                                 fontWeight: FontWeight.w500, color: baseColor),
//                             option1Color: controller.selectedIce.value == 'normal'
//                                 ? baseColor
//                                 : navyColor,
//                             option2Color: controller.selectedIce.value == 'less'
//                                 ? baseColor
//                                 : navyColor,
//                             borderColor: grey,
//                             onTap1: controller.toggleIce,
//                             onTap2: controller.toggleIce
//                         );
//                       }),
//                     );
//                   }),
//                   Obx(() {
//                     return Visibility(
//                         visible: !controller.isTempSelected.value,
//                         child: SizedBox(height: 20));
//                   }),
//                   Obx(() {
//                     return OptionRow(
//                         label: 'Sugar',
//                         option1: 'Less',
//                         option2: 'Normal',
//                         border1: controller.selectedSugar.value == 'normal'
//                             ? Border.all(color: grey, width: 1)
//                             : Border.all(color: Colors.transparent),
//                         border2: controller.selectedSugar.value == 'less'
//                             ? Border.all(color: grey, width: 1)
//                             : Border.all(color: Colors.transparent),
//                         option1Style: controller.selectedSugar.value == 'normal'
//                             ? txtPrimarySubTitle.copyWith(
//                             fontWeight: FontWeight.w500, color: Colors.black38)
//                             : txtPrimarySubTitle.copyWith(
//                             fontWeight: FontWeight.w500, color: baseColor),
//                         option2Style: controller.selectedSugar.value == 'less'
//                             ? txtPrimarySubTitle.copyWith(
//                             fontWeight: FontWeight.w500, color: Colors.black38)
//                             : txtPrimarySubTitle.copyWith(
//                             fontWeight: FontWeight.w500, color: baseColor),
//                         option1Color: controller.selectedSugar.value == 'normal'
//                             ? baseColor
//                             : navyColor,
//                         option2Color: controller.selectedSugar.value == 'less'
//                             ? baseColor
//                             : navyColor,
//                         borderColor: grey,
//                         onTap1: controller.toggleSugar,
//                         onTap2: controller.toggleSugar
//
//
//                     );
//                   }),
//                 ],
//               ),
//             ),
//           );
//         })
//       ],
//     );
//   }
// }
