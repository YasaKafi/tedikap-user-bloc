// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_reward_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartRewardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getCart,
    required TResult Function(int? cartRewardItem, String? action) patchQty,
    required TResult Function(int? cartItem) deleteItem,
    required TResult Function(int? cartId) postOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getCart,
    TResult? Function(int? cartRewardItem, String? action)? patchQty,
    TResult? Function(int? cartItem)? deleteItem,
    TResult? Function(int? cartId)? postOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getCart,
    TResult Function(int? cartRewardItem, String? action)? patchQty,
    TResult Function(int? cartItem)? deleteItem,
    TResult Function(int? cartId)? postOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_PatchQty value) patchQty,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_PostOrder value) postOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_PatchQty value)? patchQty,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_PostOrder value)? postOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_PatchQty value)? patchQty,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_PostOrder value)? postOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartRewardEventCopyWith<$Res> {
  factory $CartRewardEventCopyWith(
          CartRewardEvent value, $Res Function(CartRewardEvent) then) =
      _$CartRewardEventCopyWithImpl<$Res, CartRewardEvent>;
}

/// @nodoc
class _$CartRewardEventCopyWithImpl<$Res, $Val extends CartRewardEvent>
    implements $CartRewardEventCopyWith<$Res> {
  _$CartRewardEventCopyWithImpl(this._value, this._then);

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
    extends _$CartRewardEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'CartRewardEvent.started()';
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
    required TResult Function() getCart,
    required TResult Function(int? cartRewardItem, String? action) patchQty,
    required TResult Function(int? cartItem) deleteItem,
    required TResult Function(int? cartId) postOrder,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getCart,
    TResult? Function(int? cartRewardItem, String? action)? patchQty,
    TResult? Function(int? cartItem)? deleteItem,
    TResult? Function(int? cartId)? postOrder,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getCart,
    TResult Function(int? cartRewardItem, String? action)? patchQty,
    TResult Function(int? cartItem)? deleteItem,
    TResult Function(int? cartId)? postOrder,
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
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_PatchQty value) patchQty,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_PostOrder value) postOrder,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_PatchQty value)? patchQty,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_PostOrder value)? postOrder,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_PatchQty value)? patchQty,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_PostOrder value)? postOrder,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CartRewardEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetCartImplCopyWith<$Res> {
  factory _$$GetCartImplCopyWith(
          _$GetCartImpl value, $Res Function(_$GetCartImpl) then) =
      __$$GetCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCartImplCopyWithImpl<$Res>
    extends _$CartRewardEventCopyWithImpl<$Res, _$GetCartImpl>
    implements _$$GetCartImplCopyWith<$Res> {
  __$$GetCartImplCopyWithImpl(
      _$GetCartImpl _value, $Res Function(_$GetCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCartImpl implements _GetCart {
  const _$GetCartImpl();

  @override
  String toString() {
    return 'CartRewardEvent.getCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getCart,
    required TResult Function(int? cartRewardItem, String? action) patchQty,
    required TResult Function(int? cartItem) deleteItem,
    required TResult Function(int? cartId) postOrder,
  }) {
    return getCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getCart,
    TResult? Function(int? cartRewardItem, String? action)? patchQty,
    TResult? Function(int? cartItem)? deleteItem,
    TResult? Function(int? cartId)? postOrder,
  }) {
    return getCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getCart,
    TResult Function(int? cartRewardItem, String? action)? patchQty,
    TResult Function(int? cartItem)? deleteItem,
    TResult Function(int? cartId)? postOrder,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_PatchQty value) patchQty,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_PostOrder value) postOrder,
  }) {
    return getCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_PatchQty value)? patchQty,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_PostOrder value)? postOrder,
  }) {
    return getCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_PatchQty value)? patchQty,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_PostOrder value)? postOrder,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart(this);
    }
    return orElse();
  }
}

abstract class _GetCart implements CartRewardEvent {
  const factory _GetCart() = _$GetCartImpl;
}

/// @nodoc
abstract class _$$PatchQtyImplCopyWith<$Res> {
  factory _$$PatchQtyImplCopyWith(
          _$PatchQtyImpl value, $Res Function(_$PatchQtyImpl) then) =
      __$$PatchQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? cartRewardItem, String? action});
}

