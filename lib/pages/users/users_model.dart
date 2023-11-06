import '/components/header/header_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'users_widget.dart' show UsersWidget;
import 'package:flutter/material.dart';

class UsersModel extends FlutterFlowModel<UsersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // Model for Header component.
  late HeaderModel headerModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideBarModel = createModel(context, () => SideBarModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideBarModel.dispose();
    headerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
