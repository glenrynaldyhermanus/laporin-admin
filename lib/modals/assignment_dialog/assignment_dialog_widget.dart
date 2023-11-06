import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'assignment_dialog_model.dart';
export 'assignment_dialog_model.dart';

class AssignmentDialogWidget extends StatefulWidget {
  const AssignmentDialogWidget({
    super.key,
    required this.task,
  });

  final TasksRecord? task;

  @override
  _AssignmentDialogWidgetState createState() => _AssignmentDialogWidgetState();
}

class _AssignmentDialogWidgetState extends State<AssignmentDialogWidget> {
  late AssignmentDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignmentDialogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: StreamBuilder<List<UsersRecord>>(
          stream: queryUsersRecord(),
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
            List<UsersRecord> materialDialog4UsersRecordList = snapshot.data!;
            return Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 530.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 1.0,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.task?.name,
                            'Assignment',
                          ),
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).accent1,
                          icon: Icon(
                            Icons.close,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Assign To',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(null),
                                    options: materialDialog4UsersRecordList
                                        .map((e) => e.displayName)
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.dropDownValue = val),
                                    width: double.infinity,
                                    height: 50.0,
                                    searchHintTextStyle:
                                        FlutterFlowTheme.of(context).labelSmall,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    searchHintText: 'Search user',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: true,
                                    isMultiSelect: false,
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ].divide(const SizedBox(height: 16.0)),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await widget.task!.reference.update({
                                ...createTasksRecordData(
                                  status: 'Assigned',
                                ),
                                ...mapToFirestore(
                                  {
                                    'assignees': FieldValue.arrayUnion([
                                      functions.getReferenceFromUserName(
                                          _model.dropDownValue!,
                                          materialDialog4UsersRecordList
                                              .toList())
                                    ]),
                                  },
                                ),
                              });
                              triggerPushNotification(
                                notificationTitle: 'New Task',
                                notificationText:
                                    'You got new task assigned for you',
                                notificationSound: 'default',
                                userRefs: [
                                  functions.getReferenceFromUserName(
                                      _model.dropDownValue!,
                                      materialDialog4UsersRecordList.toList())
                                ],
                                initialPageName: 'Home',
                                parameterData: {},
                              );
                              Navigator.pop(context);
                            },
                            text: 'Assign',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
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
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(width: 0.0))
                          .around(const SizedBox(width: 0.0)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
