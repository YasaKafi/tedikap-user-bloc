part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.started() = _Started;
  const factory EditProfileEvent.doEditProfile({BuildContext? context, String? name,
     String? email,
     String? gender,
    String? phoneNumber,
    File? imageFile,}) = _DoEditProfile;
  const factory EditProfileEvent.getUser() = _GetUser;
  const factory EditProfileEvent.changeOption(String? newValue) = _ChangeOption;
  const factory EditProfileEvent.changeImage() = _ChangeImage;

}
