// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String? name, String? email, String? gender, File? imageFile)
        doEditProfile,
    required TResult Function() getUser,
    required TResult Function(String? newValue) changeOption,
    required TResult Function() changeImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult? Function()? getUser,
    TResult? Function(String? newValue)? changeOption,
    TResult? Function()? changeImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult Function()? getUser,
    TResult Function(String? newValue)? changeOption,
    TResult Function()? changeImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DoEditProfile value) doEditProfile,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeOption value) changeOption,
    required TResult Function(_ChangeImage value) changeImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DoEditProfile value)? doEditProfile,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeOption value)? changeOption,
    TResult? Function(_ChangeImage value)? changeImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DoEditProfile value)? doEditProfile,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeOption value)? changeOption,
    TResult Function(_ChangeImage value)? changeImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileEventCopyWith<$Res> {
  factory $EditProfileEventCopyWith(
          EditProfileEvent value, $Res Function(EditProfileEvent) then) =
      _$EditProfileEventCopyWithImpl<$Res, EditProfileEvent>;
}

/// @nodoc
class _$EditProfileEventCopyWithImpl<$Res, $Val extends EditProfileEvent>
    implements $EditProfileEventCopyWith<$Res> {
  _$EditProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'EditProfileEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String? name, String? email, String? gender, File? imageFile)
        doEditProfile,
    required TResult Function() getUser,
    required TResult Function(String? newValue) changeOption,
    required TResult Function() changeImage,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult? Function()? getUser,
    TResult? Function(String? newValue)? changeOption,
    TResult? Function()? changeImage,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult Function()? getUser,
    TResult Function(String? newValue)? changeOption,
    TResult Function()? changeImage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DoEditProfile value) doEditProfile,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeOption value) changeOption,
    required TResult Function(_ChangeImage value) changeImage,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DoEditProfile value)? doEditProfile,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeOption value)? changeOption,
    TResult? Function(_ChangeImage value)? changeImage,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DoEditProfile value)? doEditProfile,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeOption value)? changeOption,
    TResult Function(_ChangeImage value)? changeImage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements EditProfileEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$DoEditProfileImplCopyWith<$Res> {
  factory _$$DoEditProfileImplCopyWith(
          _$DoEditProfileImpl value, $Res Function(_$DoEditProfileImpl) then) =
      __$$DoEditProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? name, String? email, String? gender, File? imageFile});
}

/// @nodoc
class __$$DoEditProfileImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$DoEditProfileImpl>
    implements _$$DoEditProfileImplCopyWith<$Res> {
  __$$DoEditProfileImplCopyWithImpl(
      _$DoEditProfileImpl _value, $Res Function(_$DoEditProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? gender = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_$DoEditProfileImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$DoEditProfileImpl implements _DoEditProfile {
  const _$DoEditProfileImpl(
      {this.name, this.email, this.gender, this.imageFile});

  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? gender;
  @override
  final File? imageFile;

  @override
  String toString() {
    return 'EditProfileEvent.doEditProfile(name: $name, email: $email, gender: $gender, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoEditProfileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, email, gender, imageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoEditProfileImplCopyWith<_$DoEditProfileImpl> get copyWith =>
      __$$DoEditProfileImplCopyWithImpl<_$DoEditProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String? name, String? email, String? gender, File? imageFile)
        doEditProfile,
    required TResult Function() getUser,
    required TResult Function(String? newValue) changeOption,
    required TResult Function() changeImage,
  }) {
    return doEditProfile(name, email, gender, imageFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult? Function()? getUser,
    TResult? Function(String? newValue)? changeOption,
    TResult? Function()? changeImage,
  }) {
    return doEditProfile?.call(name, email, gender, imageFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult Function()? getUser,
    TResult Function(String? newValue)? changeOption,
    TResult Function()? changeImage,
    required TResult orElse(),
  }) {
    if (doEditProfile != null) {
      return doEditProfile(name, email, gender, imageFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DoEditProfile value) doEditProfile,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeOption value) changeOption,
    required TResult Function(_ChangeImage value) changeImage,
  }) {
    return doEditProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DoEditProfile value)? doEditProfile,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeOption value)? changeOption,
    TResult? Function(_ChangeImage value)? changeImage,
  }) {
    return doEditProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DoEditProfile value)? doEditProfile,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeOption value)? changeOption,
    TResult Function(_ChangeImage value)? changeImage,
    required TResult orElse(),
  }) {
    if (doEditProfile != null) {
      return doEditProfile(this);
    }
    return orElse();
  }
}

