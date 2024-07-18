// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId) getDetailHistoryOrder,
    required TResult Function(String orderRewardId) getDetailHistoryOrderReward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId)? getDetailHistoryOrder,
    TResult? Function(String orderRewardId)? getDetailHistoryOrderReward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId)? getDetailHistoryOrder,
    TResult Function(String orderRewardId)? getDetailHistoryOrderReward,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDetailHistoryOrder value)
        getDetailHistoryOrder,
    required TResult Function(_GetDetailHistoryOrderReward value)
        getDetailHistoryOrderReward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDetailHistoryOrder value)? getDetailHistoryOrder,
    TResult? Function(_GetDetailHistoryOrderReward value)?
        getDetailHistoryOrderReward,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDetailHistoryOrder value)? getDetailHistoryOrder,
    TResult Function(_GetDetailHistoryOrderReward value)?
        getDetailHistoryOrderReward,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailOrderEventCopyWith<$Res> {
  factory $DetailOrderEventCopyWith(
          DetailOrderEvent value, $Res Function(DetailOrderEvent) then) =
      _$DetailOrderEventCopyWithImpl<$Res, DetailOrderEvent>;
}

/// @nodoc
class _$DetailOrderEventCopyWithImpl<$Res, $Val extends DetailOrderEvent>
    implements $DetailOrderEventCopyWith<$Res> {
  _$DetailOrderEventCopyWithImpl(this._value, this._then);

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
    extends _$DetailOrderEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'DetailOrderEvent.started()';
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
    required TResult Function(String orderId) getDetailHistoryOrder,
    required TResult Function(String orderRewardId) getDetailHistoryOrderReward,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId)? getDetailHistoryOrder,
    TResult? Function(String orderRewardId)? getDetailHistoryOrderReward,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId)? getDetailHistoryOrder,
    TResult Function(String orderRewardId)? getDetailHistoryOrderReward,
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
    required TResult Function(_GetDetailHistoryOrder value)
        getDetailHistoryOrder,
    required TResult Function(_GetDetailHistoryOrderReward value)
        getDetailHistoryOrderReward,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDetailHistoryOrder value)? getDetailHistoryOrder,
    TResult? Function(_GetDetailHistoryOrderReward value)?
        getDetailHistoryOrderReward,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDetailHistoryOrder value)? getDetailHistoryOrder,
    TResult Function(_GetDetailHistoryOrderReward value)?
        getDetailHistoryOrderReward,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DetailOrderEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetDetailHistoryOrderImplCopyWith<$Res> {
  factory _$$GetDetailHistoryOrderImplCopyWith(
          _$GetDetailHistoryOrderImpl value,
          $Res Function(_$GetDetailHistoryOrderImpl) then) =
      __$$GetDetailHistoryOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$GetDetailHistoryOrderImplCopyWithImpl<$Res>
    extends _$DetailOrderEventCopyWithImpl<$Res, _$GetDetailHistoryOrderImpl>
    implements _$$GetDetailHistoryOrderImplCopyWith<$Res> {
  __$$GetDetailHistoryOrderImplCopyWithImpl(_$GetDetailHistoryOrderImpl _value,
      $Res Function(_$GetDetailHistoryOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
  }) {
    return _then(_$GetDetailHistoryOrderImpl(
      null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetDetailHistoryOrderImpl implements _GetDetailHistoryOrder {
  const _$GetDetailHistoryOrderImpl(this.orderId);

  @override
  final String orderId;

  @override
  String toString() {
    return 'DetailOrderEvent.getDetailHistoryOrder(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailHistoryOrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailHistoryOrderImplCopyWith<_$GetDetailHistoryOrderImpl>
      get copyWith => __$$GetDetailHistoryOrderImplCopyWithImpl<
          _$GetDetailHistoryOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId) getDetailHistoryOrder,
    required TResult Function(String orderRewardId) getDetailHistoryOrderReward,
  }) {
    return getDetailHistoryOrder(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId)? getDetailHistoryOrder,
    TResult? Function(String orderRewardId)? getDetailHistoryOrderReward,
  }) {
    return getDetailHistoryOrder?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId)? getDetailHistoryOrder,
    TResult Function(String orderRewardId)? getDetailHistoryOrderReward,
    required TResult orElse(),
  }) {
    if (getDetailHistoryOrder != null) {
      return getDetailHistoryOrder(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDetailHistoryOrder value)
        getDetailHistoryOrder,
    required TResult Function(_GetDetailHistoryOrderReward value)
        getDetailHistoryOrderReward,
  }) {
    return getDetailHistoryOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDetailHistoryOrder value)? getDetailHistoryOrder,
    TResult? Function(_GetDetailHistoryOrderReward value)?
        getDetailHistoryOrderReward,
  }) {
    return getDetailHistoryOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDetailHistoryOrder value)? getDetailHistoryOrder,
    TResult Function(_GetDetailHistoryOrderReward value)?
        getDetailHistoryOrderReward,
    required TResult orElse(),
  }) {
    if (getDetailHistoryOrder != null) {
      return getDetailHistoryOrder(this);
    }
    return orElse();
  }
}

abstract class _GetDetailHistoryOrder implements DetailOrderEvent {
  const factory _GetDetailHistoryOrder(final String orderId) =
      _$GetDetailHistoryOrderImpl;

  String get orderId;
  @JsonKey(ignore: true)
  _$$GetDetailHistoryOrderImplCopyWith<_$GetDetailHistoryOrderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDetailHistoryOrderRewardImplCopyWith<$Res> {
  factory _$$GetDetailHistoryOrderRewardImplCopyWith(
          _$GetDetailHistoryOrderRewardImpl value,
          $Res Function(_$GetDetailHistoryOrderRewardImpl) then) =
      __$$GetDetailHistoryOrderRewardImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderRewardId});
}

