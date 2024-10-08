// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MenuEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProduct,
    required TResult Function(String query) getFilterCategory,
    required TResult Function(String query) getFilterSearch,
    required TResult Function() clearSearch,
    required TResult Function(int index, String? searchQuery) tabSwitched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProduct,
    TResult? Function(String query)? getFilterCategory,
    TResult? Function(String query)? getFilterSearch,
    TResult? Function()? clearSearch,
    TResult? Function(int index, String? searchQuery)? tabSwitched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProduct,
    TResult Function(String query)? getFilterCategory,
    TResult Function(String query)? getFilterSearch,
    TResult Function()? clearSearch,
    TResult Function(int index, String? searchQuery)? tabSwitched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetFilterCategory value) getFilterCategory,
    required TResult Function(_GetSearchCategory value) getFilterSearch,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_TabSwitched value) tabSwitched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetFilterCategory value)? getFilterCategory,
    TResult? Function(_GetSearchCategory value)? getFilterSearch,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_TabSwitched value)? tabSwitched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetFilterCategory value)? getFilterCategory,
    TResult Function(_GetSearchCategory value)? getFilterSearch,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_TabSwitched value)? tabSwitched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuEventCopyWith<$Res> {
  factory $MenuEventCopyWith(MenuEvent value, $Res Function(MenuEvent) then) =
      _$MenuEventCopyWithImpl<$Res, MenuEvent>;
}

/// @nodoc
class _$MenuEventCopyWithImpl<$Res, $Val extends MenuEvent>
    implements $MenuEventCopyWith<$Res> {
  _$MenuEventCopyWithImpl(this._value, this._then);

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
    extends _$MenuEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'MenuEvent.started()';
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
    required TResult Function() getProduct,
    required TResult Function(String query) getFilterCategory,
    required TResult Function(String query) getFilterSearch,
    required TResult Function() clearSearch,
    required TResult Function(int index, String? searchQuery) tabSwitched,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProduct,
    TResult? Function(String query)? getFilterCategory,
    TResult? Function(String query)? getFilterSearch,
    TResult? Function()? clearSearch,
    TResult? Function(int index, String? searchQuery)? tabSwitched,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProduct,
    TResult Function(String query)? getFilterCategory,
    TResult Function(String query)? getFilterSearch,
    TResult Function()? clearSearch,
    TResult Function(int index, String? searchQuery)? tabSwitched,
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
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetFilterCategory value) getFilterCategory,
    required TResult Function(_GetSearchCategory value) getFilterSearch,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_TabSwitched value) tabSwitched,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetFilterCategory value)? getFilterCategory,
    TResult? Function(_GetSearchCategory value)? getFilterSearch,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_TabSwitched value)? tabSwitched,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetFilterCategory value)? getFilterCategory,
    TResult Function(_GetSearchCategory value)? getFilterSearch,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_TabSwitched value)? tabSwitched,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements MenuEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetProductImplCopyWith<$Res> {
  factory _$$GetProductImplCopyWith(
          _$GetProductImpl value, $Res Function(_$GetProductImpl) then) =
      __$$GetProductImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProductImplCopyWithImpl<$Res>
    extends _$MenuEventCopyWithImpl<$Res, _$GetProductImpl>
    implements _$$GetProductImplCopyWith<$Res> {
  __$$GetProductImplCopyWithImpl(
      _$GetProductImpl _value, $Res Function(_$GetProductImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetProductImpl implements _GetProduct {
  const _$GetProductImpl();

  @override
  String toString() {
    return 'MenuEvent.getProduct()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProductImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProduct,
    required TResult Function(String query) getFilterCategory,
    required TResult Function(String query) getFilterSearch,
    required TResult Function() clearSearch,
    required TResult Function(int index, String? searchQuery) tabSwitched,
  }) {
    return getProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProduct,
    TResult? Function(String query)? getFilterCategory,
    TResult? Function(String query)? getFilterSearch,
    TResult? Function()? clearSearch,
    TResult? Function(int index, String? searchQuery)? tabSwitched,
  }) {
    return getProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProduct,
    TResult Function(String query)? getFilterCategory,
    TResult Function(String query)? getFilterSearch,
    TResult Function()? clearSearch,
    TResult Function(int index, String? searchQuery)? tabSwitched,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetFilterCategory value) getFilterCategory,
    required TResult Function(_GetSearchCategory value) getFilterSearch,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_TabSwitched value) tabSwitched,
  }) {
    return getProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetFilterCategory value)? getFilterCategory,
    TResult? Function(_GetSearchCategory value)? getFilterSearch,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_TabSwitched value)? tabSwitched,
  }) {
    return getProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetFilterCategory value)? getFilterCategory,
    TResult Function(_GetSearchCategory value)? getFilterSearch,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_TabSwitched value)? tabSwitched,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct(this);
    }
    return orElse();
  }
}

