// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllHistoryOrder,
    required TResult Function() getAllHistoryOrderReward,
    required TResult Function(String query) getFilterOrder,
    required TResult Function(int filterIndex, String query) doFilterOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllHistoryOrder,
    TResult? Function()? getAllHistoryOrderReward,
    TResult? Function(String query)? getFilterOrder,
    TResult? Function(int filterIndex, String query)? doFilterOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllHistoryOrder,
    TResult Function()? getAllHistoryOrderReward,
    TResult Function(String query)? getFilterOrder,
    TResult Function(int filterIndex, String query)? doFilterOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllHistoryOrder value) getAllHistoryOrder,
    required TResult Function(_GetAllHistoryOrderReward value)
        getAllHistoryOrderReward,
    required TResult Function(_GetCategoryOrder value) getFilterOrder,
    required TResult Function(_DoFilterOrder value) doFilterOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult? Function(_GetAllHistoryOrderReward value)?
        getAllHistoryOrderReward,
    TResult? Function(_GetCategoryOrder value)? getFilterOrder,
    TResult? Function(_DoFilterOrder value)? doFilterOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult Function(_GetAllHistoryOrderReward value)? getAllHistoryOrderReward,
    TResult Function(_GetCategoryOrder value)? getFilterOrder,
    TResult Function(_DoFilterOrder value)? doFilterOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
          OrderEvent value, $Res Function(OrderEvent) then) =
      _$OrderEventCopyWithImpl<$Res, OrderEvent>;
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

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
    extends _$OrderEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'OrderEvent.started()';
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
    required TResult Function() getAllHistoryOrder,
    required TResult Function() getAllHistoryOrderReward,
    required TResult Function(String query) getFilterOrder,
    required TResult Function(int filterIndex, String query) doFilterOrder,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllHistoryOrder,
    TResult? Function()? getAllHistoryOrderReward,
    TResult? Function(String query)? getFilterOrder,
    TResult? Function(int filterIndex, String query)? doFilterOrder,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllHistoryOrder,
    TResult Function()? getAllHistoryOrderReward,
    TResult Function(String query)? getFilterOrder,
    TResult Function(int filterIndex, String query)? doFilterOrder,
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
    required TResult Function(_GetAllHistoryOrder value) getAllHistoryOrder,
    required TResult Function(_GetAllHistoryOrderReward value)
        getAllHistoryOrderReward,
    required TResult Function(_GetCategoryOrder value) getFilterOrder,
    required TResult Function(_DoFilterOrder value) doFilterOrder,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult? Function(_GetAllHistoryOrderReward value)?
        getAllHistoryOrderReward,
    TResult? Function(_GetCategoryOrder value)? getFilterOrder,
    TResult? Function(_DoFilterOrder value)? doFilterOrder,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult Function(_GetAllHistoryOrderReward value)? getAllHistoryOrderReward,
    TResult Function(_GetCategoryOrder value)? getFilterOrder,
    TResult Function(_DoFilterOrder value)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OrderEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetAllHistoryOrderImplCopyWith<$Res> {
  factory _$$GetAllHistoryOrderImplCopyWith(_$GetAllHistoryOrderImpl value,
          $Res Function(_$GetAllHistoryOrderImpl) then) =
      __$$GetAllHistoryOrderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllHistoryOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$GetAllHistoryOrderImpl>
    implements _$$GetAllHistoryOrderImplCopyWith<$Res> {
  __$$GetAllHistoryOrderImplCopyWithImpl(_$GetAllHistoryOrderImpl _value,
      $Res Function(_$GetAllHistoryOrderImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllHistoryOrderImpl implements _GetAllHistoryOrder {
  const _$GetAllHistoryOrderImpl();

  @override
  String toString() {
    return 'OrderEvent.getAllHistoryOrder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllHistoryOrderImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllHistoryOrder,
    required TResult Function() getAllHistoryOrderReward,
    required TResult Function(String query) getFilterOrder,
    required TResult Function(int filterIndex, String query) doFilterOrder,
  }) {
    return getAllHistoryOrder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllHistoryOrder,
    TResult? Function()? getAllHistoryOrderReward,
    TResult? Function(String query)? getFilterOrder,
    TResult? Function(int filterIndex, String query)? doFilterOrder,
  }) {
    return getAllHistoryOrder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllHistoryOrder,
    TResult Function()? getAllHistoryOrderReward,
    TResult Function(String query)? getFilterOrder,
    TResult Function(int filterIndex, String query)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (getAllHistoryOrder != null) {
      return getAllHistoryOrder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllHistoryOrder value) getAllHistoryOrder,
    required TResult Function(_GetAllHistoryOrderReward value)
        getAllHistoryOrderReward,
    required TResult Function(_GetCategoryOrder value) getFilterOrder,
    required TResult Function(_DoFilterOrder value) doFilterOrder,
  }) {
    return getAllHistoryOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult? Function(_GetAllHistoryOrderReward value)?
        getAllHistoryOrderReward,
    TResult? Function(_GetCategoryOrder value)? getFilterOrder,
    TResult? Function(_DoFilterOrder value)? doFilterOrder,
  }) {
    return getAllHistoryOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult Function(_GetAllHistoryOrderReward value)? getAllHistoryOrderReward,
    TResult Function(_GetCategoryOrder value)? getFilterOrder,
    TResult Function(_DoFilterOrder value)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (getAllHistoryOrder != null) {
      return getAllHistoryOrder(this);
    }
    return orElse();
  }
}

