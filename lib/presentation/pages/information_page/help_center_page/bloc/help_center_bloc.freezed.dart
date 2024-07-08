// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_center_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HelpCenterEvent {
  int? get index => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? index) togglePanel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? index)? togglePanel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? index)? togglePanel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TogglePanel value) togglePanel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TogglePanel value)? togglePanel,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TogglePanel value)? togglePanel,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HelpCenterEventCopyWith<HelpCenterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpCenterEventCopyWith<$Res> {
  factory $HelpCenterEventCopyWith(
          HelpCenterEvent value, $Res Function(HelpCenterEvent) then) =
      _$HelpCenterEventCopyWithImpl<$Res, HelpCenterEvent>;
  @useResult
  $Res call({int? index});
}

/// @nodoc
class _$HelpCenterEventCopyWithImpl<$Res, $Val extends HelpCenterEvent>
    implements $HelpCenterEventCopyWith<$Res> {
  _$HelpCenterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TogglePanelImplCopyWith<$Res>
    implements $HelpCenterEventCopyWith<$Res> {
  factory _$$TogglePanelImplCopyWith(
          _$TogglePanelImpl value, $Res Function(_$TogglePanelImpl) then) =
      __$$TogglePanelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? index});
}

/// @nodoc
class __$$TogglePanelImplCopyWithImpl<$Res>
    extends _$HelpCenterEventCopyWithImpl<$Res, _$TogglePanelImpl>
    implements _$$TogglePanelImplCopyWith<$Res> {
  __$$TogglePanelImplCopyWithImpl(
      _$TogglePanelImpl _value, $Res Function(_$TogglePanelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$TogglePanelImpl(
      freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TogglePanelImpl implements _TogglePanel {
  const _$TogglePanelImpl(this.index);

  @override
  final int? index;

  @override
  String toString() {
    return 'HelpCenterEvent.togglePanel(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TogglePanelImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TogglePanelImplCopyWith<_$TogglePanelImpl> get copyWith =>
      __$$TogglePanelImplCopyWithImpl<_$TogglePanelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? index) togglePanel,
  }) {
    return togglePanel(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? index)? togglePanel,
  }) {
    return togglePanel?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? index)? togglePanel,
    required TResult orElse(),
  }) {
    if (togglePanel != null) {
      return togglePanel(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TogglePanel value) togglePanel,
  }) {
    return togglePanel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TogglePanel value)? togglePanel,
  }) {
    return togglePanel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TogglePanel value)? togglePanel,
    required TResult orElse(),
  }) {
    if (togglePanel != null) {
      return togglePanel(this);
    }
    return orElse();
  }
}

abstract class _TogglePanel implements HelpCenterEvent {
  const factory _TogglePanel(final int? index) = _$TogglePanelImpl;

  @override
  int? get index;
  @override
  @JsonKey(ignore: true)
  _$$TogglePanelImplCopyWith<_$TogglePanelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HelpCenterState {
  List<bool> get isExpanded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HelpCenterStateCopyWith<HelpCenterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpCenterStateCopyWith<$Res> {
  factory $HelpCenterStateCopyWith(
          HelpCenterState value, $Res Function(HelpCenterState) then) =
      _$HelpCenterStateCopyWithImpl<$Res, HelpCenterState>;
  @useResult
  $Res call({List<bool> isExpanded});
}

/// @nodoc
class _$HelpCenterStateCopyWithImpl<$Res, $Val extends HelpCenterState>
    implements $HelpCenterStateCopyWith<$Res> {
  _$HelpCenterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HelpCenterStateImplCopyWith<$Res>
    implements $HelpCenterStateCopyWith<$Res> {
  factory _$$HelpCenterStateImplCopyWith(_$HelpCenterStateImpl value,
          $Res Function(_$HelpCenterStateImpl) then) =
      __$$HelpCenterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<bool> isExpanded});
}

/// @nodoc
class __$$HelpCenterStateImplCopyWithImpl<$Res>
    extends _$HelpCenterStateCopyWithImpl<$Res, _$HelpCenterStateImpl>
    implements _$$HelpCenterStateImplCopyWith<$Res> {
  __$$HelpCenterStateImplCopyWithImpl(
      _$HelpCenterStateImpl _value, $Res Function(_$HelpCenterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
  }) {
    return _then(_$HelpCenterStateImpl(
      isExpanded: null == isExpanded
          ? _value._isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as List<bool>,
    ));
  }
}

/// @nodoc

class _$HelpCenterStateImpl implements _HelpCenterState {
  const _$HelpCenterStateImpl({required final List<bool> isExpanded})
      : _isExpanded = isExpanded;

  final List<bool> _isExpanded;
  @override
  List<bool> get isExpanded {
    if (_isExpanded is EqualUnmodifiableListView) return _isExpanded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_isExpanded);
  }

  @override
  String toString() {
    return 'HelpCenterState(isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelpCenterStateImpl &&
            const DeepCollectionEquality()
                .equals(other._isExpanded, _isExpanded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_isExpanded));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HelpCenterStateImplCopyWith<_$HelpCenterStateImpl> get copyWith =>
      __$$HelpCenterStateImplCopyWithImpl<_$HelpCenterStateImpl>(
          this, _$identity);
}

abstract class _HelpCenterState implements HelpCenterState {
  const factory _HelpCenterState({required final List<bool> isExpanded}) =
      _$HelpCenterStateImpl;

  @override
  List<bool> get isExpanded;
  @override
  @JsonKey(ignore: true)
  _$$HelpCenterStateImplCopyWith<_$HelpCenterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
