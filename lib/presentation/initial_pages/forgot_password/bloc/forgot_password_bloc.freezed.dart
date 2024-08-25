// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function(String? email) postEmailVerification,
    required TResult Function(String? email) postEmailVerificationFirst,
    required TResult Function(String? email, String? otp) verifyOtp,
    required TResult Function(ResetPasswordRequestModel? model)
        postResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(String? email)? postEmailVerification,
    TResult? Function(String? email)? postEmailVerificationFirst,
    TResult? Function(String? email, String? otp)? verifyOtp,
    TResult? Function(ResetPasswordRequestModel? model)? postResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(String? email)? postEmailVerification,
    TResult Function(String? email)? postEmailVerificationFirst,
    TResult Function(String? email, String? otp)? verifyOtp,
    TResult Function(ResetPasswordRequestModel? model)? postResetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
    required TResult Function(_PostEmailVerificationFirst value)
        postEmailVerificationFirst,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PostResetPassword value) postResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
    TResult? Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_PostResetPassword value)? postResetPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    TResult Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PostResetPassword value)? postResetPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartTimerImplCopyWith<$Res> {
  factory _$$StartTimerImplCopyWith(
          _$StartTimerImpl value, $Res Function(_$StartTimerImpl) then) =
      __$$StartTimerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartTimerImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$StartTimerImpl>
    implements _$$StartTimerImplCopyWith<$Res> {
  __$$StartTimerImplCopyWithImpl(
      _$StartTimerImpl _value, $Res Function(_$StartTimerImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartTimerImpl implements _StartTimer {
  const _$StartTimerImpl();

  @override
  String toString() {
    return 'ForgotPasswordEvent.startTimer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartTimerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function(String? email) postEmailVerification,
    required TResult Function(String? email) postEmailVerificationFirst,
    required TResult Function(String? email, String? otp) verifyOtp,
    required TResult Function(ResetPasswordRequestModel? model)
        postResetPassword,
  }) {
    return startTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(String? email)? postEmailVerification,
    TResult? Function(String? email)? postEmailVerificationFirst,
    TResult? Function(String? email, String? otp)? verifyOtp,
    TResult? Function(ResetPasswordRequestModel? model)? postResetPassword,
  }) {
    return startTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(String? email)? postEmailVerification,
    TResult Function(String? email)? postEmailVerificationFirst,
    TResult Function(String? email, String? otp)? verifyOtp,
    TResult Function(ResetPasswordRequestModel? model)? postResetPassword,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
    required TResult Function(_PostEmailVerificationFirst value)
        postEmailVerificationFirst,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PostResetPassword value) postResetPassword,
  }) {
    return startTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
    TResult? Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_PostResetPassword value)? postResetPassword,
  }) {
    return startTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    TResult Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PostResetPassword value)? postResetPassword,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer(this);
    }
    return orElse();
  }
}

abstract class _StartTimer implements ForgotPasswordEvent {
  const factory _StartTimer() = _$StartTimerImpl;
}

/// @nodoc
abstract class _$$PostEmailVerificationImplCopyWith<$Res> {
  factory _$$PostEmailVerificationImplCopyWith(
          _$PostEmailVerificationImpl value,
          $Res Function(_$PostEmailVerificationImpl) then) =
      __$$PostEmailVerificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? email});
}

