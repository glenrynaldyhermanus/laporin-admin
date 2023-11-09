import '/components/field_option/field_option_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'field_item_widget.dart' show FieldItemWidget;
import 'package:flutter/material.dart';

class FieldItemModel extends FlutterFlowModel<FieldItemWidget> {
  ///  Local state fields for this component.

  bool active = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // Model for FieldOption component.
  late FieldOptionModel fieldOptionModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    fieldOptionModel = createModel(context, () => FieldOptionModel());
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    fieldOptionModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
