import '/backend/supabase/supabase.dart';
import '/components/field_option/field_option_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'field_item_model.dart';
export 'field_item_model.dart';

class FieldItemWidget extends StatefulWidget {
  const FieldItemWidget({
    super.key,
    required this.field,
    required this.fieldTypes,
  });

  final FieldsRow? field;
  final List<FieldTypesRow>? fieldTypes;

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
        TextEditingController(text: widget.field?.question);
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
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
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
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    widget.field!.uuid,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Montserrat',
                          fontStyle: FontStyle.italic,
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
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await FieldsTable().delete(
                      matchingRows: (rows) => rows.eq(
                        'id',
                        widget.field?.id,
                      ),
                    );
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FlutterFlowDropDown<int>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<int>(
                          _model.dropDownValue ??= widget.field?.fieldTypeId,
                        ),
                        options: List<int>.from(
                            widget.fieldTypes!.map((e) => e.id).toList()),
                        optionLabels:
                            widget.fieldTypes!.map((e) => e.name).toList(),
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue = val);
                          await FieldsTable().update(
                            data: {
                              'field_type_id': _model.dropDownValue,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              widget.field?.id,
                            ),
                          );
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
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
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
                    ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
                if (functions
                        .getFieldTypeFromList(
                            _model.dropDownValue!, widget.fieldTypes!.toList())
                        ?.hasOption ==
                    true)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<List<FieldOptionsRow>>(
                          future: (_model.requestCompleter ??=
                                  Completer<List<FieldOptionsRow>>()
                                    ..complete(FieldOptionsTable().queryRows(
                                      queryFn: (q) => q.eq(
                                        'field_id',
                                        widget.field?.id,
                                      ),
                                    )))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitFoldingCube(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<FieldOptionsRow> columnFieldOptionsRowList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnFieldOptionsRowList.length,
                                  (columnIndex) {
                                final columnFieldOptionsRow =
                                    columnFieldOptionsRowList[columnIndex];
                                return FieldOptionWidget(
                                  key: Key(
                                      'Keygni_${columnIndex}_of_${columnFieldOptionsRowList.length}'),
                                  fieldOption: columnFieldOptionsRow,
                                );
                              }).divide(const SizedBox(height: 16.0)),
                            );
                          },
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await FieldOptionsTable().insert({
                              'field_id': widget.field?.id,
                              'option': 'New Option',
                            });
                            setState(() => _model.requestCompleter = null);
                            await _model.waitForRequestCompleted();
                          },
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).accent1,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ),
                                Text(
                                  'Add Option',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                  ),
              ].divide(const SizedBox(height: 8.0)),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
