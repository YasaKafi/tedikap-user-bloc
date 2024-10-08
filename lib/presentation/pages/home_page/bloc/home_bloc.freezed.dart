// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function() getPoint,
    required TResult Function(bool forceRefresh) getUser,
    required TResult Function(int index) changeIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function()? getPoint,
    TResult? Function(bool forceRefresh)? getUser,
    TResult? Function(int index)? changeIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function()? getPoint,
    TResult Function(bool forceRefresh)? getUser,
    TResult Function(int index)? changeIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetPoint value) getPoint,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeIndex value) changeIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetPoint value)? getPoint,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeIndex value)? changeIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetPoint value)? getPoint,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeIndex value)? changeIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'HomeEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function() getPoint,
    required TResult Function(bool forceRefresh) getUser,
    required TResult Function(int index) changeIndex,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function()? getPoint,
    TResult? Function(bool forceRefresh)? getUser,
    TResult? Function(int index)? changeIndex,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function()? getPoint,
    TResult Function(bool forceRefresh)? getUser,
    TResult Function(int index)? changeIndex,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetPoint value) getPoint,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeIndex value) changeIndex,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetPoint value)? getPoint,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeIndex value)? changeIndex,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetPoint value)? getPoint,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeIndex value)? changeIndex,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements HomeEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$GetPointImplCopyWith<$Res> {
  factory _$$GetPointImplCopyWith(
          _$GetPointImpl value, $Res Function(_$GetPointImpl) then) =
      __$$GetPointImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPointImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetPointImpl>
    implements _$$GetPointImplCopyWith<$Res> {
  __$$GetPointImplCopyWithImpl(
      _$GetPointImpl _value, $Res Function(_$GetPointImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPointImpl implements _GetPoint {
  const _$GetPointImpl();

  @override
  String toString() {
    return 'HomeEvent.getPoint()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPointImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function() getPoint,
    required TResult Function(bool forceRefresh) getUser,
    required TResult Function(int index) changeIndex,
  }) {
    return getPoint();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function()? getPoint,
    TResult? Function(bool forceRefresh)? getUser,
    TResult? Function(int index)? changeIndex,
  }) {
    return getPoint?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function()? getPoint,
    TResult Function(bool forceRefresh)? getUser,
    TResult Function(int index)? changeIndex,
    required TResult orElse(),
  }) {
    if (getPoint != null) {
      return getPoint();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetPoint value) getPoint,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeIndex value) changeIndex,
  }) {
    return getPoint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetPoint value)? getPoint,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeIndex value)? changeIndex,
  }) {
    return getPoint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetPoint value)? getPoint,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeIndex value)? changeIndex,
    required TResult orElse(),
  }) {
    if (getPoint != null) {
      return getPoint(this);
    }
    return orElse();
  }
}

abstract class _GetPoint implements HomeEvent {
  const factory _GetPoint() = _$GetPointImpl;
}

/// @nodoc
abstract class _$$GetUserImplCopyWith<$Res> {
  factory _$$GetUserImplCopyWith(
          _$GetUserImpl value, $Res Function(_$GetUserImpl) then) =
      __$$GetUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool forceRefresh});
}