/// @nodoc
class __$$PostEmailVerificationImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$PostEmailVerificationImpl>
    implements _$$PostEmailVerificationImplCopyWith<$Res> {
  __$$PostEmailVerificationImplCopyWithImpl(_$PostEmailVerificationImpl _value,
      $Res Function(_$PostEmailVerificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$PostEmailVerificationImpl(
      freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PostEmailVerificationImpl implements _PostEmailVerification {
  const _$PostEmailVerificationImpl(this.email);

  @override
  final String? email;

  @override
  String toString() {
    return 'ForgotPasswordEvent.postEmailVerification(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostEmailVerificationImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostEmailVerificationImplCopyWith<_$PostEmailVerificationImpl>
      get copyWith => __$$PostEmailVerificationImplCopyWithImpl<
          _$PostEmailVerificationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function(String? email) postEmailVerification,
    required TResult Function(String? email) postEmailVerificationFirst,
    required TResult Function(String? email, String? otp) verifyOtp,
    required TResult Function(ResetPasswordRequestModel? model)
        postResetPassword,
  }) {
    return postEmailVerification(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(String? email)? postEmailVerification,
    TResult? Function(String? email)? postEmailVerificationFirst,
    TResult? Function(String? email, String? otp)? verifyOtp,
    TResult? Function(ResetPasswordRequestModel? model)? postResetPassword,
  }) {
    return postEmailVerification?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(String? email)? postEmailVerification,
    TResult Function(String? email)? postEmailVerificationFirst,
    TResult Function(String? email, String? otp)? verifyOtp,
    TResult Function(ResetPasswordRequestModel? model)? postResetPassword,
    required TResult orElse(),
  }) {
    if (postEmailVerification != null) {
      return postEmailVerification(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
    required TResult Function(_PostEmailVerificationFirst value)
        postEmailVerificationFirst,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PostResetPassword value) postResetPassword,
  }) {
    return postEmailVerification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
    TResult? Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_PostResetPassword value)? postResetPassword,
  }) {
    return postEmailVerification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    TResult Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PostResetPassword value)? postResetPassword,
    required TResult orElse(),
  }) {
    if (postEmailVerification != null) {
      return postEmailVerification(this);
    }
    return orElse();
  }
}

abstract class _PostEmailVerification implements ForgotPasswordEvent {
  const factory _PostEmailVerification(final String? email) =
      _$PostEmailVerificationImpl;

  String? get email;
  @JsonKey(ignore: true)
  _$$PostEmailVerificationImplCopyWith<_$PostEmailVerificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostEmailVerificationFirstImplCopyWith<$Res> {
  factory _$$PostEmailVerificationFirstImplCopyWith(
          _$PostEmailVerificationFirstImpl value,
          $Res Function(_$PostEmailVerificationFirstImpl) then) =
      __$$PostEmailVerificationFirstImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? email});
}

/// @nodoc
class __$$PostEmailVerificationFirstImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res,
        _$PostEmailVerificationFirstImpl>
    implements _$$PostEmailVerificationFirstImplCopyWith<$Res> {
  __$$PostEmailVerificationFirstImplCopyWithImpl(
      _$PostEmailVerificationFirstImpl _value,
      $Res Function(_$PostEmailVerificationFirstImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$PostEmailVerificationFirstImpl(
      freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PostEmailVerificationFirstImpl implements _PostEmailVerificationFirst {
  const _$PostEmailVerificationFirstImpl(this.email);

  @override
  final String? email;

  @override
  String toString() {
    return 'ForgotPasswordEvent.postEmailVerificationFirst(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostEmailVerificationFirstImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostEmailVerificationFirstImplCopyWith<_$PostEmailVerificationFirstImpl>
      get copyWith => __$$PostEmailVerificationFirstImplCopyWithImpl<
          _$PostEmailVerificationFirstImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function(String? email) postEmailVerification,
    required TResult Function(String? email) postEmailVerificationFirst,
    required TResult Function(String? email, String? otp) verifyOtp,
    required TResult Function(ResetPasswordRequestModel? model)
        postResetPassword,
  }) {
    return postEmailVerificationFirst(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(String? email)? postEmailVerification,
    TResult? Function(String? email)? postEmailVerificationFirst,
    TResult? Function(String? email, String? otp)? verifyOtp,
    TResult? Function(ResetPasswordRequestModel? model)? postResetPassword,
  }) {
    return postEmailVerificationFirst?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(String? email)? postEmailVerification,
    TResult Function(String? email)? postEmailVerificationFirst,
    TResult Function(String? email, String? otp)? verifyOtp,
    TResult Function(ResetPasswordRequestModel? model)? postResetPassword,
    required TResult orElse(),
  }) {
    if (postEmailVerificationFirst != null) {
      return postEmailVerificationFirst(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
    required TResult Function(_PostEmailVerificationFirst value)
        postEmailVerificationFirst,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PostResetPassword value) postResetPassword,
  }) {
    return postEmailVerificationFirst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
    TResult? Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_PostResetPassword value)? postResetPassword,
  }) {
    return postEmailVerificationFirst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    TResult Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PostResetPassword value)? postResetPassword,
    required TResult orElse(),
  }) {
    if (postEmailVerificationFirst != null) {
      return postEmailVerificationFirst(this);
    }
    return orElse();
  }
}

