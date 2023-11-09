import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _menus = prefs
              .getStringList('ff_menus')
              ?.map((x) {
                try {
                  return MenuStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _menus;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_selectedMenu')) {
        try {
          final serializedData = prefs.getString('ff_selectedMenu') ?? '{}';
          _selectedMenu =
              MenuStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_authUser')) {
        try {
          final serializedData = prefs.getString('ff_authUser') ?? '{}';
          _authUser =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<MenuStruct> _menus = [
    MenuStruct.fromSerializableMap(jsonDecode(
        '{"name":"Dashboard","urlPath":"/home","actions":"[]","icon_type":"0"}')),
    MenuStruct.fromSerializableMap(jsonDecode(
        '{"name":"Tasks","urlPath":"/tasks","actions":"[\\"{\\\\\\"name\\\\\\":\\\\\\"New Task\\\\\\",\\\\\\"type\\\\\\":\\\\\\"dialog\\\\\\",\\\\\\"action\\\\\\":\\\\\\"NewTaskDialog\\\\\\",\\\\\\"icon_type\\\\\\":\\\\\\"1\\\\\\"}\\"]","icon_type":"1"}')),
    MenuStruct.fromSerializableMap(jsonDecode(
        '{"name":"Forms","urlPath":"/forms","actions":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Create Form\\\\\\",\\\\\\"type\\\\\\":\\\\\\"page\\\\\\",\\\\\\"action\\\\\\":\\\\\\"FormBuilder\\\\\\",\\\\\\"icon_type\\\\\\":\\\\\\"1\\\\\\"}\\"]","icon_type":"2"}')),
    MenuStruct.fromSerializableMap(jsonDecode(
        '{"name":"Users","urlPath":"/users","actions":"[\\"{\\\\\\"name\\\\\\":\\\\\\"Invite People\\\\\\",\\\\\\"type\\\\\\":\\\\\\"dialog\\\\\\",\\\\\\"action\\\\\\":\\\\\\"InvitationDialog\\\\\\",\\\\\\"icon_type\\\\\\":\\\\\\"1\\\\\\"}\\"]","icon_type":"3"}'))
  ];
  List<MenuStruct> get menus => _menus;
  set menus(List<MenuStruct> value) {
    _menus = value;
    prefs.setStringList('ff_menus', value.map((x) => x.serialize()).toList());
  }

  void addToMenus(MenuStruct value) {
    _menus.add(value);
    prefs.setStringList('ff_menus', _menus.map((x) => x.serialize()).toList());
  }

  void removeFromMenus(MenuStruct value) {
    _menus.remove(value);
    prefs.setStringList('ff_menus', _menus.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromMenus(int index) {
    _menus.removeAt(index);
    prefs.setStringList('ff_menus', _menus.map((x) => x.serialize()).toList());
  }

  void updateMenusAtIndex(
    int index,
    MenuStruct Function(MenuStruct) updateFn,
  ) {
    _menus[index] = updateFn(_menus[index]);
    prefs.setStringList('ff_menus', _menus.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInMenus(int index, MenuStruct value) {
    _menus.insert(index, value);
    prefs.setStringList('ff_menus', _menus.map((x) => x.serialize()).toList());
  }

  MenuStruct _selectedMenu = MenuStruct.fromSerializableMap(jsonDecode(
      '{"name":"Dashboard","urlPath":"/home","actions":"[]","icon_type":"0"}'));
  MenuStruct get selectedMenu => _selectedMenu;
  set selectedMenu(MenuStruct value) {
    _selectedMenu = value;
    prefs.setString('ff_selectedMenu', value.serialize());
  }

  void updateSelectedMenuStruct(Function(MenuStruct) updateFn) {
    updateFn(_selectedMenu);
    prefs.setString('ff_selectedMenu', _selectedMenu.serialize());
  }

  UserStruct _authUser = UserStruct();
  UserStruct get authUser => _authUser;
  set authUser(UserStruct value) {
    _authUser = value;
    prefs.setString('ff_authUser', value.serialize());
  }

  void updateAuthUserStruct(Function(UserStruct) updateFn) {
    updateFn(_authUser);
    prefs.setString('ff_authUser', _authUser.serialize());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
