import '/components/header/header_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tasks_widget.dart' show TasksWidget;
import 'package:flutter/material.dart';

class TasksModel extends FlutterFlowModel<TasksWidget> {
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