abstract class _GetProduct implements MenuEvent {
  const factory _GetProduct() = _$GetProductImpl;
}

/// @nodoc
abstract class _$$GetFilterCategoryImplCopyWith<$Res> {
  factory _$$GetFilterCategoryImplCopyWith(_$GetFilterCategoryImpl value,
          $Res Function(_$GetFilterCategoryImpl) then) =
      __$$GetFilterCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetFilterCategoryImplCopyWithImpl<$Res>
    extends _$MenuEventCopyWithImpl<$Res, _$GetFilterCategoryImpl>
    implements _$$GetFilterCategoryImplCopyWith<$Res> {
  __$$GetFilterCategoryImplCopyWithImpl(_$GetFilterCategoryImpl _value,
      $Res Function(_$GetFilterCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetFilterCategoryImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetFilterCategoryImpl implements _GetFilterCategory {
  const _$GetFilterCategoryImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'MenuEvent.getFilterCategory(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFilterCategoryImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFilterCategoryImplCopyWith<_$GetFilterCategoryImpl> get copyWith =>
      __$$GetFilterCategoryImplCopyWithImpl<_$GetFilterCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProduct,
    required TResult Function(String query) getFilterCategory,
    required TResult Function(String query) getFilterSearch,
    required TResult Function() clearSearch,
    required TResult Function(int index, String? searchQuery) tabSwitched,
  }) {
    return getFilterCategory(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProduct,
    TResult? Function(String query)? getFilterCategory,
    TResult? Function(String query)? getFilterSearch,
    TResult? Function()? clearSearch,
    TResult? Function(int index, String? searchQuery)? tabSwitched,
  }) {
    return getFilterCategory?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProduct,
    TResult Function(String query)? getFilterCategory,
    TResult Function(String query)? getFilterSearch,
    TResult Function()? clearSearch,
    TResult Function(int index, String? searchQuery)? tabSwitched,
    required TResult orElse(),
  }) {
    if (getFilterCategory != null) {
      return getFilterCategory(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetFilterCategory value) getFilterCategory,
    required TResult Function(_GetSearchCategory value) getFilterSearch,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_TabSwitched value) tabSwitched,
  }) {
    return getFilterCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetFilterCategory value)? getFilterCategory,
    TResult? Function(_GetSearchCategory value)? getFilterSearch,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_TabSwitched value)? tabSwitched,
  }) {
    return getFilterCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetFilterCategory value)? getFilterCategory,
    TResult Function(_GetSearchCategory value)? getFilterSearch,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_TabSwitched value)? tabSwitched,
    required TResult orElse(),
  }) {
    if (getFilterCategory != null) {
      return getFilterCategory(this);
    }
    return orElse();
  }
}

abstract class _GetFilterCategory implements MenuEvent {
  const factory _GetFilterCategory(final String query) =
      _$GetFilterCategoryImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$GetFilterCategoryImplCopyWith<_$GetFilterCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSearchCategoryImplCopyWith<$Res> {
  factory _$$GetSearchCategoryImplCopyWith(_$GetSearchCategoryImpl value,
          $Res Function(_$GetSearchCategoryImpl) then) =
      __$$GetSearchCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetSearchCategoryImplCopyWithImpl<$Res>
    extends _$MenuEventCopyWithImpl<$Res, _$GetSearchCategoryImpl>
    implements _$$GetSearchCategoryImplCopyWith<$Res> {
  __$$GetSearchCategoryImplCopyWithImpl(_$GetSearchCategoryImpl _value,
      $Res Function(_$GetSearchCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetSearchCategoryImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSearchCategoryImpl implements _GetSearchCategory {
  const _$GetSearchCategoryImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'MenuEvent.getFilterSearch(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchCategoryImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchCategoryImplCopyWith<_$GetSearchCategoryImpl> get copyWith =>
      __$$GetSearchCategoryImplCopyWithImpl<_$GetSearchCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProduct,
    required TResult Function(String query) getFilterCategory,
    required TResult Function(String query) getFilterSearch,
    required TResult Function() clearSearch,
    required TResult Function(int index, String? searchQuery) tabSwitched,
  }) {
    return getFilterSearch(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProduct,
    TResult? Function(String query)? getFilterCategory,
    TResult? Function(String query)? getFilterSearch,
    TResult? Function()? clearSearch,
    TResult? Function(int index, String? searchQuery)? tabSwitched,
  }) {
    return getFilterSearch?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProduct,
    TResult Function(String query)? getFilterCategory,
    TResult Function(String query)? getFilterSearch,
    TResult Function()? clearSearch,
    TResult Function(int index, String? searchQuery)? tabSwitched,
    required TResult orElse(),
  }) {
    if (getFilterSearch != null) {
      return getFilterSearch(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetFilterCategory value) getFilterCategory,
    required TResult Function(_GetSearchCategory value) getFilterSearch,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_TabSwitched value) tabSwitched,
  }) {
    return getFilterSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetFilterCategory value)? getFilterCategory,
    TResult? Function(_GetSearchCategory value)? getFilterSearch,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_TabSwitched value)? tabSwitched,
  }) {
    return getFilterSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetFilterCategory value)? getFilterCategory,
    TResult Function(_GetSearchCategory value)? getFilterSearch,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_TabSwitched value)? tabSwitched,
    required TResult orElse(),
  }) {
    if (getFilterSearch != null) {
      return getFilterSearch(this);
    }
    return orElse();
  }
}

