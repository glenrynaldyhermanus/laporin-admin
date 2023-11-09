import '/backend/supabase/supabase.dart';
import '/components/header/header_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/assignment_dialog/assignment_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'tasks_model.dart';
export 'tasks_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  late TasksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TasksModel());

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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    border: Border.all(
                                      color: const Color(0x19636F81),
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
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'UUID',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Name',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Description',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Form',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Location',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Due Date',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Status',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        const SizedBox(width: 16.0))
                                                    .around(
                                                        const SizedBox(width: 16.0)),
                                              ),
                                            ),
                                            Container(
                                              width: 160.0,
                                              decoration: const BoxDecoration(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FutureBuilder<List<TasksRow>>(
                                        future: TasksTable().queryRows(
                                          queryFn: (q) => q.eq(
                                            'business_id',
                                            FFAppState().authUser.businessId,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: LinearProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            );
                                          }
                                          List<TasksRow> columnTasksRowList =
                                              snapshot.data!;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnTasksRowList.length,
                                                (columnIndex) {
                                              final columnTasksRow =
                                                  columnTasksRowList[
                                                      columnIndex];
                                              return Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: functions
                                                          .isEven(columnIndex)
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  border: Border.all(
                                                    color: const Color(0x0E636F81),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 16.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                columnTasksRow
                                                                    .uuid,
                                                                maxLines: 1,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  AlignedTooltip(
                                                                content:
                                                                    Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          columnTasksRow
                                                                              .name,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyLarge,
                                                                        )),
                                                                offset: 4.0,
                                                                preferredDirection:
                                                                    AxisDirection
                                                                        .down,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                elevation: 4.0,
                                                                tailBaseWidth:
                                                                    24.0,
                                                                tailLength:
                                                                    12.0,
                                                                waitDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            100),
                                                                showDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .tap,
                                                                child: Text(
                                                                  columnTasksRow
                                                                      .name,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  AlignedTooltip(
                                                                content:
                                                                    Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          columnTasksRow
                                                                              .description!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyLarge,
                                                                        )),
                                                                offset: 4.0,
                                                                preferredDirection:
                                                                    AxisDirection
                                                                        .down,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                elevation: 4.0,
                                                                tailBaseWidth:
                                                                    24.0,
                                                                tailLength:
                                                                    12.0,
                                                                waitDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            100),
                                                                showDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1500),
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .tap,
                                                                child: Text(
                                                                  columnTasksRow
                                                                      .description!
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        15,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: FutureBuilder<
                                                                  List<
                                                                      FormsRow>>(
                                                                future: FormsTable()
                                                                    .querySingleRow(
                                                                  queryFn:
                                                                      (q) =>
                                                                          q.eq(
                                                                    'id',
                                                                    columnTasksRow
                                                                        .formId,
                                                                  ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFoldingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<FormsRow>
                                                                      textFormsRowList =
                                                                      snapshot
                                                                          .data!;
                                                                  final textFormsRow = textFormsRowList
                                                                          .isNotEmpty
                                                                      ? textFormsRowList
                                                                          .first
                                                                      : null;
                                                                  return Text(
                                                                    textFormsRow!
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  AlignedTooltip(
                                                                content:
                                                                    Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            4.0,
                                                                            4.0,
                                                                            4.0,
                                                                            4.0),
                                                                        child:
                                                                            Text(
                                                                          columnTasksRow
                                                                              .location!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyLarge,
                                                                        )),
                                                                offset: 4.0,
                                                                preferredDirection:
                                                                    AxisDirection
                                                                        .down,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                elevation: 4.0,
                                                                tailBaseWidth:
                                                                    24.0,
                                                                tailLength:
                                                                    12.0,
                                                                waitDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            100),
                                                                showDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            1500),
                                                                triggerMode:
                                                                    TooltipTriggerMode
                                                                        .tap,
                                                                child: Text(
                                                                  columnTasksRow
                                                                      .location!
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        15,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                dateTimeFormat(
                                                                    'd/M h:mm a',
                                                                    columnTasksRow
                                                                        .dueAt!),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                () {
                                                                  if (columnTasksRow
                                                                          .status ==
                                                                      0) {
                                                                    return 'New';
                                                                  } else if (columnTasksRow
                                                                          .status ==
                                                                      1) {
                                                                    return 'Assigned';
                                                                  } else {
                                                                    return 'Done';
                                                                  }
                                                                }(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                          ]
                                                              .divide(const SizedBox(
                                                                  width: 16.0))
                                                              .around(const SizedBox(
                                                                  width: 16.0)),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 160.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              if (columnTasksRow
                                                                      .status ==
                                                                  0)
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            true,
                                                                        avoidOverflow:
                                                                            false,
                                                                        targetAnchor:
                                                                            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: SizedBox(
                                                                                height: 320.0,
                                                                                child: AssignmentDialogWidget(
                                                                                  task: columnTasksRow,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    text:
                                                                        'Assign',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          32.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      textStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmall,
                                                                      elevation:
                                                                          0.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
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
                          ]
                              .divide(const SizedBox(height: 20.0))
                              .around(const SizedBox(height: 20.0)),
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