abstract class _DoEditProfile implements EditProfileEvent {
  const factory _DoEditProfile(
      {final String? name,
      final String? email,
      final String? gender,
      final File? imageFile}) = _$DoEditProfileImpl;

  String? get name;
  String? get email;
  String? get gender;
  File? get imageFile;
  @JsonKey(ignore: true)
  _$$DoEditProfileImplCopyWith<_$DoEditProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserImplCopyWith<$Res> {
  factory _$$GetUserImplCopyWith(
          _$GetUserImpl value, $Res Function(_$GetUserImpl) then) =
      __$$GetUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$GetUserImpl>
    implements _$$GetUserImplCopyWith<$Res> {
  __$$GetUserImplCopyWithImpl(
      _$GetUserImpl _value, $Res Function(_$GetUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserImpl implements _GetUser {
  const _$GetUserImpl();

  @override
  String toString() {
    return 'EditProfileEvent.getUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String? name, String? email, String? gender, File? imageFile)
        doEditProfile,
    required TResult Function() getUser,
    required TResult Function(String? newValue) changeOption,
    required TResult Function() changeImage,
  }) {
    return getUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult? Function()? getUser,
    TResult? Function(String? newValue)? changeOption,
    TResult? Function()? changeImage,
  }) {
    return getUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult Function()? getUser,
    TResult Function(String? newValue)? changeOption,
    TResult Function()? changeImage,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DoEditProfile value) doEditProfile,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeOption value) changeOption,
    required TResult Function(_ChangeImage value) changeImage,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DoEditProfile value)? doEditProfile,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeOption value)? changeOption,
    TResult? Function(_ChangeImage value)? changeImage,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DoEditProfile value)? doEditProfile,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeOption value)? changeOption,
    TResult Function(_ChangeImage value)? changeImage,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser implements EditProfileEvent {
  const factory _GetUser() = _$GetUserImpl;
}

/// @nodoc
abstract class _$$ChangeOptionImplCopyWith<$Res> {
  factory _$$ChangeOptionImplCopyWith(
          _$ChangeOptionImpl value, $Res Function(_$ChangeOptionImpl) then) =
      __$$ChangeOptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? newValue});
}

/// @nodoc
class __$$ChangeOptionImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$ChangeOptionImpl>
    implements _$$ChangeOptionImplCopyWith<$Res> {
  __$$ChangeOptionImplCopyWithImpl(
      _$ChangeOptionImpl _value, $Res Function(_$ChangeOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = freezed,
  }) {
    return _then(_$ChangeOptionImpl(
      freezed == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ChangeOptionImpl implements _ChangeOption {
  const _$ChangeOptionImpl(this.newValue);

  @override
  final String? newValue;

  @override
  String toString() {
    return 'EditProfileEvent.changeOption(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeOptionImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeOptionImplCopyWith<_$ChangeOptionImpl> get copyWith =>
      __$$ChangeOptionImplCopyWithImpl<_$ChangeOptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String? name, String? email, String? gender, File? imageFile)
        doEditProfile,
    required TResult Function() getUser,
    required TResult Function(String? newValue) changeOption,
    required TResult Function() changeImage,
  }) {
    return changeOption(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult? Function()? getUser,
    TResult? Function(String? newValue)? changeOption,
    TResult? Function()? changeImage,
  }) {
    return changeOption?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult Function()? getUser,
    TResult Function(String? newValue)? changeOption,
    TResult Function()? changeImage,
    required TResult orElse(),
  }) {
    if (changeOption != null) {
      return changeOption(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DoEditProfile value) doEditProfile,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeOption value) changeOption,
    required TResult Function(_ChangeImage value) changeImage,
  }) {
    return changeOption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DoEditProfile value)? doEditProfile,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeOption value)? changeOption,
    TResult? Function(_ChangeImage value)? changeImage,
  }) {
    return changeOption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DoEditProfile value)? doEditProfile,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeOption value)? changeOption,
    TResult Function(_ChangeImage value)? changeImage,
    required TResult orElse(),
  }) {
    if (changeOption != null) {
      return changeOption(this);
    }
    return orElse();
  }
}

abstract class _ChangeOption implements EditProfileEvent {
  const factory _ChangeOption(final String? newValue) = _$ChangeOptionImpl;

