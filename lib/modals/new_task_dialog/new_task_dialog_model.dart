import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_task_dialog_widget.dart' show NewTaskDialogWidget;
import 'package:flutter/material.dart';

class NewTaskDialogModel extends FlutterFlowModel<NewTaskDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for desc widget.
  FocusNode? descFocusNode;
  TextEditingController? descController;
  String? Function(BuildContext, String?)? descControllerValidator;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationController;
  String? Function(BuildContext, String?)? locationControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    descFocusNode?.dispose();
    descController?.dispose();

    locationFocusNode?.dispose();
    locationController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