/// @nodoc
class __$$PatchQtyImplCopyWithImpl<$Res>
    extends _$CartRewardEventCopyWithImpl<$Res, _$PatchQtyImpl>
    implements _$$PatchQtyImplCopyWith<$Res> {
  __$$PatchQtyImplCopyWithImpl(
      _$PatchQtyImpl _value, $Res Function(_$PatchQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartRewardItem = freezed,
    Object? action = freezed,
  }) {
    return _then(_$PatchQtyImpl(
      cartRewardItem: freezed == cartRewardItem
          ? _value.cartRewardItem
          : cartRewardItem // ignore: cast_nullable_to_non_nullable
              as int?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PatchQtyImpl implements _PatchQty {
  const _$PatchQtyImpl({required this.cartRewardItem, required this.action});

  @override
  final int? cartRewardItem;
  @override
  final String? action;

  @override
  String toString() {
    return 'CartRewardEvent.patchQty(cartRewardItem: $cartRewardItem, action: $action)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatchQtyImpl &&
            (identical(other.cartRewardItem, cartRewardItem) ||
                other.cartRewardItem == cartRewardItem) &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartRewardItem, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PatchQtyImplCopyWith<_$PatchQtyImpl> get copyWith =>
      __$$PatchQtyImplCopyWithImpl<_$PatchQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getCart,
    required TResult Function(int? cartRewardItem, String? action) patchQty,
    required TResult Function(int? cartItem) deleteItem,
    required TResult Function(int? cartId) postOrder,
  }) {
    return patchQty(cartRewardItem, action);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getCart,
    TResult? Function(int? cartRewardItem, String? action)? patchQty,
    TResult? Function(int? cartItem)? deleteItem,
    TResult? Function(int? cartId)? postOrder,
  }) {
    return patchQty?.call(cartRewardItem, action);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getCart,
    TResult Function(int? cartRewardItem, String? action)? patchQty,
    TResult Function(int? cartItem)? deleteItem,
    TResult Function(int? cartId)? postOrder,
    required TResult orElse(),
  }) {
    if (patchQty != null) {
      return patchQty(cartRewardItem, action);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_PatchQty value) patchQty,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_PostOrder value) postOrder,
  }) {
    return patchQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_PatchQty value)? patchQty,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_PostOrder value)? postOrder,
  }) {
    return patchQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_PatchQty value)? patchQty,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_PostOrder value)? postOrder,
    required TResult orElse(),
  }) {
    if (patchQty != null) {
      return patchQty(this);
    }
    return orElse();
  }
}

abstract class _PatchQty implements CartRewardEvent {
  const factory _PatchQty(
      {required final int? cartRewardItem,
      required final String? action}) = _$PatchQtyImpl;

  int? get cartRewardItem;
  String? get action;
  @JsonKey(ignore: true)
  _$$PatchQtyImplCopyWith<_$PatchQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteItemImplCopyWith<$Res> {
  factory _$$DeleteItemImplCopyWith(
          _$DeleteItemImpl value, $Res Function(_$DeleteItemImpl) then) =
      __$$DeleteItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? cartItem});
}

/// @nodoc
class __$$DeleteItemImplCopyWithImpl<$Res>
    extends _$CartRewardEventCopyWithImpl<$Res, _$DeleteItemImpl>
    implements _$$DeleteItemImplCopyWith<$Res> {
  __$$DeleteItemImplCopyWithImpl(
      _$DeleteItemImpl _value, $Res Function(_$DeleteItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItem = freezed,
  }) {
    return _then(_$DeleteItemImpl(
      cartItem: freezed == cartItem
          ? _value.cartItem
          : cartItem // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$DeleteItemImpl implements _DeleteItem {
  const _$DeleteItemImpl({required this.cartItem});

  @override
  final int? cartItem;

  @override
  String toString() {
    return 'CartRewardEvent.deleteItem(cartItem: $cartItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteItemImpl &&
            (identical(other.cartItem, cartItem) ||
                other.cartItem == cartItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteItemImplCopyWith<_$DeleteItemImpl> get copyWith =>
      __$$DeleteItemImplCopyWithImpl<_$DeleteItemImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getCart,
    required TResult Function(int? cartRewardItem, String? action) patchQty,
    required TResult Function(int? cartItem) deleteItem,
    required TResult Function(int? cartId) postOrder,
  }) {
    return deleteItem(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getCart,
    TResult? Function(int? cartRewardItem, String? action)? patchQty,
    TResult? Function(int? cartItem)? deleteItem,
    TResult? Function(int? cartId)? postOrder,
  }) {
    return deleteItem?.call(cartItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getCart,
    TResult Function(int? cartRewardItem, String? action)? patchQty,
    TResult Function(int? cartItem)? deleteItem,
    TResult Function(int? cartId)? postOrder,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(cartItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_PatchQty value) patchQty,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_PostOrder value) postOrder,
  }) {
    return deleteItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_PatchQty value)? patchQty,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_PostOrder value)? postOrder,
  }) {
    return deleteItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_PatchQty value)? patchQty,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_PostOrder value)? postOrder,
    required TResult orElse(),
  }) {
    if (deleteItem != null) {
      return deleteItem(this);
    }
    return orElse();
  }
}