abstract class _PostEmailVerificationFirst implements ForgotPasswordEvent {
  const factory _PostEmailVerificationFirst(final String? email) =
      _$PostEmailVerificationFirstImpl;

  String? get email;
  @JsonKey(ignore: true)
  _$$PostEmailVerificationFirstImplCopyWith<_$PostEmailVerificationFirstImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? email, String? otp});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$VerifyOtpImpl(
      freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VerifyOtpImpl implements _VerifyOtp {
  const _$VerifyOtpImpl(this.email, this.otp);

  @override
  final String? email;
  @override
  final String? otp;

  @override
  String toString() {
    return 'ForgotPasswordEvent.verifyOtp(email: $email, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function(String? email) postEmailVerification,
    required TResult Function(String? email) postEmailVerificationFirst,
    required TResult Function(String? email, String? otp) verifyOtp,
    required TResult Function(ResetPasswordRequestModel? model)
        postResetPassword,
  }) {
    return verifyOtp(email, otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(String? email)? postEmailVerification,
    TResult? Function(String? email)? postEmailVerificationFirst,
    TResult? Function(String? email, String? otp)? verifyOtp,
    TResult? Function(ResetPasswordRequestModel? model)? postResetPassword,
  }) {
    return verifyOtp?.call(email, otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(String? email)? postEmailVerification,
    TResult Function(String? email)? postEmailVerificationFirst,
    TResult Function(String? email, String? otp)? verifyOtp,
    TResult Function(ResetPasswordRequestModel? model)? postResetPassword,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(email, otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
    required TResult Function(_PostEmailVerificationFirst value)
        postEmailVerificationFirst,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PostResetPassword value) postResetPassword,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
    TResult? Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_PostResetPassword value)? postResetPassword,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    TResult Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PostResetPassword value)? postResetPassword,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements ForgotPasswordEvent {
  const factory _VerifyOtp(final String? email, final String? otp) =
      _$VerifyOtpImpl;

  String? get email;
  String? get otp;
  @JsonKey(ignore: true)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostResetPasswordImplCopyWith<$Res> {
  factory _$$PostResetPasswordImplCopyWith(_$PostResetPasswordImpl value,
          $Res Function(_$PostResetPasswordImpl) then) =
      __$$PostResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResetPasswordRequestModel? model});
}

/// @nodoc
class __$$PostResetPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$PostResetPasswordImpl>
    implements _$$PostResetPasswordImplCopyWith<$Res> {
  __$$PostResetPasswordImplCopyWithImpl(_$PostResetPasswordImpl _value,
      $Res Function(_$PostResetPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$PostResetPasswordImpl(
      freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ResetPasswordRequestModel?,
    ));
  }
}

/// @nodoc

class _$PostResetPasswordImpl implements _PostResetPassword {
  const _$PostResetPasswordImpl(this.model);

  @override
  final ResetPasswordRequestModel? model;

