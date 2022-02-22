import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_internal_w.freezed.dart';
part 'user_internal_w.g.dart';

@freezed
class UserInternalWF with _$UserInternalWF {
  const UserInternalWF._();

  factory UserInternalWF({
    required String name,
    int? age,
    required int userId,
  }) = _UserInternalWF;

  factory UserInternalWF.fromJson(Map<String, dynamic> json) =>
      _$UserInternalWFFromJson(json);
}