abstract class _DeleteItem implements CartRewardEvent {
  const factory _DeleteItem({required final int? cartItem}) = _$DeleteItemImpl;

  int? get cartItem;
  @JsonKey(ignore: true)
  _$$DeleteItemImplCopyWith<_$DeleteItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostOrderImplCopyWith<$Res> {
  factory _$$PostOrderImplCopyWith(
          _$PostOrderImpl value, $Res Function(_$PostOrderImpl) then) =
      __$$PostOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? cartId});
}

/// @nodoc
class __$$PostOrderImplCopyWithImpl<$Res>
    extends _$CartRewardEventCopyWithImpl<$Res, _$PostOrderImpl>
    implements _$$PostOrderImplCopyWith<$Res> {
  __$$PostOrderImplCopyWithImpl(
      _$PostOrderImpl _value, $Res Function(_$PostOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartId = freezed,
  }) {
    return _then(_$PostOrderImpl(
      cartId: freezed == cartId
          ? _value.cartId
          : cartId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$PostOrderImpl implements _PostOrder {
  const _$PostOrderImpl({required this.cartId});

  @override
  final int? cartId;

  @override
  String toString() {
    return 'CartRewardEvent.postOrder(cartId: $cartId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostOrderImpl &&
            (identical(other.cartId, cartId) || other.cartId == cartId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostOrderImplCopyWith<_$PostOrderImpl> get copyWith =>
      __$$PostOrderImplCopyWithImpl<_$PostOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getCart,
    required TResult Function(int? cartRewardItem, String? action) patchQty,
    required TResult Function(int? cartItem) deleteItem,
    required TResult Function(int? cartId) postOrder,
  }) {
    return postOrder(cartId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getCart,
    TResult? Function(int? cartRewardItem, String? action)? patchQty,
    TResult? Function(int? cartItem)? deleteItem,
    TResult? Function(int? cartId)? postOrder,
  }) {
    return postOrder?.call(cartId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getCart,
    TResult Function(int? cartRewardItem, String? action)? patchQty,
    TResult Function(int? cartItem)? deleteItem,
    TResult Function(int? cartId)? postOrder,
    required TResult orElse(),
  }) {
    if (postOrder != null) {
      return postOrder(cartId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetCart value) getCart,
    required TResult Function(_PatchQty value) patchQty,
    required TResult Function(_DeleteItem value) deleteItem,
    required TResult Function(_PostOrder value) postOrder,
  }) {
    return postOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetCart value)? getCart,
    TResult? Function(_PatchQty value)? patchQty,
    TResult? Function(_DeleteItem value)? deleteItem,
    TResult? Function(_PostOrder value)? postOrder,
  }) {
    return postOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetCart value)? getCart,
    TResult Function(_PatchQty value)? patchQty,
    TResult Function(_DeleteItem value)? deleteItem,
    TResult Function(_PostOrder value)? postOrder,
    required TResult orElse(),
  }) {
    if (postOrder != null) {
      return postOrder(this);
    }
    return orElse();
  }
}

abstract class _PostOrder implements CartRewardEvent {
  const factory _PostOrder({required final int? cartId}) = _$PostOrderImpl;

  int? get cartId;
  @JsonKey(ignore: true)
  _$$PostOrderImplCopyWith<_$PostOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartRewardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)
        success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
        success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
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
abstract class $CartRewardStateCopyWith<$Res> {
  factory $CartRewardStateCopyWith(
          CartRewardState value, $Res Function(CartRewardState) then) =
      _$CartRewardStateCopyWithImpl<$Res, CartRewardState>;
}

