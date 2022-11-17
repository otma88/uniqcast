// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BaseState<State> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State> value) initial,
    required TResult Function(_Loading<State> value) loading,
    required TResult Function(_Data<State> value) data,
    required TResult Function(_Error<State> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<State, $Res> {
  factory $BaseStateCopyWith(
          BaseState<State> value, $Res Function(BaseState<State>) then) =
      _$BaseStateCopyWithImpl<State, $Res>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<State, $Res>
    implements $BaseStateCopyWith<State, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  final BaseState<State> _value;
  // ignore: unused_field
  final $Res Function(BaseState<State>) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<State, $Res> {
  factory _$$_InitialCopyWith(
          _$_Initial<State> value, $Res Function(_$_Initial<State>) then) =
      __$$_InitialCopyWithImpl<State, $Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<State, $Res>
    extends _$BaseStateCopyWithImpl<State, $Res>
    implements _$$_InitialCopyWith<State, $Res> {
  __$$_InitialCopyWithImpl(
      _$_Initial<State> _value, $Res Function(_$_Initial<State>) _then)
      : super(_value, (v) => _then(v as _$_Initial<State>));

  @override
  _$_Initial<State> get _value => super._value as _$_Initial<State>;
}

/// @nodoc

class _$_Initial<State> implements _Initial<State> {
  const _$_Initial();

  @override
  String toString() {
    return 'BaseState<$State>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial<State>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(Failure failure) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
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
    required TResult Function(_Initial<State> value) initial,
    required TResult Function(_Loading<State> value) loading,
    required TResult Function(_Data<State> value) data,
    required TResult Function(_Error<State> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<State> implements BaseState<State> {
  const factory _Initial() = _$_Initial<State>;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<State, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<State> value, $Res Function(_$_Loading<State>) then) =
      __$$_LoadingCopyWithImpl<State, $Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<State, $Res>
    extends _$BaseStateCopyWithImpl<State, $Res>
    implements _$$_LoadingCopyWith<State, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<State> _value, $Res Function(_$_Loading<State>) _then)
      : super(_value, (v) => _then(v as _$_Loading<State>));

  @override
  _$_Loading<State> get _value => super._value as _$_Loading<State>;
}

/// @nodoc

class _$_Loading<State> implements _Loading<State> {
  const _$_Loading();

  @override
  String toString() {
    return 'BaseState<$State>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading<State>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
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
    required TResult Function(_Initial<State> value) initial,
    required TResult Function(_Loading<State> value) loading,
    required TResult Function(_Data<State> value) data,
    required TResult Function(_Error<State> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<State> implements BaseState<State> {
  const factory _Loading() = _$_Loading<State>;
}

/// @nodoc
abstract class _$$_DataCopyWith<State, $Res> {
  factory _$$_DataCopyWith(
          _$_Data<State> value, $Res Function(_$_Data<State>) then) =
      __$$_DataCopyWithImpl<State, $Res>;
  $Res call({State data});
}

/// @nodoc
class __$$_DataCopyWithImpl<State, $Res>
    extends _$BaseStateCopyWithImpl<State, $Res>
    implements _$$_DataCopyWith<State, $Res> {
  __$$_DataCopyWithImpl(
      _$_Data<State> _value, $Res Function(_$_Data<State>) _then)
      : super(_value, (v) => _then(v as _$_Data<State>));

  @override
  _$_Data<State> get _value => super._value as _$_Data<State>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_Data<State>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as State,
    ));
  }
}

/// @nodoc

class _$_Data<State> implements _Data<State> {
  const _$_Data(this.data);

  @override
  final State data;

  @override
  String toString() {
    return 'BaseState<$State>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data<State> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_DataCopyWith<State, _$_Data<State>> get copyWith =>
      __$$_DataCopyWithImpl<State, _$_Data<State>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(Failure failure) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State> value) initial,
    required TResult Function(_Loading<State> value) loading,
    required TResult Function(_Data<State> value) data,
    required TResult Function(_Error<State> value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _Data<State> implements BaseState<State> {
  const factory _Data(final State data) = _$_Data<State>;

  State get data;
  @JsonKey(ignore: true)
  _$$_DataCopyWith<State, _$_Data<State>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<State, $Res> {
  factory _$$_ErrorCopyWith(
          _$_Error<State> value, $Res Function(_$_Error<State>) then) =
      __$$_ErrorCopyWithImpl<State, $Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<State, $Res>
    extends _$BaseStateCopyWithImpl<State, $Res>
    implements _$$_ErrorCopyWith<State, $Res> {
  __$$_ErrorCopyWithImpl(
      _$_Error<State> _value, $Res Function(_$_Error<State>) _then)
      : super(_value, (v) => _then(v as _$_Error<State>));

  @override
  _$_Error<State> get _value => super._value as _$_Error<State>;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$_Error<State>(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_Error<State> implements _Error<State> {
  const _$_Error(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'BaseState<$State>.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error<State> &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<State, _$_Error<State>> get copyWith =>
      __$$_ErrorCopyWithImpl<State, _$_Error<State>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(State data) data,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(State data)? data,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<State> value) initial,
    required TResult Function(_Loading<State> value) loading,
    required TResult Function(_Data<State> value) data,
    required TResult Function(_Error<State> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<State> value)? initial,
    TResult Function(_Loading<State> value)? loading,
    TResult Function(_Data<State> value)? data,
    TResult Function(_Error<State> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<State> implements BaseState<State> {
  const factory _Error(final Failure failure) = _$_Error<State>;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<State, _$_Error<State>> get copyWith =>
      throw _privateConstructorUsedError;
}
