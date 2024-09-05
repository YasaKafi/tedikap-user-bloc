import 'dart:io' as i;
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tedikap_user_bloc/common/constant.dart';
import 'package:tedikap_user_bloc/data/models/response/current_user_response_model.dart';
import 'package:tedikap_user_bloc/presentation/pages/cart_page/bloc/cart_bloc.dart';
import 'package:tedikap_user_bloc/presentation/pages/information_page/edit_profile_page/bloc/edit_profile_bloc.dart';

import '../../../../../common/dimensions.dart';
import '../../../../../common/theme.dart';
import '../../../../../data/repository/tedikap_repository.dart';
import '../widget/custom_textfield.dart';
import '../widget/editimage_button.dart';
import '../widget/save_button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage(
      {super.key, required this.isFromProfile, required this.isFromCart});

  final bool isFromProfile;
  final bool isFromCart;

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String gender = '';
  bool isFirstLoad = true;
  bool isSnackBarShown = false;
  ValueNotifier<String> defaultImagePath = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    _clearControllers();
    context.read<EditProfileBloc>().add(const EditProfileEvent.getUser());
  }

  void _clearControllers() {
    usernameController.clear();
    emailController.clear();
    phoneNumberController.clear();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('VALUE BOOL DARI IS SNACKBARSHOWN $isSnackBarShown');
    print('VALUE BOOL DARI IS FROM CART ${widget.isFromCart}');
    print('VALUE BOOL DARI IS FROM PROFILE ${widget.isFromProfile}');
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        print('onPopInvoked didPop? $didPop');
        if (didPop == false) {
          context.goNamed('dashboard', pathParameters: {'pageIndex': '3'});
        }
      },
      child: Scaffold(
        backgroundColor: baseColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 10, left: 10, right: 10),
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
                          context.goNamed('dashboard',
                              pathParameters: {'pageIndex': '3'});
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
                    buildWhen: (previous, current) => true,
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () =>
                            const Center(child: CircularProgressIndicator()),
                        loading: (isPostEditProfile, modelUser, imagePath) {
                          if (isPostEditProfile == true) {
                            if (modelUser != null || imagePath != null) {
                              return buildContainerAvatar(imagePath, modelUser);
                            }
                          }
                          return _buildShimmerProfile();
                        },
                        loaded: (user, o, imagePath, modelEdit) {
                          if (imagePath != null) {
                            defaultImagePath.value = imagePath;
                            if (!isSnackBarShown) {
                              print(
                                  'VALUE BOOL DARI IS SNACKBARSHOWN DI DALAM IF ${!isSnackBarShown}');
                              final file = i.File(imagePath);
                              final fileSizeInBytes = file.lengthSync();
                              var fileSizeInMB = fileSizeInBytes / (1024 * 1024);
                              print('VALUE DARI IMAGE MB $fileSizeInMB');
                              // Cek apakah ukuran file melebihi 2MB
                              if (fileSizeInMB > 2) {
                                // Tampilkan Snackbar hanya jika belum pernah ditampilkan
                                SchedulerBinding.instance
                                    .addPostFrameCallback((_) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'Ukuran file gambar melebihi 2MB. Silakan pilih file lain',
                                      style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: baseColor,
                                      ),
                                    ),
                                    backgroundColor: redMedium,
                                  ));
                                });
                                isSnackBarShown = false;
                                return Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle),
                                    child: ClipOval(
                                      child: Image.network(
                                        TedikapApiRepository.getAvatarProfile +
                                            user!.data!.avatar!,
                                        width: 170,
                                        height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                    ));
                              }
                            }
                          }
                          return buildContainerAvatar(imagePath, user);
                        },
                      );
                    },
                  ),
                  Positioned(
                    right: 0,
                    top: 10,
                    child: EditImageButton(
                      disableChange: widget.isFromCart,
                      onPressed: () {
                        widget.isFromCart == true
                            ? null
                            : context.read<EditProfileBloc>().add(
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
                              loading: (isPostEditProfile, modelUser, imagePath) {
                                if (isPostEditProfile) {
                                  return buildCustomTextFieldUsername();
                                }

                                return _buildShimmerTextField();
                              },
                              loaded: (user, n, imagePath, modelEdit) {
                                if (isFirstLoad && user?.data != null) {
                                  // Initialize values only on first load
                                  usernameController.text =
                                      user?.data?.name ?? '';
                                  emailController.text = user?.data?.email ?? '';
                                  phoneNumberController.text =
                                      user?.data?.whatsappNumber ?? '';
                                  gender = user?.data?.gender ?? '';
                                  defaultImagePath.value =
                                      imagePath ?? user?.data?.avatar ?? '';
                                  isFirstLoad = false;
                                }

                                return buildCustomTextFieldUsername();
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
                        const SizedBox(height: 20),
                        BlocBuilder<EditProfileBloc, EditProfileState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => _buildShimmerTextField(),
                              loading: (isPostEditProfile, modelUser, imagePath) {
                                if (isPostEditProfile) {
                                  return buildCustomTextFieldEmail();
                                }
                                return _buildShimmerTextField();
                              },
                              loaded: (user, n, o, modelEdit) {
                                return buildCustomTextFieldEmail();
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
                              loading: (isPostEditProfile, modelUser, imagePath) {
                                if (isPostEditProfile) {
                                  return buildCustomTextFieldWhatsApp(context);
                                }
                                return _buildShimmerTextField();
                              },
                              loaded: (user, n, o, modelEdit) {
                                return buildCustomTextFieldWhatsApp(context);
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
                                      fontWeight: FontWeight.w600,
                                      color: blackColor),
                                ),
                                backgroundColor: redMedium,
                              ),
                            );
                          },
                          loaded: (user, o, n, modelEdit) {
                            if (modelEdit?.message ==
                                'User updated successfully') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    modelEdit!.message!,
                                    style: txtSecondaryTitle.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: blackColor),
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
                          orElse: () =>
                              const Center(child: CircularProgressIndicator()),
                          loaded: (user, o, imagePath, modelEdit) => Container(
                            margin: const EdgeInsets.only(
                                top: Dimensions.marginSizeExtraLarge,
                                bottom: Dimensions.marginSizeExtraLarge),
                            child: SaveButton(
                              onPressed: () {
                                if (usernameController.text.isNotEmpty ||
                                    emailController.text.isNotEmpty ||
                                    phoneNumberController.text.isNotEmpty) {
                                  String? updatedName = usernameController.text;
                                  String? updatedEmail = emailController.text;
                                  String? updatedPhoneNumber =
                                      phoneNumberController.text;
                                  String? updatedGender = o;

                                  File? fileToUpload;
                                  if (defaultImagePath.value.isNotEmpty &&
                                      defaultImagePath.value.contains('/')) {
                                    fileToUpload = File(defaultImagePath.value);
                                  }

                                  context.read<EditProfileBloc>().add(
                                        EditProfileEvent.doEditProfile(
                                          context: context,
                                          name: updatedName,
                                          email: updatedEmail,
                                          gender: updatedGender,
                                          phoneNumber: updatedPhoneNumber,
                                          imageFile: fileToUpload,
                                        ),
                                      );
                                  // context.read<CartBloc>().add(
                                  //       const CartEvent.refreshState(),
                                  //     );
                                }
                              },
                            ),
                          ),
                          loading: (isPostEditProfile, modelUser, imagePath) =>
                              isPostEditProfile
                                  ? Container(
                                      margin: const EdgeInsets.only(
                                          top: Dimensions.marginSizeExtraLarge,
                                          bottom:
                                              Dimensions.marginSizeExtraLarge),
                                      child: SaveButton(
                                        onPressed: () {},
                                        widget: LoadingAnimationWidget
                                            .staggeredDotsWave(
                                          color: baseColor,
                                          size: 30,
                                        ),
                                      ))
                                  : Center(child: _buildShimmerTextField()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomTextField buildCustomTextFieldEmail() {
    return CustomTextField(
      icon: Icon(Icons.email),
      hintText: 'Email',
      labelText: 'Email',
      readOnly: true,
      enableBorder: false,
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
    );
  }

  CustomTextField buildCustomTextFieldWhatsApp(BuildContext context) {
    return CustomTextField(
      icon: SvgPicture.asset(
        icWhatsApp,
        width: 26,
      ),
      hintText: '895xxx',
      labelText: 'WhatsApp Number',
      prefix: Text('+62 ',
          style: txtPrimarySubTitle.copyWith(
              fontWeight: FontWeight.w500, color: blackColor)),
      keyboardType: TextInputType.phone,
      controller: phoneNumberController,
      inputFormatters: [
        LengthLimitingTextInputFormatter(12),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        if (value.startsWith('0')) {
          phoneNumberController.text =
              value.substring(1); // Hapus '0' dari awal
          phoneNumberController.selection = TextSelection.fromPosition(
            TextPosition(offset: phoneNumberController.text.length),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Nomor sudah diformat untuk Indonesia, tidak perlu diawali dengan "0".',
                style: txtSecondaryTitle.copyWith(
                    fontWeight: FontWeight.w600, color: blackColor),
              ),
              backgroundColor: redMedium,
            ),
          );
        }
      },
    );
  }

  CustomTextField buildCustomTextFieldUsername() {
    return CustomTextField(
      icon: Icon(Icons.person),
      hintText: 'Username',
      labelText: 'Username',
      readOnly: widget.isFromCart == true ? true : false,
      keyboardType: TextInputType.text,
      enableBorder: widget.isFromCart == true ? false : true,
      controller: usernameController,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
      maxTextLength: 12,
    );
  }

  Container buildContainerAvatar(String? imagePath, CurrentUserModel? user) {
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
              ? Stack(
                  children: [
                    ClipOval(
                      child: Image.network(
                        TedikapApiRepository.getAvatarProfile +
                            user!.data!.avatar!,
                        width: 170,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: widget.isFromProfile == true
                              ? null
                              : grey.withOpacity(0.7),
                          borderRadius: BorderRadius.all(Radius.circular(170)),
                        ),
                      ),
                    ),
                  ],
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