/// @nodoc
class _$CartRewardStateCopyWithImpl<$Res, $Val extends CartRewardState>
    implements $CartRewardStateCopyWith<$Res> {
  _$CartRewardStateCopyWithImpl(this._value, this._then);

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
    extends _$CartRewardStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CartRewardState.initial()';
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
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

abstract class _Initial implements CartRewardState {
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
    extends _$CartRewardStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'CartRewardState.loading()';
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
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

abstract class _Loading implements CartRewardState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CartRewardResponseModel? cartModel,
      PatchQtyResponseModel? patchQtyModel,
      DeleteCartItemResponseModel? deleteModel,
      PostOrderRewardResponseModel? modelPostOrder,
      UserPointResponseModel? modelPoint});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CartRewardStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartModel = freezed,
    Object? patchQtyModel = freezed,
    Object? deleteModel = freezed,
    Object? modelPostOrder = freezed,
    Object? modelPoint = freezed,
  }) {
    return _then(_$SuccessImpl(
      cartModel: freezed == cartModel
          ? _value.cartModel
          : cartModel // ignore: cast_nullable_to_non_nullable
              as CartRewardResponseModel?,
      patchQtyModel: freezed == patchQtyModel
          ? _value.patchQtyModel
          : patchQtyModel // ignore: cast_nullable_to_non_nullable
              as PatchQtyResponseModel?,
      deleteModel: freezed == deleteModel
          ? _value.deleteModel
          : deleteModel // ignore: cast_nullable_to_non_nullable
              as DeleteCartItemResponseModel?,
      modelPostOrder: freezed == modelPostOrder
          ? _value.modelPostOrder
          : modelPostOrder // ignore: cast_nullable_to_non_nullable
              as PostOrderRewardResponseModel?,
      modelPoint: freezed == modelPoint
          ? _value.modelPoint
          : modelPoint // ignore: cast_nullable_to_non_nullable
              as UserPointResponseModel?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {required this.cartModel,
      required this.patchQtyModel,
      required this.deleteModel,
      required this.modelPostOrder,
      required this.modelPoint});

  @override
  final CartRewardResponseModel? cartModel;
  @override
  final PatchQtyResponseModel? patchQtyModel;
  @override
  final DeleteCartItemResponseModel? deleteModel;
  @override
  final PostOrderRewardResponseModel? modelPostOrder;
  @override
  final UserPointResponseModel? modelPoint;

  @override
  String toString() {
    return 'CartRewardState.success(cartModel: $cartModel, patchQtyModel: $patchQtyModel, deleteModel: $deleteModel, modelPostOrder: $modelPostOrder, modelPoint: $modelPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.cartModel, cartModel) ||
                other.cartModel == cartModel) &&
            (identical(other.patchQtyModel, patchQtyModel) ||
                other.patchQtyModel == patchQtyModel) &&
            (identical(other.deleteModel, deleteModel) ||
                other.deleteModel == deleteModel) &&
            (identical(other.modelPostOrder, modelPostOrder) ||
                other.modelPostOrder == modelPostOrder) &&
            (identical(other.modelPoint, modelPoint) ||
                other.modelPoint == modelPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartModel, patchQtyModel,
      deleteModel, modelPostOrder, modelPoint);

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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)
        success,
    required TResult Function(String? message) error,
  }) {
    return success(
        cartModel, patchQtyModel, deleteModel, modelPostOrder, modelPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
        success,
    TResult? Function(String? message)? error,
  }) {
    return success?.call(
        cartModel, patchQtyModel, deleteModel, modelPostOrder, modelPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
        success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(
          cartModel, patchQtyModel, deleteModel, modelPostOrder, modelPoint);
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

abstract class _Success implements CartRewardState {
  const factory _Success(
      {required final CartRewardResponseModel? cartModel,
      required final PatchQtyResponseModel? patchQtyModel,
      required final DeleteCartItemResponseModel? deleteModel,
      required final PostOrderRewardResponseModel? modelPostOrder,
      required final UserPointResponseModel? modelPoint}) = _$SuccessImpl;

  CartRewardResponseModel? get cartModel;
  PatchQtyResponseModel? get patchQtyModel;
  DeleteCartItemResponseModel? get deleteModel;
  PostOrderRewardResponseModel? get modelPostOrder;
  UserPointResponseModel? get modelPoint;
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
    extends _$CartRewardStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'CartRewardState.error(message: $message)';
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
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
            CartRewardResponseModel? cartModel,
            PatchQtyResponseModel? patchQtyModel,
            DeleteCartItemResponseModel? deleteModel,
            PostOrderRewardResponseModel? modelPostOrder,
            UserPointResponseModel? modelPoint)?
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

abstract class _Error implements CartRewardState {
  const factory _Error({final String? message}) = _$ErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
