// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? index) pageChanged,
    required TResult Function() skipOnboard,
    required TResult Function() onPressedButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? index)? pageChanged,
    TResult? Function()? skipOnboard,
    TResult? Function()? onPressedButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? index)? pageChanged,
    TResult Function()? skipOnboard,
    TResult Function()? onPressedButton,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_SkipOnboard value) skipOnboard,
    required TResult Function(_OnPressedButton value) onPressedButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_SkipOnboard value)? skipOnboard,
    TResult? Function(_OnPressedButton value)? onPressedButton,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageChanged value)? pageChanged,
    TResult Function(_SkipOnboard value)? skipOnboard,
    TResult Function(_OnPressedButton value)? onPressedButton,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardEventCopyWith<$Res> {
  factory $OnboardEventCopyWith(
          OnboardEvent value, $Res Function(OnboardEvent) then) =
      _$OnboardEventCopyWithImpl<$Res, OnboardEvent>;
}

/// @nodoc
class _$OnboardEventCopyWithImpl<$Res, $Val extends OnboardEvent>
    implements $OnboardEventCopyWith<$Res> {
  _$OnboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PageChangedImplCopyWith<$Res> {
  factory _$$PageChangedImplCopyWith(
          _$PageChangedImpl value, $Res Function(_$PageChangedImpl) then) =
      __$$PageChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? index});
}

/// @nodoc
class __$$PageChangedImplCopyWithImpl<$Res>
    extends _$OnboardEventCopyWithImpl<$Res, _$PageChangedImpl>
    implements _$$PageChangedImplCopyWith<$Res> {
  __$$PageChangedImplCopyWithImpl(
      _$PageChangedImpl _value, $Res Function(_$PageChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$PageChangedImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$PageChangedImpl implements _PageChanged {
  const _$PageChangedImpl({this.index});

  @override
  final int? index;

  @override
  String toString() {
    return 'OnboardEvent.pageChanged(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageChangedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageChangedImplCopyWith<_$PageChangedImpl> get copyWith =>
      __$$PageChangedImplCopyWithImpl<_$PageChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? index) pageChanged,
    required TResult Function() skipOnboard,
    required TResult Function() onPressedButton,
  }) {
    return pageChanged(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? index)? pageChanged,
    TResult? Function()? skipOnboard,
    TResult? Function()? onPressedButton,
  }) {
    return pageChanged?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? index)? pageChanged,
    TResult Function()? skipOnboard,
    TResult Function()? onPressedButton,
    required TResult orElse(),
  }) {
    if (pageChanged != null) {
      return pageChanged(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_SkipOnboard value) skipOnboard,
    required TResult Function(_OnPressedButton value) onPressedButton,
  }) {
    return pageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_SkipOnboard value)? skipOnboard,
    TResult? Function(_OnPressedButton value)? onPressedButton,
  }) {
    return pageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageChanged value)? pageChanged,
    TResult Function(_SkipOnboard value)? skipOnboard,
    TResult Function(_OnPressedButton value)? onPressedButton,
    required TResult orElse(),
  }) {
    if (pageChanged != null) {
      return pageChanged(this);
    }
    return orElse();
  }
}

abstract class _PageChanged implements OnboardEvent {
  const factory _PageChanged({final int? index}) = _$PageChangedImpl;

  int? get index;
  @JsonKey(ignore: true)
  _$$PageChangedImplCopyWith<_$PageChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SkipOnboardImplCopyWith<$Res> {
  factory _$$SkipOnboardImplCopyWith(
          _$SkipOnboardImpl value, $Res Function(_$SkipOnboardImpl) then) =
      __$$SkipOnboardImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SkipOnboardImplCopyWithImpl<$Res>
    extends _$OnboardEventCopyWithImpl<$Res, _$SkipOnboardImpl>
    implements _$$SkipOnboardImplCopyWith<$Res> {
  __$$SkipOnboardImplCopyWithImpl(
      _$SkipOnboardImpl _value, $Res Function(_$SkipOnboardImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SkipOnboardImpl implements _SkipOnboard {
  const _$SkipOnboardImpl();

  @override
  String toString() {
    return 'OnboardEvent.skipOnboard()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SkipOnboardImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? index) pageChanged,
    required TResult Function() skipOnboard,
    required TResult Function() onPressedButton,
  }) {
    return skipOnboard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? index)? pageChanged,
    TResult? Function()? skipOnboard,
    TResult? Function()? onPressedButton,
  }) {
    return skipOnboard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? index)? pageChanged,
    TResult Function()? skipOnboard,
    TResult Function()? onPressedButton,
    required TResult orElse(),
  }) {
    if (skipOnboard != null) {
      return skipOnboard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_SkipOnboard value) skipOnboard,
    required TResult Function(_OnPressedButton value) onPressedButton,
  }) {
    return skipOnboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_SkipOnboard value)? skipOnboard,
    TResult? Function(_OnPressedButton value)? onPressedButton,
  }) {
    return skipOnboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageChanged value)? pageChanged,
    TResult Function(_SkipOnboard value)? skipOnboard,
    TResult Function(_OnPressedButton value)? onPressedButton,
    required TResult orElse(),
  }) {
    if (skipOnboard != null) {
      return skipOnboard(this);
    }
    return orElse();
  }
}

