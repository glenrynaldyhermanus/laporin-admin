// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    int? userId,
    String? name,
    String? email,
    String? business,
    String? role,
    int? businessId,
  })  : _userId = userId,
        _name = name,
        _email = email,
        _business = business,
        _role = role,
        _businessId = businessId;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;
  void incrementUserId(int amount) => _userId = userId + amount;
  bool hasUserId() => _userId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "business" field.
  String? _business;
  String get business => _business ?? '';
  set business(String? val) => _business = val;
  bool hasBusiness() => _business != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  // "business_id" field.
  int? _businessId;
  int get businessId => _businessId ?? 0;
  set businessId(int? val) => _businessId = val;
  void incrementBusinessId(int amount) => _businessId = businessId + amount;
  bool hasBusinessId() => _businessId != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        userId: castToType<int>(data['user_id']),
        name: data['name'] as String?,
        email: data['email'] as String?,
        business: data['business'] as String?,
        role: data['role'] as String?,
        businessId: castToType<int>(data['business_id']),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'name': _name,
        'email': _email,
        'business': _business,
        'role': _role,
        'business_id': _businessId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'business': serializeParam(
          _business,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'business_id': serializeParam(
          _businessId,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        business: deserializeParam(
          data['business'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        businessId: deserializeParam(
          data['business_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        userId == other.userId &&
        name == other.name &&
        email == other.email &&
        business == other.business &&
        role == other.role &&
        businessId == other.businessId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([userId, name, email, business, role, businessId]);
}

UserStruct createUserStruct({
  int? userId,
  String? name,
  String? email,
  String? business,
  String? role,
  int? businessId,
}) =>
    UserStruct(
      userId: userId,
      name: name,
      email: email,
      business: business,
      role: role,
      businessId: businessId,
    );