/// @nodoc
class __$$GetUserImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetUserImpl>
    implements _$$GetUserImplCopyWith<$Res> {
  __$$GetUserImplCopyWithImpl(
      _$GetUserImpl _value, $Res Function(_$GetUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceRefresh = null,
  }) {
    return _then(_$GetUserImpl(
      forceRefresh: null == forceRefresh
          ? _value.forceRefresh
          : forceRefresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetUserImpl implements _GetUser {
  const _$GetUserImpl({this.forceRefresh = false});

  @override
  @JsonKey()
  final bool forceRefresh;

  @override
  String toString() {
    return 'HomeEvent.getUser(forceRefresh: $forceRefresh)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserImpl &&
            (identical(other.forceRefresh, forceRefresh) ||
                other.forceRefresh == forceRefresh));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceRefresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserImplCopyWith<_$GetUserImpl> get copyWith =>
      __$$GetUserImplCopyWithImpl<_$GetUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function() getPoint,
    required TResult Function(bool forceRefresh) getUser,
    required TResult Function(int index) changeIndex,
  }) {
    return getUser(forceRefresh);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function()? getPoint,
    TResult? Function(bool forceRefresh)? getUser,
    TResult? Function(int index)? changeIndex,
  }) {
    return getUser?.call(forceRefresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function()? getPoint,
    TResult Function(bool forceRefresh)? getUser,
    TResult Function(int index)? changeIndex,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(forceRefresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetPoint value) getPoint,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeIndex value) changeIndex,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetPoint value)? getPoint,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeIndex value)? changeIndex,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetPoint value)? getPoint,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeIndex value)? changeIndex,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser implements HomeEvent {
  const factory _GetUser({final bool forceRefresh}) = _$GetUserImpl;

  bool get forceRefresh;
  @JsonKey(ignore: true)
  _$$GetUserImplCopyWith<_$GetUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeIndexImplCopyWith<$Res> {
  factory _$$ChangeIndexImplCopyWith(
          _$ChangeIndexImpl value, $Res Function(_$ChangeIndexImpl) then) =
      __$$ChangeIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ChangeIndexImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ChangeIndexImpl>
    implements _$$ChangeIndexImplCopyWith<$Res> {
  __$$ChangeIndexImplCopyWithImpl(
      _$ChangeIndexImpl _value, $Res Function(_$ChangeIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ChangeIndexImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeIndexImpl implements _ChangeIndex {
  const _$ChangeIndexImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'HomeEvent.changeIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeIndexImplCopyWith<_$ChangeIndexImpl> get copyWith =>
      __$$ChangeIndexImplCopyWithImpl<_$ChangeIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function() getPoint,
    required TResult Function(bool forceRefresh) getUser,
    required TResult Function(int index) changeIndex,
  }) {
    return changeIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function()? getPoint,
    TResult? Function(bool forceRefresh)? getUser,
    TResult? Function(int index)? changeIndex,
  }) {
    return changeIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function()? getPoint,
    TResult Function(bool forceRefresh)? getUser,
    TResult Function(int index)? changeIndex,
    required TResult orElse(),
  }) {
    if (changeIndex != null) {
      return changeIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetPoint value) getPoint,
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_ChangeIndex value) changeIndex,
  }) {
    return changeIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetPoint value)? getPoint,
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_ChangeIndex value)? changeIndex,
  }) {
    return changeIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetPoint value)? getPoint,
    TResult Function(_GetUser value)? getUser,
    TResult Function(_ChangeIndex value)? changeIndex,
    required TResult orElse(),
  }) {
    if (changeIndex != null) {
      return changeIndex(this);
    }
    return orElse();
  }
}

