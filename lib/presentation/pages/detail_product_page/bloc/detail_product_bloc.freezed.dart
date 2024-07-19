// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int productId) getDetailProduct,
    required TResult Function(int productRewardId) getDetailProductReward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int productId)? getDetailProduct,
    TResult? Function(int productRewardId)? getDetailProductReward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int productId)? getDetailProduct,
    TResult Function(int productRewardId)? getDetailProductReward,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDetailProduct value) getDetailProduct,
    required TResult Function(_GetDetailProductReward value)
        getDetailProductReward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDetailProduct value)? getDetailProduct,
    TResult? Function(_GetDetailProductReward value)? getDetailProductReward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDetailProduct value)? getDetailProduct,
    TResult Function(_GetDetailProductReward value)? getDetailProductReward,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailProductEventCopyWith<$Res> {
  factory $DetailProductEventCopyWith(
          DetailProductEvent value, $Res Function(DetailProductEvent) then) =
      _$DetailProductEventCopyWithImpl<$Res, DetailProductEvent>;
}

/// @nodoc
class _$DetailProductEventCopyWithImpl<$Res, $Val extends DetailProductEvent>
    implements $DetailProductEventCopyWith<$Res> {
  _$DetailProductEventCopyWithImpl(this._value, this._then);

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
    extends _$DetailProductEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'DetailProductEvent.started()';
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
    required TResult Function(int productId) getDetailProduct,
    required TResult Function(int productRewardId) getDetailProductReward,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int productId)? getDetailProduct,
    TResult? Function(int productRewardId)? getDetailProductReward,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int productId)? getDetailProduct,
    TResult Function(int productRewardId)? getDetailProductReward,
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
    required TResult Function(_GetDetailProduct value) getDetailProduct,
    required TResult Function(_GetDetailProductReward value)
        getDetailProductReward,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDetailProduct value)? getDetailProduct,
    TResult? Function(_GetDetailProductReward value)? getDetailProductReward,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDetailProduct value)? getDetailProduct,
    TResult Function(_GetDetailProductReward value)? getDetailProductReward,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DetailProductEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetDetailProductImplCopyWith<$Res> {
  factory _$$GetDetailProductImplCopyWith(_$GetDetailProductImpl value,
          $Res Function(_$GetDetailProductImpl) then) =
      __$$GetDetailProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$$GetDetailProductImplCopyWithImpl<$Res>
    extends _$DetailProductEventCopyWithImpl<$Res, _$GetDetailProductImpl>
    implements _$$GetDetailProductImplCopyWith<$Res> {
  __$$GetDetailProductImplCopyWithImpl(_$GetDetailProductImpl _value,
      $Res Function(_$GetDetailProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$GetDetailProductImpl(
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetDetailProductImpl implements _GetDetailProduct {
  const _$GetDetailProductImpl(this.productId);

  @override
  final int productId;

  @override
  String toString() {
    return 'DetailProductEvent.getDetailProduct(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailProductImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailProductImplCopyWith<_$GetDetailProductImpl> get copyWith =>
      __$$GetDetailProductImplCopyWithImpl<_$GetDetailProductImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int productId) getDetailProduct,
    required TResult Function(int productRewardId) getDetailProductReward,
  }) {
    return getDetailProduct(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int productId)? getDetailProduct,
    TResult? Function(int productRewardId)? getDetailProductReward,
  }) {
    return getDetailProduct?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int productId)? getDetailProduct,
    TResult Function(int productRewardId)? getDetailProductReward,
    required TResult orElse(),
  }) {
    if (getDetailProduct != null) {
      return getDetailProduct(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDetailProduct value) getDetailProduct,
    required TResult Function(_GetDetailProductReward value)
        getDetailProductReward,
  }) {
    return getDetailProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDetailProduct value)? getDetailProduct,
    TResult? Function(_GetDetailProductReward value)? getDetailProductReward,
  }) {
    return getDetailProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDetailProduct value)? getDetailProduct,
    TResult Function(_GetDetailProductReward value)? getDetailProductReward,
    required TResult orElse(),
  }) {
    if (getDetailProduct != null) {
      return getDetailProduct(this);
    }
    return orElse();
  }
}

abstract class _GetDetailProduct implements DetailProductEvent {
  const factory _GetDetailProduct(final int productId) = _$GetDetailProductImpl;

  int get productId;
  @JsonKey(ignore: true)
  _$$GetDetailProductImplCopyWith<_$GetDetailProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDetailProductRewardImplCopyWith<$Res> {
  factory _$$GetDetailProductRewardImplCopyWith(
          _$GetDetailProductRewardImpl value,
          $Res Function(_$GetDetailProductRewardImpl) then) =
      __$$GetDetailProductRewardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productRewardId});
}

