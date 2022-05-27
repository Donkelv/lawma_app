// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$AuthStateInitial value) initial,
    required TResult Function(_$AuthStateAuthenticated value) authenticated,
    required TResult Function(_$AuthStateUnauthenticated value) unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$AuthStateInitial value)? initial,
    TResult Function(_$AuthStateAuthenticated value)? authenticated,
    TResult Function(_$AuthStateUnauthenticated value)? unauthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$AuthStateInitial value)? initial,
    TResult Function(_$AuthStateAuthenticated value)? authenticated,
    TResult Function(_$AuthStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class _$$_$AuthStateInitialCopyWith<$Res> {
  factory _$$_$AuthStateInitialCopyWith(_$_$AuthStateInitial value,
          $Res Function(_$_$AuthStateInitial) then) =
      __$$_$AuthStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_$AuthStateInitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_$AuthStateInitialCopyWith<$Res> {
  __$$_$AuthStateInitialCopyWithImpl(
      _$_$AuthStateInitial _value, $Res Function(_$_$AuthStateInitial) _then)
      : super(_value, (v) => _then(v as _$_$AuthStateInitial));

  @override
  _$_$AuthStateInitial get _value => super._value as _$_$AuthStateInitial;
}

/// @nodoc

class _$_$AuthStateInitial implements _$AuthStateInitial {
  const _$_$AuthStateInitial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_$AuthStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
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
    required TResult Function(_$AuthStateInitial value) initial,
    required TResult Function(_$AuthStateAuthenticated value) authenticated,
    required TResult Function(_$AuthStateUnauthenticated value) unauthenticated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$AuthStateInitial value)? initial,
    TResult Function(_$AuthStateAuthenticated value)? authenticated,
    TResult Function(_$AuthStateUnauthenticated value)? unauthenticated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$AuthStateInitial value)? initial,
    TResult Function(_$AuthStateAuthenticated value)? authenticated,
    TResult Function(_$AuthStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _$AuthStateInitial implements AuthState {
  const factory _$AuthStateInitial() = _$_$AuthStateInitial;
}

/// @nodoc
abstract class _$$_$AuthStateAuthenticatedCopyWith<$Res> {
  factory _$$_$AuthStateAuthenticatedCopyWith(_$_$AuthStateAuthenticated value,
          $Res Function(_$_$AuthStateAuthenticated) then) =
      __$$_$AuthStateAuthenticatedCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class __$$_$AuthStateAuthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_$AuthStateAuthenticatedCopyWith<$Res> {
  __$$_$AuthStateAuthenticatedCopyWithImpl(_$_$AuthStateAuthenticated _value,
      $Res Function(_$_$AuthStateAuthenticated) _then)
      : super(_value, (v) => _then(v as _$_$AuthStateAuthenticated));

  @override
  _$_$AuthStateAuthenticated get _value =>
      super._value as _$_$AuthStateAuthenticated;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$_$AuthStateAuthenticated(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_$AuthStateAuthenticated implements _$AuthStateAuthenticated {
  const _$_$AuthStateAuthenticated(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$AuthStateAuthenticated &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$$_$AuthStateAuthenticatedCopyWith<_$_$AuthStateAuthenticated>
      get copyWith =>
          __$$_$AuthStateAuthenticatedCopyWithImpl<_$_$AuthStateAuthenticated>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$AuthStateInitial value) initial,
    required TResult Function(_$AuthStateAuthenticated value) authenticated,
    required TResult Function(_$AuthStateUnauthenticated value) unauthenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$AuthStateInitial value)? initial,
    TResult Function(_$AuthStateAuthenticated value)? authenticated,
    TResult Function(_$AuthStateUnauthenticated value)? unauthenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$AuthStateInitial value)? initial,
    TResult Function(_$AuthStateAuthenticated value)? authenticated,
    TResult Function(_$AuthStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _$AuthStateAuthenticated implements AuthState {
  const factory _$AuthStateAuthenticated(final User user) =
      _$_$AuthStateAuthenticated;

  User get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_$AuthStateAuthenticatedCopyWith<_$_$AuthStateAuthenticated>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_$AuthStateUnauthenticatedCopyWith<$Res> {
  factory _$$_$AuthStateUnauthenticatedCopyWith(
          _$_$AuthStateUnauthenticated value,
          $Res Function(_$_$AuthStateUnauthenticated) then) =
      __$$_$AuthStateUnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_$AuthStateUnauthenticatedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res>
    implements _$$_$AuthStateUnauthenticatedCopyWith<$Res> {
  __$$_$AuthStateUnauthenticatedCopyWithImpl(
      _$_$AuthStateUnauthenticated _value,
      $Res Function(_$_$AuthStateUnauthenticated) _then)
      : super(_value, (v) => _then(v as _$_$AuthStateUnauthenticated));

  @override
  _$_$AuthStateUnauthenticated get _value =>
      super._value as _$_$AuthStateUnauthenticated;
}

/// @nodoc

class _$_$AuthStateUnauthenticated implements _$AuthStateUnauthenticated {
  const _$_$AuthStateUnauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_$AuthStateUnauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(User user) authenticated,
    required TResult Function() unauthenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(User user)? authenticated,
    TResult Function()? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_$AuthStateInitial value) initial,
    required TResult Function(_$AuthStateAuthenticated value) authenticated,
    required TResult Function(_$AuthStateUnauthenticated value) unauthenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_$AuthStateInitial value)? initial,
    TResult Function(_$AuthStateAuthenticated value)? authenticated,
    TResult Function(_$AuthStateUnauthenticated value)? unauthenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_$AuthStateInitial value)? initial,
    TResult Function(_$AuthStateAuthenticated value)? authenticated,
    TResult Function(_$AuthStateUnauthenticated value)? unauthenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _$AuthStateUnauthenticated implements AuthState {
  const factory _$AuthStateUnauthenticated() = _$_$AuthStateUnauthenticated;
}
