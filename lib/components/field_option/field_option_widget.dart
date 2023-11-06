import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'field_option_model.dart';
export 'field_option_model.dart';

class FieldOptionWidget extends StatefulWidget {
  const FieldOptionWidget({
    super.key,
    required this.option,
  });

  final String? option;

  @override
  _FieldOptionWidgetState createState() => _FieldOptionWidgetState();
}

class _FieldOptionWidgetState extends State<FieldOptionWidget> {
  late FieldOptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FieldOptionModel());

    _model.optionsController ??= TextEditingController(text: widget.option);
    _model.optionsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      decoration: const BoxDecoration(),
      child: SizedBox(
        width: 100.0,
        child: TextFormField(
          controller: _model.optionsController,
          focusNode: _model.optionsFocusNode,
          autofillHints: const [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFF1F4F8),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE0E3E7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE0E3E7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: const Color(0xFFF1F4F8),
          ),
          style: FlutterFlowTheme.of(context).bodyMedium,
          keyboardType: TextInputType.emailAddress,
          validator: _model.optionsControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
