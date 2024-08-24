// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OtpVerificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function(RegisterRequestModel? data) doRegister,
    required TResult Function(String? email) postEmailVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(RegisterRequestModel? data)? doRegister,
    TResult? Function(String? email)? postEmailVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(RegisterRequestModel? data)? doRegister,
    TResult Function(String? email)? postEmailVerification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_DoRegister value) doRegister,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_DoRegister value)? doRegister,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_DoRegister value)? doRegister,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationEventCopyWith<$Res> {
  factory $OtpVerificationEventCopyWith(OtpVerificationEvent value,
          $Res Function(OtpVerificationEvent) then) =
      _$OtpVerificationEventCopyWithImpl<$Res, OtpVerificationEvent>;
}

/// @nodoc
class _$OtpVerificationEventCopyWithImpl<$Res,
        $Val extends OtpVerificationEvent>
    implements $OtpVerificationEventCopyWith<$Res> {
  _$OtpVerificationEventCopyWithImpl(this._value, this._then);

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
    extends _$OtpVerificationEventCopyWithImpl<$Res, _$StartTimerImpl>
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
    return 'OtpVerificationEvent.startTimer()';
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
    required TResult Function(RegisterRequestModel? data) doRegister,
    required TResult Function(String? email) postEmailVerification,
  }) {
    return startTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(RegisterRequestModel? data)? doRegister,
    TResult? Function(String? email)? postEmailVerification,
  }) {
    return startTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(RegisterRequestModel? data)? doRegister,
    TResult Function(String? email)? postEmailVerification,
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
    required TResult Function(_DoRegister value) doRegister,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
  }) {
    return startTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_DoRegister value)? doRegister,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
  }) {
    return startTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_DoRegister value)? doRegister,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer(this);
    }
    return orElse();
  }
}

abstract class _StartTimer implements OtpVerificationEvent {
  const factory _StartTimer() = _$StartTimerImpl;
}

/// @nodoc
abstract class _$$DoRegisterImplCopyWith<$Res> {
  factory _$$DoRegisterImplCopyWith(
          _$DoRegisterImpl value, $Res Function(_$DoRegisterImpl) then) =
      __$$DoRegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterRequestModel? data});
}

/// @nodoc
class __$$DoRegisterImplCopyWithImpl<$Res>
    extends _$OtpVerificationEventCopyWithImpl<$Res, _$DoRegisterImpl>
    implements _$$DoRegisterImplCopyWith<$Res> {
  __$$DoRegisterImplCopyWithImpl(
      _$DoRegisterImpl _value, $Res Function(_$DoRegisterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DoRegisterImpl(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RegisterRequestModel?,
    ));
  }
}

/// @nodoc

class _$DoRegisterImpl implements _DoRegister {
  const _$DoRegisterImpl(this.data);

  @override
  final RegisterRequestModel? data;

  @override
  String toString() {
    return 'OtpVerificationEvent.doRegister(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoRegisterImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoRegisterImplCopyWith<_$DoRegisterImpl> get copyWith =>
      __$$DoRegisterImplCopyWithImpl<_$DoRegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() startTimer,
    required TResult Function(RegisterRequestModel? data) doRegister,
    required TResult Function(String? email) postEmailVerification,
  }) {
    return doRegister(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(RegisterRequestModel? data)? doRegister,
    TResult? Function(String? email)? postEmailVerification,
  }) {
    return doRegister?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(RegisterRequestModel? data)? doRegister,
    TResult Function(String? email)? postEmailVerification,
    required TResult orElse(),
  }) {
    if (doRegister != null) {
      return doRegister(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_DoRegister value) doRegister,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
  }) {
    return doRegister(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_DoRegister value)? doRegister,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
  }) {
    return doRegister?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_DoRegister value)? doRegister,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    required TResult orElse(),
  }) {
    if (doRegister != null) {
      return doRegister(this);
    }
    return orElse();
  }
}