/// @nodoc
class __$$GetDetailHistoryOrderRewardImplCopyWithImpl<$Res>
    extends _$DetailOrderEventCopyWithImpl<$Res,
        _$GetDetailHistoryOrderRewardImpl>
    implements _$$GetDetailHistoryOrderRewardImplCopyWith<$Res> {
  __$$GetDetailHistoryOrderRewardImplCopyWithImpl(
      _$GetDetailHistoryOrderRewardImpl _value,
      $Res Function(_$GetDetailHistoryOrderRewardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderRewardId = null,
  }) {
    return _then(_$GetDetailHistoryOrderRewardImpl(
      null == orderRewardId
          ? _value.orderRewardId
          : orderRewardId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetDetailHistoryOrderRewardImpl
    implements _GetDetailHistoryOrderReward {
  const _$GetDetailHistoryOrderRewardImpl(this.orderRewardId);

  @override
  final String orderRewardId;

  @override
  String toString() {
    return 'DetailOrderEvent.getDetailHistoryOrderReward(orderRewardId: $orderRewardId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailHistoryOrderRewardImpl &&
            (identical(other.orderRewardId, orderRewardId) ||
                other.orderRewardId == orderRewardId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderRewardId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailHistoryOrderRewardImplCopyWith<_$GetDetailHistoryOrderRewardImpl>
      get copyWith => __$$GetDetailHistoryOrderRewardImplCopyWithImpl<
          _$GetDetailHistoryOrderRewardImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId) getDetailHistoryOrder,
    required TResult Function(String orderRewardId) getDetailHistoryOrderReward,
  }) {
    return getDetailHistoryOrderReward(orderRewardId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId)? getDetailHistoryOrder,
    TResult? Function(String orderRewardId)? getDetailHistoryOrderReward,
  }) {
    return getDetailHistoryOrderReward?.call(orderRewardId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId)? getDetailHistoryOrder,
    TResult Function(String orderRewardId)? getDetailHistoryOrderReward,
    required TResult orElse(),
  }) {
    if (getDetailHistoryOrderReward != null) {
      return getDetailHistoryOrderReward(orderRewardId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetDetailHistoryOrder value)
        getDetailHistoryOrder,
    required TResult Function(_GetDetailHistoryOrderReward value)
        getDetailHistoryOrderReward,
  }) {
    return getDetailHistoryOrderReward(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetDetailHistoryOrder value)? getDetailHistoryOrder,
    TResult? Function(_GetDetailHistoryOrderReward value)?
        getDetailHistoryOrderReward,
  }) {
    return getDetailHistoryOrderReward?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetDetailHistoryOrder value)? getDetailHistoryOrder,
    TResult Function(_GetDetailHistoryOrderReward value)?
        getDetailHistoryOrderReward,
    required TResult orElse(),
  }) {
    if (getDetailHistoryOrderReward != null) {
      return getDetailHistoryOrderReward(this);
    }
    return orElse();
  }
}

abstract class _GetDetailHistoryOrderReward implements DetailOrderEvent {
  const factory _GetDetailHistoryOrderReward(final String orderRewardId) =
      _$GetDetailHistoryOrderRewardImpl;

  String get orderRewardId;
  @JsonKey(ignore: true)
  _$$GetDetailHistoryOrderRewardImplCopyWith<_$GetDetailHistoryOrderRewardImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)
        success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
        success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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
abstract class $DetailOrderStateCopyWith<$Res> {
  factory $DetailOrderStateCopyWith(
          DetailOrderState value, $Res Function(DetailOrderState) then) =
      _$DetailOrderStateCopyWithImpl<$Res, DetailOrderState>;
}

/// @nodoc
class _$DetailOrderStateCopyWithImpl<$Res, $Val extends DetailOrderState>
    implements $DetailOrderStateCopyWith<$Res> {
  _$DetailOrderStateCopyWithImpl(this._value, this._then);

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
    extends _$DetailOrderStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'DetailOrderState.initial()';
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
    required TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)
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
    TResult? Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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
    TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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

abstract class _Initial implements DetailOrderState {
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
    extends _$DetailOrderStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'DetailOrderState.loading()';
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
    required TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)
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
    TResult? Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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
    TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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

abstract class _Loading implements DetailOrderState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DetailHistoryOrderResponseModel? model,
      DetailHistoryOrderRewardResponseModel? modelReward});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$DetailOrderStateCopyWithImpl<$Res, _$SuccessImpl>
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
              as DetailHistoryOrderResponseModel?,
      freezed == modelReward
          ? _value.modelReward
          : modelReward // ignore: cast_nullable_to_non_nullable
              as DetailHistoryOrderRewardResponseModel?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.model, this.modelReward);

  @override
  final DetailHistoryOrderResponseModel? model;
  @override
  final DetailHistoryOrderRewardResponseModel? modelReward;

  @override
  String toString() {
    return 'DetailOrderState.success(model: $model, modelReward: $modelReward)';
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
    required TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)
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
    TResult? Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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
    TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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

abstract class _Success implements DetailOrderState {
  const factory _Success(final DetailHistoryOrderResponseModel? model,
      final DetailHistoryOrderRewardResponseModel? modelReward) = _$SuccessImpl;

  DetailHistoryOrderResponseModel? get model;
  DetailHistoryOrderRewardResponseModel? get modelReward;
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
    extends _$DetailOrderStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'DetailOrderState.error(message: $message)';
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
    required TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)
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
    TResult? Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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
    TResult Function(DetailHistoryOrderResponseModel? model,
            DetailHistoryOrderRewardResponseModel? modelReward)?
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

abstract class _Error implements DetailOrderState {
  const factory _Error({final String? message}) = _$ErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
