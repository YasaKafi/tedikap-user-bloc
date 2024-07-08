part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.loaded({ CurrentUserModel? user, String? selectedOption, String? imagePath}) = _Loaded;
  const factory EditProfileState.success({ EditProfileResponseModel? model}) = _Succeess;
  const factory EditProfileState.error(String message) = _Error;
}
