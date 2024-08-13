import 'dart:io' as i;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/data/models/response/current_user_response_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/edit_profile_page/bloc/edit_profile_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../../data/repository/tedikap_repository.dart';
import '../widget/custom_textfield.dart';
import '../widget/dropdown_gender_input.dart';
import '../widget/editimage_button.dart';
import '../widget/save_button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String gender = '';
  ValueNotifier<String> defaultImagePath = ValueNotifier<String>('');
  bool isFirstLoad = true;

  @override
  void initState() {
    super.initState();
    context.read<EditProfileBloc>().add(const EditProfileEvent.getUser());
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 10, right: 10),
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
                        context.goNamed('dashboard', pathParameters: {'pageIndex': '3'});
                      }
                    },
                  ),
                  Text(
                    'Edit Profile',
                    style: txtSecondaryHeader.copyWith(
                        fontWeight: FontWeight.w600, color: blackColor),
                  ),
                  Container(
                    width: 40,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              children: [
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => const Center(child: CircularProgressIndicator()),
                      loading: () => _buildShimmerProfile(),
                      loaded: (user, o, imagePath, modelEdit) {
                        if (isFirstLoad) {
                          // Initialize values only on first load
                          usernameController.text = user?.data?.name ?? '';
                          emailController.text = user?.data?.email ?? '';
                          gender = user?.data?.gender ?? '';
                          defaultImagePath.value = imagePath ?? user?.data?.avatar ?? '';
                          isFirstLoad = false;
                        }
                        if (imagePath != null) {
                          defaultImagePath.value = imagePath;
                        }
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          child: imagePath != null
                              ? ClipOval(
                            child: Image.file(
                              i.File(imagePath),
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          )
                              : user?.data?.avatar != null
                              ? ClipOval(
                            child: Image.network(
                              TedikapApiRepository.getAvatarProfile + user!.data!.avatar!,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          )
                              : const Center(child: Text('No image available')),
                        );
                      },
                    );
                  },
                ),
                Positioned(
                  right: 0,
                  top: 10,
                  child: EditImageButton(
                    onPressed: () {
                      context.read<EditProfileBloc>().add(
                        const EditProfileEvent.changeImage(),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.marginSizeLarge,
                right: Dimensions.marginSizeLarge,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => _buildShimmerTextField(),
                            loading: () => _buildShimmerTextField(),
                            loaded: (user, n, o, modelEdit) {
                              return CustomTextField(
                                hintText: 'Username',
                                keyboardType: TextInputType.text,
                                controller: usernameController,
                                maxTextLength: 12,
                              );
                            },
                            error: (message) => Center(
                              child: Text(
                                message,
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: blackColor),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            orElse: () => _buildShimmerTextField(),
                            loading: () => _buildShimmerTextField(),
                            loaded: (user, n, o, modelEdit) {
                              return CustomTextField(
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                              );
                            },
                            error: (message) => Center(
                              child: Text(
                                message,
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: blackColor),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomDropDown(
                    gender: gender,
                    onChanged: (newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  BlocConsumer<EditProfileBloc, EditProfileState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        orElse: () {},
                        error: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                message,
                                style: txtSecondaryTitle.copyWith(
                                    fontWeight: FontWeight.w600, color: blackColor),
                              ),
                              backgroundColor: redMedium,
                            ),
                          );
                        },
                        loaded: (user, o, n, modelEdit) {
                          if (modelEdit?.message == 'User updated successfully') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  modelEdit!.message!,
                                  style: txtSecondaryTitle.copyWith(
                                      fontWeight: FontWeight.w600, color: blackColor),
                                ),
                                backgroundColor: greenMedium,
                              ),
                            );
                            context.pushReplacementNamed('dashboard',
                                pathParameters: {'pageIndex': '3'});
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => const Center(child: CircularProgressIndicator()),
                        loaded: (user, o, imagePath, modelEdit) => Container(
                          margin: const EdgeInsets.only(top: Dimensions.marginSizeExtraLarge),
                          child: SaveButton(
                            onPressed: () {
                              if (usernameController.text.isNotEmpty &&
                                  emailController.text.isNotEmpty) {
                                String? updatedName = usernameController.text;
                                String? updatedEmail = emailController.text;
                                String? updatedGender = o;

                                File? fileToUpload;
                                if (defaultImagePath.value.isNotEmpty &&
                                    defaultImagePath.value.contains('/')) {
                                  fileToUpload = File(defaultImagePath.value);
                                }

                                context.read<EditProfileBloc>().add(
                                  EditProfileEvent.doEditProfile(
                                    name: updatedName,
                                    email: updatedEmail,
                                    gender: updatedGender,
                                    imageFile: fileToUpload,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please fill in all fields',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: blackColor),
                                    ),
                                    backgroundColor: redMedium,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        loading: () => Center(child: _buildShimmerTextField()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(String? imagePath, CurrentUserModel? user) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: imagePath != null
          ? ClipOval(
        child: Image.file(
          i.File(imagePath),
          width: 170,
          height: 170,
          fit: BoxFit.cover,
        ),
      )
          : user?.data?.avatar != null
          ? ClipOval(
        child: Image.network(
          TedikapApiRepository.getAvatarProfile + user!.data!.avatar!,
          width: 170,
          height: 170,
          fit: BoxFit.cover,
        ),
      )
          : const Center(child: Text('No image available')),
    );
  }

  Widget _buildShimmerProfile() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CircleAvatar(
        radius: 85,
        backgroundColor: Colors.white,
        child: Container(),
      ),
    );
  }

  Widget _buildShimmerTextField() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 50.0,
        color: Colors.white,
      ),
    );
  }
}



