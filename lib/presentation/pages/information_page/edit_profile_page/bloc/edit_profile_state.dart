part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading({@Default(false) bool isPostEditProfile, CurrentUserModel? user, String? imagePath}) = _Loading;
  const factory EditProfileState.loaded({ CurrentUserModel? user, String? selectedOption, String? imagePath, EditProfileResponseModel? modelEdit}) = _Loaded;
  const factory EditProfileState.error(String message) = _Error;
}
