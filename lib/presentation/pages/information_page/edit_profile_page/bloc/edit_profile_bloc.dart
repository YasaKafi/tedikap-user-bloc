import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/edit_current_user_response_model.dart';

import 'package:image_picker/image_picker.dart';
import '../../../../../data/datasource/user_datasource.dart';
import '../../../../../data/models/response/current_user_response_model.dart';
import '../../../profile_page/bloc/profile_bloc.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';
part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final UserDatasource datasource;

  EditProfileBloc(this.datasource) : super(const EditProfileState.initial()) {
    on<_GetUser>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getCurrentUser();
      result.fold(
        (l) => emit(const _Error('Failed to get data user')),
        (r) => emit(
            _Loaded(user: r, selectedOption: r.data!.gender!, imagePath: null)),
      );
    });


    on<_DoEditProfile>((event, emit) async {
      final currentState = state;
      if (currentState is _Loaded) {
        emit( _Loading(
          user: currentState.user,
            imagePath: currentState.imagePath,
            isPostEditProfile: true
        ));
      }

      final result = await datasource.updateCurrentUser(
        email: event.email,
        gender: event.gender,
        name: event.name,
        phoneNumber: event.phoneNumber ?? '',
        imageFile: event.imageFile,
      );
       result.fold(
            (l)  => emit(_Error(l)),
            (r)   => emit(_Loaded(modelEdit: r)

      ));
    });

    on<_ChangeOption>((event, emit) {
      if (state is _Loaded) {
        final currentState = state as _Loaded;
        emit(currentState.copyWith(
          selectedOption: event.newValue,
        ));
      }
    });

    on<_ChangeImage>((event, emit) async {
      if (state is _Loaded) {
        final currentState = state as _Loaded;
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        print(pickedFile!.path);
        emit(currentState.copyWith(imagePath: pickedFile.path));
      }
    });
  }
}
