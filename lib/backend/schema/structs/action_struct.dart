// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActionStruct extends BaseStruct {
  ActionStruct({
    String? name,
    String? type,
    String? action,
    int? iconType,
  })  : _name = name,
        _type = type,
        _action = action,
        _iconType = iconType;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  set action(String? val) => _action = val;
  bool hasAction() => _action != null;

  // "icon_type" field.
  int? _iconType;
  int get iconType => _iconType ?? 0;
  set iconType(int? val) => _iconType = val;
  void incrementIconType(int amount) => _iconType = iconType + amount;
  bool hasIconType() => _iconType != null;

  static ActionStruct fromMap(Map<String, dynamic> data) => ActionStruct(
        name: data['name'] as String?,
        type: data['type'] as String?,
        action: data['action'] as String?,
        iconType: castToType<int>(data['icon_type']),
      );

  static ActionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ActionStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'type': _type,
        'action': _action,
        'icon_type': _iconType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'action': serializeParam(
          _action,
          ParamType.String,
        ),
        'icon_type': serializeParam(
          _iconType,
          ParamType.int,
        ),
      }.withoutNulls;

  static ActionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ActionStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        action: deserializeParam(
          data['action'],
          ParamType.String,
          false,
        ),
        iconType: deserializeParam(
          data['icon_type'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ActionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActionStruct &&
        name == other.name &&
        type == other.type &&
        action == other.action &&
        iconType == other.iconType;
  }

  @override
  int get hashCode => const ListEquality().hash([name, type, action, iconType]);
}

ActionStruct createActionStruct({
  String? name,
  String? type,
  String? action,
  int? iconType,
}) =>
    ActionStruct(
      name: name,
      type: type,
      action: action,
      iconType: iconType,
    );