abstract class _GetAllHistoryOrder implements OrderEvent {
  const factory _GetAllHistoryOrder() = _$GetAllHistoryOrderImpl;
}

/// @nodoc
abstract class _$$GetAllHistoryOrderRewardImplCopyWith<$Res> {
  factory _$$GetAllHistoryOrderRewardImplCopyWith(
          _$GetAllHistoryOrderRewardImpl value,
          $Res Function(_$GetAllHistoryOrderRewardImpl) then) =
      __$$GetAllHistoryOrderRewardImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllHistoryOrderRewardImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$GetAllHistoryOrderRewardImpl>
    implements _$$GetAllHistoryOrderRewardImplCopyWith<$Res> {
  __$$GetAllHistoryOrderRewardImplCopyWithImpl(
      _$GetAllHistoryOrderRewardImpl _value,
      $Res Function(_$GetAllHistoryOrderRewardImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllHistoryOrderRewardImpl implements _GetAllHistoryOrderReward {
  const _$GetAllHistoryOrderRewardImpl();

  @override
  String toString() {
    return 'OrderEvent.getAllHistoryOrderReward()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllHistoryOrderRewardImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllHistoryOrder,
    required TResult Function() getAllHistoryOrderReward,
    required TResult Function(String query) getFilterOrder,
    required TResult Function(int filterIndex, String query) doFilterOrder,
  }) {
    return getAllHistoryOrderReward();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllHistoryOrder,
    TResult? Function()? getAllHistoryOrderReward,
    TResult? Function(String query)? getFilterOrder,
    TResult? Function(int filterIndex, String query)? doFilterOrder,
  }) {
    return getAllHistoryOrderReward?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllHistoryOrder,
    TResult Function()? getAllHistoryOrderReward,
    TResult Function(String query)? getFilterOrder,
    TResult Function(int filterIndex, String query)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (getAllHistoryOrderReward != null) {
      return getAllHistoryOrderReward();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllHistoryOrder value) getAllHistoryOrder,
    required TResult Function(_GetAllHistoryOrderReward value)
        getAllHistoryOrderReward,
    required TResult Function(_GetCategoryOrder value) getFilterOrder,
    required TResult Function(_DoFilterOrder value) doFilterOrder,
  }) {
    return getAllHistoryOrderReward(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult? Function(_GetAllHistoryOrderReward value)?
        getAllHistoryOrderReward,
    TResult? Function(_GetCategoryOrder value)? getFilterOrder,
    TResult? Function(_DoFilterOrder value)? doFilterOrder,
  }) {
    return getAllHistoryOrderReward?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult Function(_GetAllHistoryOrderReward value)? getAllHistoryOrderReward,
    TResult Function(_GetCategoryOrder value)? getFilterOrder,
    TResult Function(_DoFilterOrder value)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (getAllHistoryOrderReward != null) {
      return getAllHistoryOrderReward(this);
    }
    return orElse();
  }
}

abstract class _GetAllHistoryOrderReward implements OrderEvent {
  const factory _GetAllHistoryOrderReward() = _$GetAllHistoryOrderRewardImpl;
}

/// @nodoc
abstract class _$$GetCategoryOrderImplCopyWith<$Res> {
  factory _$$GetCategoryOrderImplCopyWith(_$GetCategoryOrderImpl value,
          $Res Function(_$GetCategoryOrderImpl) then) =
      __$$GetCategoryOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetCategoryOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$GetCategoryOrderImpl>
    implements _$$GetCategoryOrderImplCopyWith<$Res> {
  __$$GetCategoryOrderImplCopyWithImpl(_$GetCategoryOrderImpl _value,
      $Res Function(_$GetCategoryOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetCategoryOrderImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetCategoryOrderImpl implements _GetCategoryOrder {
  const _$GetCategoryOrderImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'OrderEvent.getFilterOrder(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCategoryOrderImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCategoryOrderImplCopyWith<_$GetCategoryOrderImpl> get copyWith =>
      __$$GetCategoryOrderImplCopyWithImpl<_$GetCategoryOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllHistoryOrder,
    required TResult Function() getAllHistoryOrderReward,
    required TResult Function(String query) getFilterOrder,
    required TResult Function(int filterIndex, String query) doFilterOrder,
  }) {
    return getFilterOrder(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllHistoryOrder,
    TResult? Function()? getAllHistoryOrderReward,
    TResult? Function(String query)? getFilterOrder,
    TResult? Function(int filterIndex, String query)? doFilterOrder,
  }) {
    return getFilterOrder?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllHistoryOrder,
    TResult Function()? getAllHistoryOrderReward,
    TResult Function(String query)? getFilterOrder,
    TResult Function(int filterIndex, String query)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (getFilterOrder != null) {
      return getFilterOrder(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllHistoryOrder value) getAllHistoryOrder,
    required TResult Function(_GetAllHistoryOrderReward value)
        getAllHistoryOrderReward,
    required TResult Function(_GetCategoryOrder value) getFilterOrder,
    required TResult Function(_DoFilterOrder value) doFilterOrder,
  }) {
    return getFilterOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult? Function(_GetAllHistoryOrderReward value)?
        getAllHistoryOrderReward,
    TResult? Function(_GetCategoryOrder value)? getFilterOrder,
    TResult? Function(_DoFilterOrder value)? doFilterOrder,
  }) {
    return getFilterOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult Function(_GetAllHistoryOrderReward value)? getAllHistoryOrderReward,
    TResult Function(_GetCategoryOrder value)? getFilterOrder,
    TResult Function(_DoFilterOrder value)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (getFilterOrder != null) {
      return getFilterOrder(this);
    }
    return orElse();
  }
}

abstract class _GetCategoryOrder implements OrderEvent {
  const factory _GetCategoryOrder(final String query) = _$GetCategoryOrderImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$GetCategoryOrderImplCopyWith<_$GetCategoryOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoFilterOrderImplCopyWith<$Res> {
  factory _$$DoFilterOrderImplCopyWith(
          _$DoFilterOrderImpl value, $Res Function(_$DoFilterOrderImpl) then) =
      __$$DoFilterOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int filterIndex, String query});
}

/// @nodoc
class __$$DoFilterOrderImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$DoFilterOrderImpl>
    implements _$$DoFilterOrderImplCopyWith<$Res> {
  __$$DoFilterOrderImplCopyWithImpl(
      _$DoFilterOrderImpl _value, $Res Function(_$DoFilterOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterIndex = null,
    Object? query = null,
  }) {
    return _then(_$DoFilterOrderImpl(
      filterIndex: null == filterIndex
          ? _value.filterIndex
          : filterIndex // ignore: cast_nullable_to_non_nullable
              as int,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DoFilterOrderImpl implements _DoFilterOrder {
  const _$DoFilterOrderImpl({required this.filterIndex, required this.query});

  @override
  final int filterIndex;
  @override
  final String query;

  @override
  String toString() {
    return 'OrderEvent.doFilterOrder(filterIndex: $filterIndex, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoFilterOrderImpl &&
            (identical(other.filterIndex, filterIndex) ||
                other.filterIndex == filterIndex) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterIndex, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoFilterOrderImplCopyWith<_$DoFilterOrderImpl> get copyWith =>
      __$$DoFilterOrderImplCopyWithImpl<_$DoFilterOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllHistoryOrder,
    required TResult Function() getAllHistoryOrderReward,
    required TResult Function(String query) getFilterOrder,
    required TResult Function(int filterIndex, String query) doFilterOrder,
  }) {
    return doFilterOrder(filterIndex, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllHistoryOrder,
    TResult? Function()? getAllHistoryOrderReward,
    TResult? Function(String query)? getFilterOrder,
    TResult? Function(int filterIndex, String query)? doFilterOrder,
  }) {
    return doFilterOrder?.call(filterIndex, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllHistoryOrder,
    TResult Function()? getAllHistoryOrderReward,
    TResult Function(String query)? getFilterOrder,
    TResult Function(int filterIndex, String query)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (doFilterOrder != null) {
      return doFilterOrder(filterIndex, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetAllHistoryOrder value) getAllHistoryOrder,
    required TResult Function(_GetAllHistoryOrderReward value)
        getAllHistoryOrderReward,
    required TResult Function(_GetCategoryOrder value) getFilterOrder,
    required TResult Function(_DoFilterOrder value) doFilterOrder,
  }) {
    return doFilterOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult? Function(_GetAllHistoryOrderReward value)?
        getAllHistoryOrderReward,
    TResult? Function(_GetCategoryOrder value)? getFilterOrder,
    TResult? Function(_DoFilterOrder value)? doFilterOrder,
  }) {
    return doFilterOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetAllHistoryOrder value)? getAllHistoryOrder,
    TResult Function(_GetAllHistoryOrderReward value)? getAllHistoryOrderReward,
    TResult Function(_GetCategoryOrder value)? getFilterOrder,
    TResult Function(_DoFilterOrder value)? doFilterOrder,
    required TResult orElse(),
  }) {
    if (doFilterOrder != null) {
      return doFilterOrder(this);
    }
    return orElse();
  }
}

abstract class _DoFilterOrder implements OrderEvent {
  const factory _DoFilterOrder(
      {required final int filterIndex,
      required final String query}) = _$DoFilterOrderImpl;

  int get filterIndex;
  String get query;
  @JsonKey(ignore: true)
  _$$DoFilterOrderImplCopyWith<_$DoFilterOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)
        success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
        success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
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
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

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
    extends _$OrderStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OrderState.initial()';
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
    required TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)
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
    TResult? Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
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
    TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
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

abstract class _Initial implements OrderState {
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
    extends _$OrderStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'OrderState.loading()';
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
    required TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)
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
    TResult? Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
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
    TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
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

abstract class _Loading implements OrderState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {HistoryOrderResponseModel? model,
      HistoryOrderRewardResponseModel? modelReward,
      int filterIndex});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? modelReward = freezed,
    Object? filterIndex = null,
  }) {
    return _then(_$SuccessImpl(
      freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as HistoryOrderResponseModel?,
      freezed == modelReward
          ? _value.modelReward
          : modelReward // ignore: cast_nullable_to_non_nullable
              as HistoryOrderRewardResponseModel?,
      null == filterIndex
          ? _value.filterIndex
          : filterIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.model, this.modelReward, this.filterIndex);

  @override
  final HistoryOrderResponseModel? model;
  @override
  final HistoryOrderRewardResponseModel? modelReward;
  @override
  final int filterIndex;

  @override
  String toString() {
    return 'OrderState.success(model: $model, modelReward: $modelReward, filterIndex: $filterIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.modelReward, modelReward) ||
                other.modelReward == modelReward) &&
            (identical(other.filterIndex, filterIndex) ||
                other.filterIndex == filterIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, modelReward, filterIndex);

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
    required TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)
        success,
    required TResult Function(String? message) error,
  }) {
    return success(model, modelReward, filterIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
        success,
    TResult? Function(String? message)? error,
  }) {
    return success?.call(model, modelReward, filterIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
        success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model, modelReward, filterIndex);
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

abstract class _Success implements OrderState {
  const factory _Success(
      final HistoryOrderResponseModel? model,
      final HistoryOrderRewardResponseModel? modelReward,
      final int filterIndex) = _$SuccessImpl;

  HistoryOrderResponseModel? get model;
  HistoryOrderRewardResponseModel? get modelReward;
  int get filterIndex;
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
    extends _$OrderStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'OrderState.error(message: $message)';
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
    required TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)
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
    TResult? Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
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
    TResult Function(HistoryOrderResponseModel? model,
            HistoryOrderRewardResponseModel? modelReward, int filterIndex)?
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

abstract class _Error implements OrderState {
  const factory _Error({final String? message}) = _$ErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