  @override
  String toString() {
    return 'ForgotPasswordEvent.postResetPassword(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostResetPasswordImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostResetPasswordImplCopyWith<_$PostResetPasswordImpl> get copyWith =>
      __$$PostResetPasswordImplCopyWithImpl<_$PostResetPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function(String? email) postEmailVerification,
    required TResult Function(String? email) postEmailVerificationFirst,
    required TResult Function(String? email, String? otp) verifyOtp,
    required TResult Function(ResetPasswordRequestModel? model)
        postResetPassword,
  }) {
    return postResetPassword(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(String? email)? postEmailVerification,
    TResult? Function(String? email)? postEmailVerificationFirst,
    TResult? Function(String? email, String? otp)? verifyOtp,
    TResult? Function(ResetPasswordRequestModel? model)? postResetPassword,
  }) {
    return postResetPassword?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(String? email)? postEmailVerification,
    TResult Function(String? email)? postEmailVerificationFirst,
    TResult Function(String? email, String? otp)? verifyOtp,
    TResult Function(ResetPasswordRequestModel? model)? postResetPassword,
    required TResult orElse(),
  }) {
    if (postResetPassword != null) {
      return postResetPassword(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
    required TResult Function(_PostEmailVerificationFirst value)
        postEmailVerificationFirst,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_PostResetPassword value) postResetPassword,
  }) {
    return postResetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
    TResult? Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_PostResetPassword value)? postResetPassword,
  }) {
    return postResetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    TResult Function(_PostEmailVerificationFirst value)?
        postEmailVerificationFirst,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_PostResetPassword value)? postResetPassword,
    required TResult orElse(),
  }) {
    if (postResetPassword != null) {
      return postResetPassword(this);
    }
    return orElse();
  }
}

abstract class _PostResetPassword implements ForgotPasswordEvent {
  const factory _PostResetPassword(final ResetPasswordRequestModel? model) =
      _$PostResetPasswordImpl;

  ResetPasswordRequestModel? get model;
  @JsonKey(ignore: true)
  _$$PostResetPasswordImplCopyWith<_$PostResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult Function(String? message)? error,
    TResult Function(int secondsLeft, bool isTimerRunning)? timerRunning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerRunning value) timerRunning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerRunning value)? timerRunning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerRunning value)? timerRunning,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ForgotPasswordState.initial()';
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
    required TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult Function(String? message)? error,
    TResult Function(int secondsLeft, bool isTimerRunning)? timerRunning,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerRunning value) timerRunning,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerRunning value)? timerRunning,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerRunning value)? timerRunning,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ForgotPasswordState {
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
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ForgotPasswordState.loading()';
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
    required TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult Function(String? message)? error,
    TResult Function(int secondsLeft, bool isTimerRunning)? timerRunning,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerRunning value) timerRunning,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerRunning value)? timerRunning,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerRunning value)? timerRunning,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ForgotPasswordState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ResetPasswordResponseModel? resetPasswordModel,
      OtpResponseModel? otpModel,
      VerifyOtpResponseModel? verifyOtpModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resetPasswordModel = freezed,
    Object? otpModel = freezed,
    Object? verifyOtpModel = freezed,
  }) {
    return _then(_$SuccessImpl(
      resetPasswordModel: freezed == resetPasswordModel
          ? _value.resetPasswordModel
          : resetPasswordModel // ignore: cast_nullable_to_non_nullable
              as ResetPasswordResponseModel?,
      otpModel: freezed == otpModel
          ? _value.otpModel
          : otpModel // ignore: cast_nullable_to_non_nullable
              as OtpResponseModel?,
      verifyOtpModel: freezed == verifyOtpModel
          ? _value.verifyOtpModel
          : verifyOtpModel // ignore: cast_nullable_to_non_nullable
              as VerifyOtpResponseModel?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {this.resetPasswordModel, this.otpModel, this.verifyOtpModel});

  @override
  final ResetPasswordResponseModel? resetPasswordModel;
  @override
  final OtpResponseModel? otpModel;
  @override
  final VerifyOtpResponseModel? verifyOtpModel;

  @override
  String toString() {
    return 'ForgotPasswordState.success(resetPasswordModel: $resetPasswordModel, otpModel: $otpModel, verifyOtpModel: $verifyOtpModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.resetPasswordModel, resetPasswordModel) ||
                other.resetPasswordModel == resetPasswordModel) &&
            (identical(other.otpModel, otpModel) ||
                other.otpModel == otpModel) &&
            (identical(other.verifyOtpModel, verifyOtpModel) ||
                other.verifyOtpModel == verifyOtpModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, resetPasswordModel, otpModel, verifyOtpModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) {
    return success(resetPasswordModel, otpModel, verifyOtpModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) {
    return success?.call(resetPasswordModel, otpModel, verifyOtpModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult Function(String? message)? error,
    TResult Function(int secondsLeft, bool isTimerRunning)? timerRunning,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(resetPasswordModel, otpModel, verifyOtpModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerRunning value) timerRunning,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerRunning value)? timerRunning,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerRunning value)? timerRunning,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ForgotPasswordState {
  const factory _Success(
      {final ResetPasswordResponseModel? resetPasswordModel,
      final OtpResponseModel? otpModel,
      final VerifyOtpResponseModel? verifyOtpModel}) = _$SuccessImpl;

  ResetPasswordResponseModel? get resetPasswordModel;
  OtpResponseModel? get otpModel;
  VerifyOtpResponseModel? get verifyOtpModel;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'ForgotPasswordState.error(message: $message)';
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
    required TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult Function(String? message)? error,
    TResult Function(int secondsLeft, bool isTimerRunning)? timerRunning,
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
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerRunning value) timerRunning,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerRunning value)? timerRunning,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerRunning value)? timerRunning,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ForgotPasswordState {
  const factory _Error({final String? message}) = _$ErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerRunningImplCopyWith<$Res> {
  factory _$$TimerRunningImplCopyWith(
          _$TimerRunningImpl value, $Res Function(_$TimerRunningImpl) then) =
      __$$TimerRunningImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int secondsLeft, bool isTimerRunning});
}

