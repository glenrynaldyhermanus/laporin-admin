import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'assignment_dialog_widget.dart' show AssignmentDialogWidget;
import 'package:flutter/material.dart';

class AssignmentDialogModel extends FlutterFlowModel<AssignmentDialogWidget> {
  ///  Local state fields for this component.

  List<UsersRow> businessUsers = [];
  void addToBusinessUsers(UsersRow item) => businessUsers.add(item);
  void removeFromBusinessUsers(UsersRow item) => businessUsers.remove(item);
  void removeAtIndexFromBusinessUsers(int index) =>
      businessUsers.removeAt(index);
  void insertAtIndexInBusinessUsers(int index, UsersRow item) =>
      businessUsers.insert(index, item);
  void updateBusinessUsersAtIndex(int index, Function(UsersRow) updateFn) =>
      businessUsers[index] = updateFn(businessUsers[index]);

  int? selectedUserIndex;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getUsersOfBusiness] action in AssignmentDialog widget.
  List<UsersRow>? users;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - getUserByUuid] action in Button widget.
  UsersRow? selectedUser;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
