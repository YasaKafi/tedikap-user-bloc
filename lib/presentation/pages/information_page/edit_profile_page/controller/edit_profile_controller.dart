//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:io' as i;
//
// import '../../../../../../api/auth/model/current_user_model.dart';
// import '../../../../../../api/auth/service/show_current_user_service.dart';
// import '../../../../../../api/user/profile_service.dart';
//
//
// class EditProfileController extends GetxController {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final ProfileServices profileServices = ProfileServices();
//   final RxString selectedOption = 'male'.obs;
//   final RxString imagePath = ''.obs;
//   RxBool isLoading = false.obs;
//
//   late CurrentUserService userService;
//   late ShowCurrentUserResponse userResponse;
//   Rx<DataUser?> dataUser = Rx<DataUser?>(null);
//
// @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     userService = CurrentUserService();
//
//     getCurrentUser();
//     checkSharedToken();
//   }
//   void changeOption(String newValue) {
//     selectedOption.value = newValue;
//     update();
//   }
//
//   void setImagePath(String path) {
//     imagePath.value = path;
//     update();
//   }
// Future<void> checkSharedToken() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   final token = prefs.getString('token');
//   print(' token : $token');
// }
//
//   void pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(
//       source: ImageSource.gallery,
//     );
//
//     if (pickedFile != null) {
//       setImagePath(pickedFile.path);
//     }
//   }
//
//   Future<void> editProfile() async {
//     try {
//       if (usernameController.text.isNotEmpty &&
//           emailController.text.isNotEmpty &&
//           selectedOption.isNotEmpty
//       ) {
//         final response = await profileServices.postProfile(
//           name: usernameController.text,
//           email: emailController.text,
//           gender: selectedOption.value.toString(),
//           imageFile: imagePath.value.isNotEmpty ? i.File(imagePath.value) : null,
//         );
//
//
//
//         if (response.statusCode == 200) {
//           Get.snackbar(
//             'Profile Updated',
//             'Your profile information has been successfully updated.',
//             snackPosition: SnackPosition.TOP,
//           );
//           Get.back();
//
//           print('Profile successfully updated.');
//
//         } else {
//           print('Failed to update profile. Status code: ${response.statusCode}');
//         }
//       } else {
//         print('Please fill in all required fields.');
//       }
//     } catch (e) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       print('Token: $token');
//       print('Error updating profile: $e');
//     }
//   }
//
//
//
//   Future<void> getCurrentUser() async {
//     try {
//       isLoading(true);
//       final response = await userService.showCurrentUser();
//
//       print("CHECK CURRENT RESPONSE");
//       print(response.data);
//
//       if (response.data != null) {
//         userResponse = ShowCurrentUserResponse.fromJson(response.data);
//         if (userResponse.data!.name != null) {
//           dataUser = userResponse.data!.obs;
//           usernameController.text = userResponse.data!.name!;
//           emailController.text = userResponse.data!.email!;
//           selectedOption.value = userResponse.data!.gender!;
//           print("User data fetched: ${userResponse.data!.name}");
//         } else {
//           print("User data is null");
//         }
//       } else {
//         print("Response data is null");
//       }
//     } catch (e) {
//       print('Error fetching user data: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
//
// }
