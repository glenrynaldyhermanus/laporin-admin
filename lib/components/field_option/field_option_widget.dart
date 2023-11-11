import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'field_option_model.dart';
export 'field_option_model.dart';

class FieldOptionWidget extends StatefulWidget {
  const FieldOptionWidget({
    super.key,
    required this.fieldOption,
  });

  final FieldOptionsRow? fieldOption;

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

    _model.optionsController ??=
        TextEditingController(text: widget.fieldOption?.option);
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
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 160.0,
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
          FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: const Icon(
              Icons.delete_sweep_outlined,
              color: Color(0xB2EE4444),
              size: 24.0,
            ),
            showLoadingIndicator: true,
            onPressed: () async {
              await FieldOptionsTable().delete(
                matchingRows: (rows) => rows.eq(
                  'id',
                  widget.fieldOption?.id,
                ),
              );
              _model.updatePage(() {
                _model.updated = true;
              });
            },
          ),
        ].divide(const SizedBox(width: 16.0)),
      ),
    );
  }
}
