

// class NotificationFilter extends StatelessWidget {
//   final NotificationController controller = Get.put(NotificationController());
//
//   final List<String> options = [
//     'All', 'Promo', 'info', 'Order'
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//           () => ChipsChoice<int>.single(
//         value: controller.tag.value,
//         onChanged: (val) => controller.tag.value = val,
//         choiceItems: C2Choice.listFrom<int, String>(
//           source: options,
//           value: (i, v) => i,
//           label: (i, v) => v,
//         ),
//
//
//             choiceStyle: C2ChipStyle.outlined(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(25),
//               ),
//               foregroundStyle: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: Colors.black38),
//               color: Colors.black12,
//               avatarForegroundColor: Colors.black12,
//               borderStyle: BorderStyle.solid,
//               borderOpacity: 0.3,
//
//
//               selectedStyle: C2ChipStyle(
//                 checkmarkColor: primaryColor,
//                 checkmarkStyle: C2ChipCheckmarkStyle.round,
//                 foregroundStyle: txtPrimarySubTitle.copyWith(fontWeight: FontWeight.w500, color: primaryColor),
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(25),
//                 ),
//                 borderColor: primaryColor,
//                 borderWidth: 2,
//               ),
//             ),
//       ),
//     );
//   }
// }