abstract class _DoRegister implements OtpVerificationEvent {
  const factory _DoRegister(final RegisterRequestModel? data) =
      _$DoRegisterImpl;

  RegisterRequestModel? get data;
  @JsonKey(ignore: true)
  _$$DoRegisterImplCopyWith<_$DoRegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$OtpVerificationEventCopyWithImpl<$Res,
        _$PostEmailVerificationImpl>
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
    return 'OtpVerificationEvent.postEmailVerification(email: $email)';
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
    required TResult Function(RegisterRequestModel? data) doRegister,
    required TResult Function(String? email) postEmailVerification,
  }) {
    return postEmailVerification(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? startTimer,
    TResult? Function(RegisterRequestModel? data)? doRegister,
    TResult? Function(String? email)? postEmailVerification,
  }) {
    return postEmailVerification?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? startTimer,
    TResult Function(RegisterRequestModel? data)? doRegister,
    TResult Function(String? email)? postEmailVerification,
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
    required TResult Function(_DoRegister value) doRegister,
    required TResult Function(_PostEmailVerification value)
        postEmailVerification,
  }) {
    return postEmailVerification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_DoRegister value)? doRegister,
    TResult? Function(_PostEmailVerification value)? postEmailVerification,
  }) {
    return postEmailVerification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_DoRegister value)? doRegister,
    TResult Function(_PostEmailVerification value)? postEmailVerification,
    required TResult orElse(),
  }) {
    if (postEmailVerification != null) {
      return postEmailVerification(this);
    }
    return orElse();
  }
}

abstract class _PostEmailVerification implements OtpVerificationEvent {
  const factory _PostEmailVerification(final String? email) =
      _$PostEmailVerificationImpl;

  String? get email;
  @JsonKey(ignore: true)
  _$$PostEmailVerificationImplCopyWith<_$PostEmailVerificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtpVerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isEmailVerificationLoading) loading,
    required TResult Function(
            RegisterResponseModel? model, OtpResponseModel? otpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isEmailVerificationLoading)? loading,
    TResult? Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isEmailVerificationLoading)? loading,
    TResult Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
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
abstract class $OtpVerificationStateCopyWith<$Res> {
  factory $OtpVerificationStateCopyWith(OtpVerificationState value,
          $Res Function(OtpVerificationState) then) =
      _$OtpVerificationStateCopyWithImpl<$Res, OtpVerificationState>;
}

