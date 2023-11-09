import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'assignment_dialog_widget.dart' show AssignmentDialogWidget;
import 'package:flutter/material.dart';

class AssignmentDialogModel extends FlutterFlowModel<AssignmentDialogWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getUsersOfBusiness] action in AssignmentDialog widget.
  List<UsersRow>? users;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
