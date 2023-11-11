import '/flutter_flow/flutter_flow_util.dart';
import 'field_option_widget.dart' show FieldOptionWidget;
import 'package:flutter/material.dart';

class FieldOptionModel extends FlutterFlowModel<FieldOptionWidget> {
  ///  Local state fields for this component.

  bool updated = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for options widget.
  FocusNode? optionsFocusNode;
  TextEditingController? optionsController;
  String? Function(BuildContext, String?)? optionsControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    optionsFocusNode?.dispose();
    optionsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