abstract class _SkipOnboard implements OnboardEvent {
  const factory _SkipOnboard() = _$SkipOnboardImpl;
}

/// @nodoc
abstract class _$$OnPressedButtonImplCopyWith<$Res> {
  factory _$$OnPressedButtonImplCopyWith(_$OnPressedButtonImpl value,
          $Res Function(_$OnPressedButtonImpl) then) =
      __$$OnPressedButtonImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnPressedButtonImplCopyWithImpl<$Res>
    extends _$OnboardEventCopyWithImpl<$Res, _$OnPressedButtonImpl>
    implements _$$OnPressedButtonImplCopyWith<$Res> {
  __$$OnPressedButtonImplCopyWithImpl(
      _$OnPressedButtonImpl _value, $Res Function(_$OnPressedButtonImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OnPressedButtonImpl implements _OnPressedButton {
  const _$OnPressedButtonImpl();

  @override
  String toString() {
    return 'OnboardEvent.onPressedButton()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnPressedButtonImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? index) pageChanged,
    required TResult Function() skipOnboard,
    required TResult Function() onPressedButton,
  }) {
    return onPressedButton();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? index)? pageChanged,
    TResult? Function()? skipOnboard,
    TResult? Function()? onPressedButton,
  }) {
    return onPressedButton?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? index)? pageChanged,
    TResult Function()? skipOnboard,
    TResult Function()? onPressedButton,
    required TResult orElse(),
  }) {
    if (onPressedButton != null) {
      return onPressedButton();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PageChanged value) pageChanged,
    required TResult Function(_SkipOnboard value) skipOnboard,
    required TResult Function(_OnPressedButton value) onPressedButton,
  }) {
    return onPressedButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PageChanged value)? pageChanged,
    TResult? Function(_SkipOnboard value)? skipOnboard,
    TResult? Function(_OnPressedButton value)? onPressedButton,
  }) {
    return onPressedButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PageChanged value)? pageChanged,
    TResult Function(_SkipOnboard value)? skipOnboard,
    TResult Function(_OnPressedButton value)? onPressedButton,
    required TResult orElse(),
  }) {
    if (onPressedButton != null) {
      return onPressedButton(this);
    }
    return orElse();
  }
}

abstract class _OnPressedButton implements OnboardEvent {
  const factory _OnPressedButton() = _$OnPressedButtonImpl;
}

/// @nodoc
mixin _$OnboardState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? pageIndex) initial,
    required TResult Function() finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? pageIndex)? initial,
    TResult? Function()? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? pageIndex)? initial,
    TResult Function()? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardStateCopyWith<$Res> {
  factory $OnboardStateCopyWith(
          OnboardState value, $Res Function(OnboardState) then) =
      _$OnboardStateCopyWithImpl<$Res, OnboardState>;
}

/// @nodoc
class _$OnboardStateCopyWithImpl<$Res, $Val extends OnboardState>
    implements $OnboardStateCopyWith<$Res> {
  _$OnboardStateCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({int? pageIndex});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$OnboardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = freezed,
  }) {
    return _then(_$InitialImpl(
      pageIndex: freezed == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.pageIndex});

  @override
  final int? pageIndex;

  @override
  String toString() {
    return 'OnboardState.initial(pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? pageIndex) initial,
    required TResult Function() finished,
  }) {
    return initial(pageIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? pageIndex)? initial,
    TResult? Function()? finished,
  }) {
    return initial?.call(pageIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? pageIndex)? initial,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(pageIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements OnboardState {
  const factory _Initial({final int? pageIndex}) = _$InitialImpl;

  int? get pageIndex;
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishedImplCopyWith<$Res> {
  factory _$$FinishedImplCopyWith(
          _$FinishedImpl value, $Res Function(_$FinishedImpl) then) =
      __$$FinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishedImplCopyWithImpl<$Res>
    extends _$OnboardStateCopyWithImpl<$Res, _$FinishedImpl>
    implements _$$FinishedImplCopyWith<$Res> {
  __$$FinishedImplCopyWithImpl(
      _$FinishedImpl _value, $Res Function(_$FinishedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FinishedImpl implements _Finished {
  const _$FinishedImpl();

  @override
  String toString() {
    return 'OnboardState.finished()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? pageIndex) initial,
    required TResult Function() finished,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? pageIndex)? initial,
    TResult? Function()? finished,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? pageIndex)? initial,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Finished value) finished,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Finished value)? finished,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _Finished implements OnboardState {
  const factory _Finished() = _$FinishedImpl;
}