/// @nodoc
class _$OtpVerificationStateCopyWithImpl<$Res,
        $Val extends OtpVerificationState>
    implements $OtpVerificationStateCopyWith<$Res> {
  _$OtpVerificationStateCopyWithImpl(this._value, this._then);

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
    extends _$OtpVerificationStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OtpVerificationState.initial()';
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
    required TResult Function(bool isEmailVerificationLoading) loading,
    required TResult Function(
            RegisterResponseModel? model, OtpResponseModel? otpModel)
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
    TResult? Function(bool isEmailVerificationLoading)? loading,
    TResult? Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
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
    TResult Function(bool isEmailVerificationLoading)? loading,
    TResult Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
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

abstract class _Initial implements OtpVerificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isEmailVerificationLoading});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$OtpVerificationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerificationLoading = null,
  }) {
    return _then(_$LoadingImpl(
      isEmailVerificationLoading: null == isEmailVerificationLoading
          ? _value.isEmailVerificationLoading
          : isEmailVerificationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({this.isEmailVerificationLoading = false});

  @override
  @JsonKey()
  final bool isEmailVerificationLoading;

  @override
  String toString() {
    return 'OtpVerificationState.loading(isEmailVerificationLoading: $isEmailVerificationLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.isEmailVerificationLoading,
                    isEmailVerificationLoading) ||
                other.isEmailVerificationLoading ==
                    isEmailVerificationLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEmailVerificationLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isEmailVerificationLoading) loading,
    required TResult Function(
            RegisterResponseModel? model, OtpResponseModel? otpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) {
    return loading(isEmailVerificationLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isEmailVerificationLoading)? loading,
    TResult? Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) {
    return loading?.call(isEmailVerificationLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isEmailVerificationLoading)? loading,
    TResult Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
        success,
    TResult Function(String? message)? error,
    TResult Function(int secondsLeft, bool isTimerRunning)? timerRunning,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(isEmailVerificationLoading);
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

abstract class _Loading implements OtpVerificationState {
  const factory _Loading({final bool isEmailVerificationLoading}) =
      _$LoadingImpl;

  bool get isEmailVerificationLoading;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterResponseModel? model, OtpResponseModel? otpModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$OtpVerificationStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? otpModel = freezed,
  }) {
    return _then(_$SuccessImpl(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RegisterResponseModel?,
      otpModel: freezed == otpModel
          ? _value.otpModel
          : otpModel // ignore: cast_nullable_to_non_nullable
              as OtpResponseModel?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({this.model, this.otpModel});

  @override
  final RegisterResponseModel? model;
  @override
  final OtpResponseModel? otpModel;

  @override
  String toString() {
    return 'OtpVerificationState.success(model: $model, otpModel: $otpModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.otpModel, otpModel) ||
                other.otpModel == otpModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, otpModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isEmailVerificationLoading) loading,
    required TResult Function(
            RegisterResponseModel? model, OtpResponseModel? otpModel)
        success,
    required TResult Function(String? message) error,
    required TResult Function(int secondsLeft, bool isTimerRunning)
        timerRunning,
  }) {
    return success(model, otpModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isEmailVerificationLoading)? loading,
    TResult? Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
        success,
    TResult? Function(String? message)? error,
    TResult? Function(int secondsLeft, bool isTimerRunning)? timerRunning,
  }) {
    return success?.call(model, otpModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isEmailVerificationLoading)? loading,
    TResult Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
        success,
    TResult Function(String? message)? error,
    TResult Function(int secondsLeft, bool isTimerRunning)? timerRunning,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model, otpModel);
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

abstract class _Success implements OtpVerificationState {
  const factory _Success(
      {final RegisterResponseModel? model,
      final OtpResponseModel? otpModel}) = _$SuccessImpl;

  RegisterResponseModel? get model;
  OtpResponseModel? get otpModel;
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
    extends _$OtpVerificationStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'OtpVerificationState.error(message: $message)';
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
    required TResult Function(bool isEmailVerificationLoading) loading,
    required TResult Function(
            RegisterResponseModel? model, OtpResponseModel? otpModel)
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
    TResult? Function(bool isEmailVerificationLoading)? loading,
    TResult? Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
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
    TResult Function(bool isEmailVerificationLoading)? loading,
    TResult Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
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

abstract class _Error implements OtpVerificationState {
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
    extends _$OtpVerificationStateCopyWithImpl<$Res, _$TimerRunningImpl>
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
    return 'OtpVerificationState.timerRunning(secondsLeft: $secondsLeft, isTimerRunning: $isTimerRunning)';
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
    required TResult Function(bool isEmailVerificationLoading) loading,
    required TResult Function(
            RegisterResponseModel? model, OtpResponseModel? otpModel)
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
    TResult? Function(bool isEmailVerificationLoading)? loading,
    TResult? Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
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
    TResult Function(bool isEmailVerificationLoading)? loading,
    TResult Function(RegisterResponseModel? model, OtpResponseModel? otpModel)?
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

abstract class _TimerRunning implements OtpVerificationState {
  const factory _TimerRunning(final int secondsLeft,
      {final bool isTimerRunning}) = _$TimerRunningImpl;

  int get secondsLeft;
  bool get isTimerRunning;
  @JsonKey(ignore: true)
  _$$TimerRunningImplCopyWith<_$TimerRunningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