abstract class _ChangeIndex implements HomeEvent {
  const factory _ChangeIndex({required final int index}) = _$ChangeIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ChangeIndexImplCopyWith<_$ChangeIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)
        success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

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
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'HomeState.initial()';
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
    required TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)
        success,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult? Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult Function(String? message)? error,
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
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
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
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'HomeState.loading()';
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
    required TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)
        success,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult Function(String? message)? error,
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
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MostPopularProductResponseModel? model,
      CurrentUserModel? user,
      int? newIndex,
      UserPointResponseModel? pointModel,
      StatusOutletResponseModel? statusOutletModel,
      BannerResponseModel? bannerModel,
      BoxPromoResponseModel? boxPromoModel});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? user = freezed,
    Object? newIndex = freezed,
    Object? pointModel = freezed,
    Object? statusOutletModel = freezed,
    Object? bannerModel = freezed,
    Object? boxPromoModel = freezed,
  }) {
    return _then(_$SuccessImpl(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as MostPopularProductResponseModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as CurrentUserModel?,
      newIndex: freezed == newIndex
          ? _value.newIndex
          : newIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      pointModel: freezed == pointModel
          ? _value.pointModel
          : pointModel // ignore: cast_nullable_to_non_nullable
              as UserPointResponseModel?,
      statusOutletModel: freezed == statusOutletModel
          ? _value.statusOutletModel
          : statusOutletModel // ignore: cast_nullable_to_non_nullable
              as StatusOutletResponseModel?,
      bannerModel: freezed == bannerModel
          ? _value.bannerModel
          : bannerModel // ignore: cast_nullable_to_non_nullable
              as BannerResponseModel?,
      boxPromoModel: freezed == boxPromoModel
          ? _value.boxPromoModel
          : boxPromoModel // ignore: cast_nullable_to_non_nullable
              as BoxPromoResponseModel?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {this.model,
      this.user,
      this.newIndex,
      this.pointModel,
      this.statusOutletModel,
      this.bannerModel,
      this.boxPromoModel});

  @override
  final MostPopularProductResponseModel? model;
  @override
  final CurrentUserModel? user;
  @override
  final int? newIndex;
  @override
  final UserPointResponseModel? pointModel;
  @override
  final StatusOutletResponseModel? statusOutletModel;
  @override
  final BannerResponseModel? bannerModel;
  @override
  final BoxPromoResponseModel? boxPromoModel;

  @override
  String toString() {
    return 'HomeState.success(model: $model, user: $user, newIndex: $newIndex, pointModel: $pointModel, statusOutletModel: $statusOutletModel, bannerModel: $bannerModel, boxPromoModel: $boxPromoModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.newIndex, newIndex) ||
                other.newIndex == newIndex) &&
            (identical(other.pointModel, pointModel) ||
                other.pointModel == pointModel) &&
            (identical(other.statusOutletModel, statusOutletModel) ||
                other.statusOutletModel == statusOutletModel) &&
            (identical(other.bannerModel, bannerModel) ||
                other.bannerModel == bannerModel) &&
            (identical(other.boxPromoModel, boxPromoModel) ||
                other.boxPromoModel == boxPromoModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, user, newIndex,
      pointModel, statusOutletModel, bannerModel, boxPromoModel);

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
    required TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)
        success,
    required TResult Function(String? message) error,
  }) {
    return success(model, user, newIndex, pointModel, statusOutletModel,
        bannerModel, boxPromoModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult? Function(String? message)? error,
  }) {
    return success?.call(model, user, newIndex, pointModel, statusOutletModel,
        bannerModel, boxPromoModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model, user, newIndex, pointModel, statusOutletModel,
          bannerModel, boxPromoModel);
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
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements HomeState {
  const factory _Success(
      {final MostPopularProductResponseModel? model,
      final CurrentUserModel? user,
      final int? newIndex,
      final UserPointResponseModel? pointModel,
      final StatusOutletResponseModel? statusOutletModel,
      final BannerResponseModel? bannerModel,
      final BoxPromoResponseModel? boxPromoModel}) = _$SuccessImpl;

  MostPopularProductResponseModel? get model;
  CurrentUserModel? get user;
  int? get newIndex;
  UserPointResponseModel? get pointModel;
  StatusOutletResponseModel? get statusOutletModel;
  BannerResponseModel? get bannerModel;
  BoxPromoResponseModel? get boxPromoModel;
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
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'HomeState.error(message: $message)';
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
    required TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)
        success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            MostPopularProductResponseModel? model,
            CurrentUserModel? user,
            int? newIndex,
            UserPointResponseModel? pointModel,
            StatusOutletResponseModel? statusOutletModel,
            BannerResponseModel? bannerModel,
            BoxPromoResponseModel? boxPromoModel)?
        success,
    TResult Function(String? message)? error,
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
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HomeState {
  const factory _Error({final String? message}) = _$ErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
