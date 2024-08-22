import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tedikap_user_bloc/data/models/response/edit_current_user_response_model.dart';

import 'package:image_picker/image_picker.dart';
import '../../../../../data/datasource/user_datasource.dart';
import '../../../../../data/models/response/current_user_response_model.dart';

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
            (r) => emit(_Loaded(user: r, selectedOption: r.data!.gender!, imagePath: null)),
      );
    });

    on<_DoEditProfile>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.updateCurrentUser(
        email: event.email,
        gender: event.gender,
        name: event.name,
        phoneNumber: event.phoneNumber,
        imageFile: event.imageFile,
      );
      await result.fold(
            (l) async => emit(_Error(l)),
            (r) async {
          final resultGetUser = await datasource.getCurrentUser();
          final getCurrentUser = resultGetUser.fold((l) => null, (success) => success);

          if (getCurrentUser != null) {
            emit(_Loaded(
              user: getCurrentUser,
              selectedOption: getCurrentUser.data!.gender!,
              imagePath: null,
              modelEdit: r,
            ));
          } else {
            emit(const _Error('Failed to get updated user data'));
          }
        },
      );
    });

    on<_ChangeOption>((event, emit) {
      if (state is _Loaded) {
        final currentState = state as _Loaded;
        emit(currentState.copyWith(selectedOption: event.newValue,));
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



