import '/backend/backend.dart';
import '/components/field_option/field_option_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'field_item_model.dart';
export 'field_item_model.dart';

class FieldItemWidget extends StatefulWidget {
  const FieldItemWidget({
    super.key,
    required this.formField,
    required this.fields,
  });

  final FormFieldsRecord? formField;
  final List<FieldsRecord>? fields;

  @override
  _FieldItemWidgetState createState() => _FieldItemWidgetState();
}

class _FieldItemWidgetState extends State<FieldItemWidget> {
  late FieldItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FieldItemModel());

    _model.nameController ??=
        TextEditingController(text: widget.formField?.question);
    _model.nameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: _model.active
                    ? FlutterFlowTheme.of(context).secondary
                    : FlutterFlowTheme.of(context).primary,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.formField!.reference.id,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Montserrat',
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??=
                              functions.getFieldFromReference(
                                  widget.formField!.field!,
                                  widget.fields!.toList()),
                        ),
                        options: widget.fields!.map((e) => e.name).toList(),
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue = val);
                          setState(() {
                            _model.active = true;
                          });

                          await widget.formField!.reference
                              .update(createFormFieldsRecordData(
                            field: functions.getReferenceFromFieldName(
                                _model.dropDownValue!, widget.fields!.toList()),
                          ));
                        },
                        width: 300.0,
                        height: 50.0,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: 'Please select...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.nameController,
                          focusNode: _model.nameFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.nameController',
                            const Duration(milliseconds: 2000),
                            () async {
                              setState(() {
                                _model.active = true;
                              });
                            },
                          ),
                          autofillHints: const [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Questions',
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
                          validator: _model.nameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      if (widget.formField?.field?.id == 'K3D6DJyZbrWki3C7IoZE')
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  final options =
                                      widget.formField?.options.toList() ?? [];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(options.length,
                                        (optionsIndex) {
                                      final optionsItem = options[optionsIndex];
                                      return FieldOptionWidget(
                                        key: Key(
                                            'Keygni_${optionsIndex}_of_${options.length}'),
                                        option: optionsItem,
                                      );
                                    }).divide(const SizedBox(width: 16.0)),
                                  );
                                },
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  await widget.formField!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'options': FieldValue.arrayUnion([
                                          'Option ${widget.formField?.options.length.toString()}'
                                        ]),
                                      },
                                    ),
                                  });
                                },
                                text: 'Add Option',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                    ].divide(const SizedBox(height: 8.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await widget.formField!.reference
                              .update(createFormFieldsRecordData(
                            question: _model.nameController.text,
                            field: functions.getReferenceFromFieldName(
                                _model.dropDownValue!, widget.fields!.toList()),
                          ));
                          setState(() {
                            _model.active = false;
                          });
                        },
                        text: 'Save Field',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
        FlutterFlowIconButton(
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 48.0,
          icon: Icon(
            Icons.delete_forever,
            color: FlutterFlowTheme.of(context).error,
            size: 32.0,
          ),
          onPressed: () async {
            await widget.formField!.reference.delete();
          },
        ),
      ].divide(const SizedBox(width: 24.0)).around(const SizedBox(width: 24.0)),
    );
  }
}
