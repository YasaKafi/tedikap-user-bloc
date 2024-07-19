// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
//
// import '../../../../../common/dimensions.dart';
// import '../../../../../common/theme.dart';
// import '../controller/detail_product_controller.dart';
//
// class InputNotes extends GetView<DetailProductController> {
//   const InputNotes({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
//           decoration: BoxDecoration(
//             color: baseColor,
//             borderRadius: BorderRadius.circular(20),
//
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text('Notes', style: txtSecondaryTitle.copyWith(fontWeight: FontWeight.w600, color: blackColor)),
//                   SizedBox(width: 5,),
//                   Text('(Optional)', style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor)),
//                 ],
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: controller.noteController,
//                 style: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
//                 decoration: InputDecoration(
//                   hintText: 'Add notes here',
//                   hintStyle: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: blackColor),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                     borderSide: BorderSide(color: grey),
//                   ),
//                 ),
//               ),
//
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }