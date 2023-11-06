import '/backend/backend.dart';
import '/components/header/header_widget.dart';
import '/components/side_bar/side_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/assignment_dialog/assignment_dialog_widget.dart';
import '/modals/new_task_dialog/new_task_dialog_widget.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                child: const SideBarWidget(
                  pagTitle: 'Task Management',
                ),
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
                        child: const HeaderWidget(
                          pageTitle: 'Task Management',
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32.0, 24.0, 32.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: () async {
                                        await showAlignedDialog(
                                          context: context,
                                          isGlobal: true,
                                          avoidOverflow: false,
                                          targetAnchor: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: SizedBox(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.7,
                                                  child: const NewTaskDialogWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      text: 'New Task',
                                      icon: const Icon(
                                        Icons.add_circle,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                        elevation: 0.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    32.0, 0.0, 32.0, 32.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0),
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
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Name',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Description',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Form',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Location',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Due Date',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
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
                                                              .bodyMedium,
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
                                      StreamBuilder<List<TasksRecord>>(
                                        stream: queryTasksRecord(),
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
                                          List<TasksRecord>
                                              columnTasksRecordList =
                                              snapshot.data!;
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                columnTasksRecordList.length,
                                                (columnIndex) {
                                              final columnTasksRecord =
                                                  columnTasksRecordList[
                                                      columnIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  columnTasksRecord
                                                                      .reference
                                                                      .id,
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
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
                                                                            columnTasksRecord.name,
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
                                                                  elevation:
                                                                      4.0,
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
                                                                    columnTasksRecord
                                                                        .name,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
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
                                                                            columnTasksRecord.description,
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
                                                                  elevation:
                                                                      4.0,
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
                                                                    columnTasksRecord
                                                                        .description
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          15,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: StreamBuilder<
                                                                    FormsRecord>(
                                                                  stream: FormsRecord
                                                                      .getDocument(
                                                                          columnTasksRecord
                                                                              .form!),
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
                                                                    final textFormsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Text(
                                                                      textFormsRecord
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
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
                                                                            columnTasksRecord.location,
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
                                                                  elevation:
                                                                      4.0,
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
                                                                    columnTasksRecord
                                                                        .location
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          15,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                      'M/d H:mm',
                                                                      columnTasksRecord
                                                                          .due!),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  columnTasksRecord
                                                                      .status,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                            ]
                                                                .divide(const SizedBox(
                                                                    width:
                                                                        16.0))
                                                                .around(const SizedBox(
                                                                    width:
                                                                        16.0)),
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
                                                                if (columnTasksRecord
                                                                        .status ==
                                                                    'New')
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
                                                                              color: Colors.transparent,
                                                                              child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: SizedBox(
                                                                                  height: 320.0,
                                                                                  child: AssignmentDialogWidget(
                                                                                    task: columnTasksRecord,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        textStyle:
                                                                            FlutterFlowTheme.of(context).bodyMedium,
                                                                        elevation:
                                                                            0.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(24.0),
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
                                                  Divider(
                                                    height: 8.0,
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                  ),
                                                ],
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
