import 'dart:io' as i;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/edit_profile_page/bloc/edit_profile_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../../data/repository/tedikap_repository.dart';
import '../widget/custom_textfield.dart';
import '../widget/dropdown_gender_input.dart';
import '../widget/editimage_button.dart';
import '../widget/save_button.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String gender = 'male';
  ValueNotifier<String> defaultImagePath = ValueNotifier<String>('');

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
                    onPressed: () {},
                  ),
                  Text(
                    'Edit Profile',
                    style: txtSecondaryHeader.copyWith(
                        fontWeight: FontWeight.w600, color: blackColor),
                  ),
                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Stack(
              children: [
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () => Center(child: CircularProgressIndicator()),
                      loaded: (user, o, imagePath, modelEdit) {
                        if (user?.data?.avatar == null && imagePath == null) {
                          return Center(child: Text('No image available'));
                        }
                        defaultImagePath.value = imagePath ?? user!.data!.avatar!;
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: imagePath != null
                              ? ClipOval(
                            child: Image.file(
                              i.File(imagePath),
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          )
                              : ClipOval(
                            child: Image.network(
                              TedikapApiRepository.getAvatarProfile +
                                  user!.data!.avatar!,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
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
                        EditProfileEvent.changeImage(),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(
                left: Dimensions.marginSizeLarge,
                right: Dimensions.marginSizeLarge,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocListener<EditProfileBloc, EditProfileState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        loaded: (user, n, o, modelEdit) {
                          usernameController.text = user?.data?.name ?? '';
                          emailController.text = user?.data?.email ?? '';
                          gender = user?.data?.gender ?? 'male';
                        },
                        orElse: () {},
                      );
                    },
                    child: Column(
                      children: [
                        BlocBuilder<EditProfileBloc, EditProfileState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => Center(child: CircularProgressIndicator()),
                              loading: () => Center(child: CircularProgressIndicator()),
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
                                      fontWeight: FontWeight.w600, color: blackColor),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 30),
                        BlocBuilder<EditProfileBloc, EditProfileState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => Center(child: CircularProgressIndicator()),
                              loading: () => Center(child: CircularProgressIndicator()),
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
                                      fontWeight: FontWeight.w600, color: blackColor),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  CustomDropDown(
                    gender: gender,
                    onChanged: (newValue) {
                      setState(() {
                        gender = newValue ?? 'male';
                      });
                    },
                  ),
                  SizedBox(height: 30),
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
                          if (modelEdit != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  modelEdit.message!,
                                  style: txtSecondaryTitle.copyWith(
                                      fontWeight: FontWeight.w600, color: blackColor),
                                ),
                                backgroundColor: greenMedium,
                              ),
                            );
                          }
                        },
                      );
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () => Container(
                          margin: EdgeInsets.only(top: Dimensions.marginSizeExtraLarge),
                          child: SaveButton(
                            onPressed: () {
                              if (usernameController.text.isNotEmpty &&
                                  emailController.text.isNotEmpty) {
                                context.read<EditProfileBloc>().add(
                                  EditProfileEvent.doEditProfile(
                                    name: usernameController.text,
                                    email: emailController.text,
                                    gender: gender,
                                    imageFile: defaultImagePath.value.isNotEmpty
                                        ? i.File(defaultImagePath.value)
                                        : null,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please fill in all fields',
                                      style: txtSecondaryTitle.copyWith(
                                          fontWeight: FontWeight.w600, color: blackColor),
                                    ),
                                    backgroundColor: redMedium,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        loading: () => Center(child: CircularProgressIndicator()),
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
}






