// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuStruct extends BaseStruct {
  MenuStruct({
    String? name,
    String? urlPath,
    List<ActionStruct>? actions,
    int? iconType,
  })  : _name = name,
        _urlPath = urlPath,
        _actions = actions,
        _iconType = iconType;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "urlPath" field.
  String? _urlPath;
  String get urlPath => _urlPath ?? '';
  set urlPath(String? val) => _urlPath = val;
  bool hasUrlPath() => _urlPath != null;

  // "actions" field.
  List<ActionStruct>? _actions;
  List<ActionStruct> get actions => _actions ?? const [];
  set actions(List<ActionStruct>? val) => _actions = val;
  void updateActions(Function(List<ActionStruct>) updateFn) =>
      updateFn(_actions ??= []);
  bool hasActions() => _actions != null;

  // "icon_type" field.
  int? _iconType;
  int get iconType => _iconType ?? 0;
  set iconType(int? val) => _iconType = val;
  void incrementIconType(int amount) => _iconType = iconType + amount;
  bool hasIconType() => _iconType != null;

  static MenuStruct fromMap(Map<String, dynamic> data) => MenuStruct(
        name: data['name'] as String?,
        urlPath: data['urlPath'] as String?,
        actions: getStructList(
          data['actions'],
          ActionStruct.fromMap,
        ),
        iconType: castToType<int>(data['icon_type']),
      );

  static MenuStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MenuStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'urlPath': _urlPath,
        'actions': _actions?.map((e) => e.toMap()).toList(),
        'icon_type': _iconType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'urlPath': serializeParam(
          _urlPath,
          ParamType.String,
        ),
        'actions': serializeParam(
          _actions,
          ParamType.DataStruct,
          true,
        ),
        'icon_type': serializeParam(
          _iconType,
          ParamType.int,
        ),
      }.withoutNulls;

  static MenuStruct fromSerializableMap(Map<String, dynamic> data) =>
      MenuStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        urlPath: deserializeParam(
          data['urlPath'],
          ParamType.String,
          false,
        ),
        actions: deserializeStructParam<ActionStruct>(
          data['actions'],
          ParamType.DataStruct,
          true,
          structBuilder: ActionStruct.fromSerializableMap,
        ),
        iconType: deserializeParam(
          data['icon_type'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MenuStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MenuStruct &&
        name == other.name &&
        urlPath == other.urlPath &&
        listEquality.equals(actions, other.actions) &&
        iconType == other.iconType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, urlPath, actions, iconType]);
}

MenuStruct createMenuStruct({
  String? name,
  String? urlPath,
  int? iconType,
}) =>
    MenuStruct(
      name: name,
      urlPath: urlPath,
      iconType: iconType,
    );
