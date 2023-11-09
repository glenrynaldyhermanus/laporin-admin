import '/backend/supabase/supabase.dart';
import '/components/header/header_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'forms_model.dart';
export 'forms_model.dart';

class FormsWidget extends StatefulWidget {
  const FormsWidget({super.key});

  @override
  _FormsWidgetState createState() => _FormsWidgetState();
}

class _FormsWidgetState extends State<FormsWidget> {
  late FormsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              wrapWithModel(
                model: _model.sideBarModel,
                updateCallback: () => setState(() {}),
                child: const SideBarWidget(),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => setState(() {}),
                        child: const HeaderWidget(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              border: Border.all(
                                color: const Color(0x1A636F81),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    border: Border.all(
                                      color: const Color(0x1A636F81),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'UUID',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'Name',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'No Of Questions',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ),
                                    ]
                                        .divide(const SizedBox(width: 16.0))
                                        .around(const SizedBox(width: 16.0)),
                                  ),
                                ),
                                FutureBuilder<List<FormsRow>>(
                                  future: FormsTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'business_id',
                                      FFAppState().authUser.businessId,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitFoldingCube(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<FormsRow> columnFormsRowList =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnFormsRowList.length,
                                          (columnIndex) {
                                        final columnFormsRow =
                                            columnFormsRowList[columnIndex];
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: functions.isEven(columnIndex)
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            border: Border.all(
                                              color: const Color(0x0E636F81),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'FormBuilder',
                                                        queryParameters: {
                                                          'form':
                                                              serializeParam(
                                                            columnFormsRow,
                                                            ParamType
                                                                .SupabaseRow,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    },
                                                    child: Text(
                                                      columnFormsRow.uuid,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: const Color(
                                                                    0xFF418ABD),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    columnFormsRow.name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: FutureBuilder<
                                                      List<FieldsRow>>(
                                                    future:
                                                        FieldsTable().queryRows(
                                                      queryFn: (q) => q.eq(
                                                        'form_id',
                                                        columnFormsRow.id,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child:
                                                              LinearProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                          ),
                                                        );
                                                      }
                                                      List<FieldsRow>
                                                          containerFieldsRowList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Text(
                                                          '${containerFieldsRowList.length.toString()} questions',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ]
                                                  .divide(const SizedBox(width: 16.0))
                                                  .around(
                                                      const SizedBox(width: 16.0)),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