abstract class _GetSearchCategory implements MenuEvent {
  const factory _GetSearchCategory(final String query) =
      _$GetSearchCategoryImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$GetSearchCategoryImplCopyWith<_$GetSearchCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$MenuEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'MenuEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProduct,
    required TResult Function(String query) getFilterCategory,
    required TResult Function(String query) getFilterSearch,
    required TResult Function() clearSearch,
    required TResult Function(int index, String? searchQuery) tabSwitched,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProduct,
    TResult? Function(String query)? getFilterCategory,
    TResult? Function(String query)? getFilterSearch,
    TResult? Function()? clearSearch,
    TResult? Function(int index, String? searchQuery)? tabSwitched,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProduct,
    TResult Function(String query)? getFilterCategory,
    TResult Function(String query)? getFilterSearch,
    TResult Function()? clearSearch,
    TResult Function(int index, String? searchQuery)? tabSwitched,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetFilterCategory value) getFilterCategory,
    required TResult Function(_GetSearchCategory value) getFilterSearch,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_TabSwitched value) tabSwitched,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetFilterCategory value)? getFilterCategory,
    TResult? Function(_GetSearchCategory value)? getFilterSearch,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_TabSwitched value)? tabSwitched,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetFilterCategory value)? getFilterCategory,
    TResult Function(_GetSearchCategory value)? getFilterSearch,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_TabSwitched value)? tabSwitched,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements MenuEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$TabSwitchedImplCopyWith<$Res> {
  factory _$$TabSwitchedImplCopyWith(
          _$TabSwitchedImpl value, $Res Function(_$TabSwitchedImpl) then) =
      __$$TabSwitchedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, String? searchQuery});
}

/// @nodoc
class __$$TabSwitchedImplCopyWithImpl<$Res>
    extends _$MenuEventCopyWithImpl<$Res, _$TabSwitchedImpl>
    implements _$$TabSwitchedImplCopyWith<$Res> {
  __$$TabSwitchedImplCopyWithImpl(
      _$TabSwitchedImpl _value, $Res Function(_$TabSwitchedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? searchQuery = freezed,
  }) {
    return _then(_$TabSwitchedImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TabSwitchedImpl implements _TabSwitched {
  const _$TabSwitchedImpl(this.index, {this.searchQuery});

  @override
  final int index;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'MenuEvent.tabSwitched(index: $index, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabSwitchedImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, searchQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabSwitchedImplCopyWith<_$TabSwitchedImpl> get copyWith =>
      __$$TabSwitchedImplCopyWithImpl<_$TabSwitchedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProduct,
    required TResult Function(String query) getFilterCategory,
    required TResult Function(String query) getFilterSearch,
    required TResult Function() clearSearch,
    required TResult Function(int index, String? searchQuery) tabSwitched,
  }) {
    return tabSwitched(index, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProduct,
    TResult? Function(String query)? getFilterCategory,
    TResult? Function(String query)? getFilterSearch,
    TResult? Function()? clearSearch,
    TResult? Function(int index, String? searchQuery)? tabSwitched,
  }) {
    return tabSwitched?.call(index, searchQuery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProduct,
    TResult Function(String query)? getFilterCategory,
    TResult Function(String query)? getFilterSearch,
    TResult Function()? clearSearch,
    TResult Function(int index, String? searchQuery)? tabSwitched,
    required TResult orElse(),
  }) {
    if (tabSwitched != null) {
      return tabSwitched(index, searchQuery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetFilterCategory value) getFilterCategory,
    required TResult Function(_GetSearchCategory value) getFilterSearch,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_TabSwitched value) tabSwitched,
  }) {
    return tabSwitched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetFilterCategory value)? getFilterCategory,
    TResult? Function(_GetSearchCategory value)? getFilterSearch,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_TabSwitched value)? tabSwitched,
  }) {
    return tabSwitched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetFilterCategory value)? getFilterCategory,
    TResult Function(_GetSearchCategory value)? getFilterSearch,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_TabSwitched value)? tabSwitched,
    required TResult orElse(),
  }) {
    if (tabSwitched != null) {
      return tabSwitched(this);
    }
    return orElse();
  }
}

