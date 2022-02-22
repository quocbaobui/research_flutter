// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_internal_w.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserInternalWF _$UserInternalWFFromJson(Map<String, dynamic> json) {
  return _UserInternalWF.fromJson(json);
}

/// @nodoc
class _$UserInternalWFTearOff {
  const _$UserInternalWFTearOff();

  _UserInternalWF call({required String name, int? age, required int userId}) {
    return _UserInternalWF(
      name: name,
      age: age,
      userId: userId,
    );
  }

  UserInternalWF fromJson(Map<String, Object> json) {
    return UserInternalWF.fromJson(json);
  }
}

/// @nodoc
const $UserInternalWF = _$UserInternalWFTearOff();

/// @nodoc
mixin _$UserInternalWF {
  String get name => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInternalWFCopyWith<UserInternalWF> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInternalWFCopyWith<$Res> {
  factory $UserInternalWFCopyWith(
          UserInternalWF value, $Res Function(UserInternalWF) then) =
      _$UserInternalWFCopyWithImpl<$Res>;
  $Res call({String name, int? age, int userId});
}

/// @nodoc
class _$UserInternalWFCopyWithImpl<$Res>
    implements $UserInternalWFCopyWith<$Res> {
  _$UserInternalWFCopyWithImpl(this._value, this._then);

  final UserInternalWF _value;
  // ignore: unused_field
  final $Res Function(UserInternalWF) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserInternalWFCopyWith<$Res>
    implements $UserInternalWFCopyWith<$Res> {
  factory _$UserInternalWFCopyWith(
          _UserInternalWF value, $Res Function(_UserInternalWF) then) =
      __$UserInternalWFCopyWithImpl<$Res>;
  @override
  $Res call({String name, int? age, int userId});
}

/// @nodoc
class __$UserInternalWFCopyWithImpl<$Res>
    extends _$UserInternalWFCopyWithImpl<$Res>
    implements _$UserInternalWFCopyWith<$Res> {
  __$UserInternalWFCopyWithImpl(
      _UserInternalWF _value, $Res Function(_UserInternalWF) _then)
      : super(_value, (v) => _then(v as _UserInternalWF));

  @override
  _UserInternalWF get _value => super._value as _UserInternalWF;

  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
    Object? userId = freezed,
  }) {
    return _then(_UserInternalWF(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserInternalWF extends _UserInternalWF with DiagnosticableTreeMixin {
  _$_UserInternalWF({required this.name, this.age, required this.userId})
      : super._();

  factory _$_UserInternalWF.fromJson(Map<String, dynamic> json) =>
      _$_$_UserInternalWFFromJson(json);

  @override
  final String name;
  @override
  final int? age;
  @override
  final int userId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserInternalWF(name: $name, age: $age, userId: $userId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserInternalWF'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('userId', userId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserInternalWF &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(userId);

  @JsonKey(ignore: true)
  @override
  _$UserInternalWFCopyWith<_UserInternalWF> get copyWith =>
      __$UserInternalWFCopyWithImpl<_UserInternalWF>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserInternalWFToJson(this);
  }
}

abstract class _UserInternalWF extends UserInternalWF {
  factory _UserInternalWF(
      {required String name,
      int? age,
      required int userId}) = _$_UserInternalWF;
  _UserInternalWF._() : super._();

  factory _UserInternalWF.fromJson(Map<String, dynamic> json) =
      _$_UserInternalWF.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int? get age => throw _privateConstructorUsedError;
  @override
  int get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserInternalWFCopyWith<_UserInternalWF> get copyWith =>
      throw _privateConstructorUsedError;
}