  String? get newValue;
  @JsonKey(ignore: true)
  _$$ChangeOptionImplCopyWith<_$ChangeOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeImageImplCopyWith<$Res> {
  factory _$$ChangeImageImplCopyWith(
          _$ChangeImageImpl value, $Res Function(_$ChangeImageImpl) then) =
      __$$ChangeImageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangeImageImplCopyWithImpl<$Res>
    extends _$EditProfileEventCopyWithImpl<$Res, _$ChangeImageImpl>
    implements _$$ChangeImageImplCopyWith<$Res> {
  __$$ChangeImageImplCopyWithImpl(
      _$ChangeImageImpl _value, $Res Function(_$ChangeImageImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangeImageImpl implements _ChangeImage {
  const _$ChangeImageImpl();

  @override
  String toString() {
    return 'EditProfileEvent.changeImage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangeImageImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String? name, String? email, String? gender, File? imageFile)
        doEditProfile,
    required TResult Function() getUser,
    required TResult Function(String? newValue) changeOption,
    required TResult Function() changeImage,
  }) {
    return changeImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult? Function()? getUser,
    TResult? Function(String? newValue)? changeOption,
    TResult? Function()? changeImage,
  }) {
    return changeImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String? name, String? email, String? gender, File? imageFile)?
        doEditProfile,
    TResult Function()? getUser,
    TResult Function(String? newValue)? changeOption,
    TResult Function()? changeImage,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DoEditProfile value) doEditProfile,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeOption value) changeOption,
    required TResult Function(_ChangeImage value) changeImage,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_DoEditProfile value)? doEditProfile,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeOption value)? changeOption,
    TResult? Function(_ChangeImage value)? changeImage,
  }) {
    return changeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DoEditProfile value)? doEditProfile,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeOption value)? changeOption,
    TResult Function(_ChangeImage value)? changeImage,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(this);
    }
    return orElse();
  }
}

abstract class _ChangeImage implements EditProfileEvent {
  const factory _ChangeImage() = _$ChangeImageImpl;
}

/// @nodoc
mixin _$EditProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileStateCopyWith<$Res> {
  factory $EditProfileStateCopyWith(
          EditProfileState value, $Res Function(EditProfileState) then) =
      _$EditProfileStateCopyWithImpl<$Res, EditProfileState>;
}

/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res, $Val extends EditProfileState>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EditProfileState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EditProfileState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'EditProfileState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements EditProfileState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CurrentUserModel? user,
      String? selectedOption,
      String? imagePath,
      EditProfileResponseModel? modelEdit});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? selectedOption = freezed,
    Object? imagePath = freezed,
    Object? modelEdit = freezed,
  }) {
    return _then(_$LoadedImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CurrentUserModel?,
      selectedOption: freezed == selectedOption
          ? _value.selectedOption
          : selectedOption // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      modelEdit: freezed == modelEdit
          ? _value.modelEdit
          : modelEdit // ignore: cast_nullable_to_non_nullable
              as EditProfileResponseModel?,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
      {this.user, this.selectedOption, this.imagePath, this.modelEdit});

  @override
  final CurrentUserModel? user;
  @override
  final String? selectedOption;
  @override
  final String? imagePath;
  @override
  final EditProfileResponseModel? modelEdit;

  @override
  String toString() {
    return 'EditProfileState.loaded(user: $user, selectedOption: $selectedOption, imagePath: $imagePath, modelEdit: $modelEdit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.selectedOption, selectedOption) ||
                other.selectedOption == selectedOption) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.modelEdit, modelEdit) ||
                other.modelEdit == modelEdit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, selectedOption, imagePath, modelEdit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(user, selectedOption, imagePath, modelEdit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(user, selectedOption, imagePath, modelEdit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user, selectedOption, imagePath, modelEdit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements EditProfileState {
  const factory _Loaded(
      {final CurrentUserModel? user,
      final String? selectedOption,
      final String? imagePath,
      final EditProfileResponseModel? modelEdit}) = _$LoadedImpl;

  CurrentUserModel? get user;
  String? get selectedOption;
  String? get imagePath;
  EditProfileResponseModel? get modelEdit;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$EditProfileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'EditProfileState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CurrentUserModel? user, String? selectedOption,
            String? imagePath, EditProfileResponseModel? modelEdit)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements EditProfileState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