/// @nodoc
class __$$TimerRunningImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$TimerRunningImpl>
    implements _$$TimerRunningImplCopyWith<$Res> {
  __$$TimerRunningImplCopyWithImpl(
      _$TimerRunningImpl _value, $Res Function(_$TimerRunningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secondsLeft = null,
    Object? isTimerRunning = null,
  }) {
    return _then(_$TimerRunningImpl(
      null == secondsLeft
          ? _value.secondsLeft
          : secondsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      isTimerRunning: null == isTimerRunning
          ? _value.isTimerRunning
          : isTimerRunning // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TimerRunningImpl implements _TimerRunning {
  const _$TimerRunningImpl(this.secondsLeft, {this.isTimerRunning = true});

  @override
  final int secondsLeft;
  @override
  @JsonKey()
  final bool isTimerRunning;

  @override
  String toString() {
    return 'ForgotPasswordState.timerRunning(secondsLeft: $secondsLeft, isTimerRunning: $isTimerRunning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerRunningImpl &&
            (identical(other.secondsLeft, secondsLeft) ||
                other.secondsLeft == secondsLeft) &&
            (identical(other.isTimerRunning, isTimerRunning) ||
                other.isTimerRunning == isTimerRunning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondsLeft, isTimerRunning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      __$$TimerRunningImplCopyWithImpl<_$TimerRunningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) {
    return timerRunning(secondsLeft, isTimerRunning);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) {
    return timerRunning?.call(secondsLeft, isTimerRunning);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ResetPasswordResponseModel? resetPasswordModel,
            OtpResponseModel? otpModel, VerifyOtpResponseModel? verifyOtpModel)?
        success,
    TResult Function(String? message)? error,
    TResult Function(int secondsLeft, bool isTimerRunning)? timerRunning,
    required TResult orElse(),
  }) {
    if (timerRunning != null) {
      return timerRunning(secondsLeft, isTimerRunning);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerRunning value) timerRunning,
  }) {
    return timerRunning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerRunning value)? timerRunning,
  }) {
    return timerRunning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerRunning value)? timerRunning,
    required TResult orElse(),
  }) {
    if (timerRunning != null) {
      return timerRunning(this);
    }
    return orElse();
  }
}

abstract class _TimerRunning implements ForgotPasswordState {
  const factory _TimerRunning(final int secondsLeft,
      {final bool isTimerRunning}) = _$TimerRunningImpl;

  int get secondsLeft;
  bool get isTimerRunning;
  @JsonKey(ignore: true)
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