/// @nodoc
class __$$GetDetailProductRewardImplCopyWithImpl<$Res>
    extends _$DetailProductEventCopyWithImpl<$Res, _$GetDetailProductRewardImpl>
    implements _$$GetDetailProductRewardImplCopyWith<$Res> {
  __$$GetDetailProductRewardImplCopyWithImpl(
      _$GetDetailProductRewardImpl _value,
      $Res Function(_$GetDetailProductRewardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRewardId = null,
  }) {
    return _then(_$GetDetailProductRewardImpl(
      null == productRewardId
          ? _value.productRewardId
          : productRewardId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetDetailProductRewardImpl implements _GetDetailProductReward {
  const _$GetDetailProductRewardImpl(this.productRewardId);

  @override
  final int productRewardId;

  @override
  String toString() {
    return 'DetailProductEvent.getDetailProductReward(productRewardId: $productRewardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailProductRewardImpl &&
            (identical(other.productRewardId, productRewardId) ||
                other.productRewardId == productRewardId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRewardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailProductRewardImplCopyWith<_$GetDetailProductRewardImpl>
      get copyWith => __$$GetDetailProductRewardImplCopyWithImpl<
          _$GetDetailProductRewardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int productId) getDetailProduct,
    required TResult Function(int productRewardId) getDetailProductReward,
  }) {
    return getDetailProductReward(productRewardId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int productId)? getDetailProduct,
    TResult? Function(int productRewardId)? getDetailProductReward,
  }) {
    return getDetailProductReward?.call(productRewardId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int productId)? getDetailProduct,
    TResult Function(int productRewardId)? getDetailProductReward,
    required TResult orElse(),
  }) {
    if (getDetailProductReward != null) {
      return getDetailProductReward(productRewardId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDetailProduct value) getDetailProduct,
    required TResult Function(_GetDetailProductReward value)
        getDetailProductReward,
  }) {
    return getDetailProductReward(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDetailProduct value)? getDetailProduct,
    TResult? Function(_GetDetailProductReward value)? getDetailProductReward,
  }) {
    return getDetailProductReward?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDetailProduct value)? getDetailProduct,
    TResult Function(_GetDetailProductReward value)? getDetailProductReward,
    required TResult orElse(),
  }) {
    if (getDetailProductReward != null) {
      return getDetailProductReward(this);
    }
    return orElse();
  }
}

abstract class _GetDetailProductReward implements DetailProductEvent {
  const factory _GetDetailProductReward(final int productRewardId) =
      _$GetDetailProductRewardImpl;

  int get productRewardId;
  @JsonKey(ignore: true)
  _$$GetDetailProductRewardImplCopyWith<_$GetDetailProductRewardImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)
        success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
        success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
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
abstract class $DetailProductStateCopyWith<$Res> {
  factory $DetailProductStateCopyWith(
          DetailProductState value, $Res Function(DetailProductState) then) =
      _$DetailProductStateCopyWithImpl<$Res, DetailProductState>;
}

/// @nodoc
class _$DetailProductStateCopyWithImpl<$Res, $Val extends DetailProductState>
    implements $DetailProductStateCopyWith<$Res> {
  _$DetailProductStateCopyWithImpl(this._value, this._then);

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
    extends _$DetailProductStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DetailProductState.initial()';
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
    required TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)
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
    TResult? Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
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
    TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
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

abstract class _Initial implements DetailProductState {
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
    extends _$DetailProductStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'DetailProductState.loading()';
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
    required TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)
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
    TResult? Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
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
    TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
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

abstract class _Loading implements DetailProductState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DetailProductResponseModel? model,
      DetailProductRewardResponseModel? modelReward});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$DetailProductStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? modelReward = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as DetailProductResponseModel?,
      freezed == modelReward
          ? _value.modelReward
          : modelReward // ignore: cast_nullable_to_non_nullable
              as DetailProductRewardResponseModel?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.model, this.modelReward);

  @override
  final DetailProductResponseModel? model;
  @override
  final DetailProductRewardResponseModel? modelReward;

  @override
  String toString() {
    return 'DetailProductState.success(model: $model, modelReward: $modelReward)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.modelReward, modelReward) ||
                other.modelReward == modelReward));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, modelReward);

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
    required TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)
        success,
    required TResult Function(String? message) error,
  }) {
    return success(model, modelReward);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
        success,
    TResult? Function(String? message)? error,
  }) {
    return success?.call(model, modelReward);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
        success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model, modelReward);
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

abstract class _Success implements DetailProductState {
  const factory _Success(final DetailProductResponseModel? model,
      final DetailProductRewardResponseModel? modelReward) = _$SuccessImpl;

  DetailProductResponseModel? get model;
  DetailProductRewardResponseModel? get modelReward;
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
    extends _$DetailProductStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'DetailProductState.error(message: $message)';
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
    required TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)
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
    TResult? Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
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
    TResult Function(DetailProductResponseModel? model,
            DetailProductRewardResponseModel? modelReward)?
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

abstract class _Error implements DetailProductState {
  const factory _Error({final String? message}) = _$ErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