abstract class _TabSwitched implements MenuEvent {
  const factory _TabSwitched(final int index, {final String? searchQuery}) =
      _$TabSwitchedImpl;

  int get index;
  String? get searchQuery;
  @JsonKey(ignore: true)
  _$$TabSwitchedImplCopyWith<_$TabSwitchedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MenuState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductsResponseModel? model, bool isSearching)
        success,
    required TResult Function(String? message) error,
    required TResult Function() empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult? Function(String? message)? error,
    TResult? Function()? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult Function(String? message)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Empty value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuStateCopyWith<$Res> {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) then) =
      _$MenuStateCopyWithImpl<$Res, MenuState>;
}

/// @nodoc
class _$MenuStateCopyWithImpl<$Res, $Val extends MenuState>
    implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._value, this._then);

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
    extends _$MenuStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'MenuState.initial()';
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
    required TResult Function(ProductsResponseModel? model, bool isSearching)
        success,
    required TResult Function(String? message) error,
    required TResult Function() empty,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult? Function(String? message)? error,
    TResult? Function()? empty,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult Function(String? message)? error,
    TResult Function()? empty,
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
    required TResult Function(_Empty value) empty,
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
    TResult? Function(_Empty value)? empty,
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
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MenuState {
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
    extends _$MenuStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'MenuState.loading()';
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
    required TResult Function(ProductsResponseModel? model, bool isSearching)
        success,
    required TResult Function(String? message) error,
    required TResult Function() empty,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult? Function(String? message)? error,
    TResult? Function()? empty,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult Function(String? message)? error,
    TResult Function()? empty,
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
    required TResult Function(_Empty value) empty,
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
    TResult? Function(_Empty value)? empty,
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
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MenuState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductsResponseModel? model, bool isSearching});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$MenuStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? isSearching = null,
  }) {
    return _then(_$SuccessImpl(
      freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as ProductsResponseModel?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.model, {this.isSearching = false});

  @override
  final ProductsResponseModel? model;
  @override
  @JsonKey()
  final bool isSearching;

  @override
  String toString() {
    return 'MenuState.success(model: $model, isSearching: $isSearching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model, isSearching);

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
    required TResult Function(ProductsResponseModel? model, bool isSearching)
        success,
    required TResult Function(String? message) error,
    required TResult Function() empty,
  }) {
    return success(model, isSearching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult? Function(String? message)? error,
    TResult? Function()? empty,
  }) {
    return success?.call(model, isSearching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult Function(String? message)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(model, isSearching);
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
    required TResult Function(_Empty value) empty,
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
    TResult? Function(_Empty value)? empty,
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
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements MenuState {
  const factory _Success(final ProductsResponseModel? model,
      {final bool isSearching}) = _$SuccessImpl;

  ProductsResponseModel? get model;
  bool get isSearching;
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
    extends _$MenuStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'MenuState.error(message: $message)';
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
    required TResult Function(ProductsResponseModel? model, bool isSearching)
        success,
    required TResult Function(String? message) error,
    required TResult Function() empty,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult? Function(String? message)? error,
    TResult? Function()? empty,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult Function(String? message)? error,
    TResult Function()? empty,
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
    required TResult Function(_Empty value) empty,
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
    TResult? Function(_Empty value)? empty,
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
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MenuState {
  const factory _Error({final String? message}) = _$ErrorImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$MenuStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyImpl implements _Empty {
  const _$EmptyImpl();

  @override
  String toString() {
    return 'MenuState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ProductsResponseModel? model, bool isSearching)
        success,
    required TResult Function(String? message) error,
    required TResult Function() empty,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult? Function(String? message)? error,
    TResult? Function()? empty,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ProductsResponseModel? model, bool isSearching)? success,
    TResult Function(String? message)? error,
    TResult Function()? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
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
    required TResult Function(_Empty value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Empty value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Empty value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements MenuState {
  const factory _Empty() = _$EmptyImpl;
}
