import '/components/header/header_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'form_builder_widget.dart' show FormBuilderWidget;
import 'package:flutter/material.dart';

class FormBuilderModel extends FlutterFlowModel<FormBuilderWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for SideBar component.
  late SideBarModel sideBarModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;

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
    nameFocusNode?.dispose();
    nameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
