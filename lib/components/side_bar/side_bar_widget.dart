import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'side_bar_model.dart';
export 'side_bar_model.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({
    super.key,
    required this.pagTitle,
  });

  final String? pagTitle;

  @override
  _SideBarWidgetState createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  late SideBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideBarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.businessList = await actions.getUserBusiness(
        currentUserReference!,
      );
      if (functions.isHavingBusiness(_model.businessList?.toList())) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'You don\'t have any business registered',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      GoRouter.of(context).prepareAuthEvent();
      await authManager.signOut();
      GoRouter.of(context).clearRedirectLocation();

      context.pushNamedAuth('Login', context.mounted);

      return;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Container(
        width: 56.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(0.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: StreamBuilder<List<BusinessRecord>>(
                  stream: queryBusinessRecord(
                    singleRecord: true,
                  ),
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
                    List<BusinessRecord> containerBusinessRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerBusinessRecord =
                        containerBusinessRecordList.isNotEmpty
                            ? containerBusinessRecordList.first
                            : null;
                    return Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: AlignedTooltip(
                          content: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 4.0, 4.0),
                              child: Text(
                                containerBusinessRecord!.name,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              )),
                          offset: 4.0,
                          preferredDirection: AxisDirection.right,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: const Duration(milliseconds: 100),
                          showDuration: const Duration(milliseconds: 1000),
                          triggerMode: TooltipTriggerMode.tap,
                          child: Text(
                            valueOrDefault<String>(
                              functions.getNameAbbrevation(
                                  containerBusinessRecord.name),
                              'L',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Home');
                      },
                      child: Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: widget.pagTitle == 'Dashboard'
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: AlignedTooltip(
                            content: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: Text(
                                  'Dashboard',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                )),
                            offset: 4.0,
                            preferredDirection: AxisDirection.right,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: const Duration(milliseconds: 100),
                            showDuration: const Duration(milliseconds: 1000),
                            triggerMode: TooltipTriggerMode.tap,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Home');
                              },
                              child: Icon(
                                Icons.space_dashboard,
                                color: widget.pagTitle == 'Dashboard'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Tasks');
                      },
                      child: Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: widget.pagTitle == 'Task Management'
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: AlignedTooltip(
                            content: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: Text(
                                  'Task Management',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                )),
                            offset: 4.0,
                            preferredDirection: AxisDirection.right,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: const Duration(milliseconds: 100),
                            showDuration: const Duration(milliseconds: 1000),
                            triggerMode: TooltipTriggerMode.tap,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Tasks');
                              },
                              child: Icon(
                                Icons.task_alt,
                                color: widget.pagTitle == 'Task Management'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Forms');
                      },
                      child: Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: widget.pagTitle == 'Form Management'
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: AlignedTooltip(
                            content: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: Text(
                                  'Form Management',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                )),
                            offset: 4.0,
                            preferredDirection: AxisDirection.right,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: const Duration(milliseconds: 100),
                            showDuration: const Duration(milliseconds: 1000),
                            triggerMode: TooltipTriggerMode.tap,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Forms');
                              },
                              child: Icon(
                                Icons.feed,
                                color: widget.pagTitle == 'Form Management'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Users');
                      },
                      child: Container(
                        width: 36.0,
                        height: 36.0,
                        decoration: BoxDecoration(
                          color: widget.pagTitle == 'User Management'
                              ? FlutterFlowTheme.of(context).primaryBackground
                              : FlutterFlowTheme.of(context).primary,
                          shape: BoxShape.circle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: AlignedTooltip(
                            content: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 4.0, 4.0),
                                child: Text(
                                  'User Management',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                )),
                            offset: 4.0,
                            preferredDirection: AxisDirection.right,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 24.0,
                            tailLength: 12.0,
                            waitDuration: const Duration(milliseconds: 100),
                            showDuration: const Duration(milliseconds: 1000),
                            triggerMode: TooltipTriggerMode.tap,
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('Users');
                              },
                              child: Icon(
                                Icons.people_rounded,
                                color: widget.pagTitle == 'User Management'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(const SizedBox(height: 24.0))
                      .around(const SizedBox(height: 24.0)),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();

                      context.goNamedAuth('Login', context.mounted);
                    },
                    child: Container(
                      width: 36.0,
                      height: 44.0,
                      decoration: const BoxDecoration(),
                      child: Align(
                        alignment: const AlignmentDirectional(0.00, 0.00),
                        child: AlignedTooltip(
                          content: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  4.0, 4.0, 4.0, 4.0),
                              child: Text(
                                'Log Out',
                                style: FlutterFlowTheme.of(context).labelMedium,
                              )),
                          offset: 4.0,
                          preferredDirection: AxisDirection.right,
                          borderRadius: BorderRadius.circular(8.0),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          tailBaseWidth: 24.0,
                          tailLength: 12.0,
                          waitDuration: const Duration(milliseconds: 100),
                          showDuration: const Duration(milliseconds: 1000),
                          triggerMode: TooltipTriggerMode.tap,
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth('Login', context.mounted);
                            },
                            child: Icon(
                              Icons.power_settings_new_sharp,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
