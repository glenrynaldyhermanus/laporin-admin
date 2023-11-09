import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'side_bar_model.dart';
export 'side_bar_model.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({super.key});

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
                child: Container(
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
                            FFAppState().authUser.business,
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
                              FFAppState().authUser.business),
                          'L',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final menus = FFAppState().menus.toList();
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(menus.length, (menusIndex) {
                        final menusItem = menus[menusIndex];
                        return Container(
                          width: 36.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FFAppState().selectedMenu.name ==
                                    menusItem.name
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
                                    menusItem.name,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium,
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
                              child: Builder(
                                builder: (context) {
                                  if (menusItem.iconType == 0) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().selectedMenu = menusItem;
                                        });

                                        context.pushNamed('Home');
                                      },
                                      child: Icon(
                                        Icons.space_dashboard,
                                        color: FFAppState().selectedMenu.name ==
                                                menusItem.name
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        size: 20.0,
                                      ),
                                    );
                                  } else if (menusItem.iconType == 1) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().selectedMenu = menusItem;
                                        });

                                        context.pushNamed('Tasks');
                                      },
                                      child: Icon(
                                        Icons.task_alt,
                                        color: FFAppState().selectedMenu.name ==
                                                menusItem.name
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        size: 20.0,
                                      ),
                                    );
                                  } else if (menusItem.iconType == 2) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().selectedMenu = menusItem;
                                        });

                                        context.pushNamed('Forms');
                                      },
                                      child: Icon(
                                        Icons.feed_rounded,
                                        color: FFAppState().selectedMenu.name ==
                                                menusItem.name
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        size: 20.0,
                                      ),
                                    );
                                  } else if (menusItem.iconType == 3) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().selectedMenu = menusItem;
                                        });

                                        context.pushNamed('Users');
                                      },
                                      child: Icon(
                                        Icons.people_rounded,
                                        color: FFAppState().selectedMenu.name ==
                                                menusItem.name
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        size: 20.0,
                                      ),
                                    );
                                  } else {
                                    return Icon(
                                      Icons.space_dashboard,
                                      color: FFAppState().selectedMenu.name ==
                                              menusItem.name
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      size: 20.0,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        );
                      })
                          .divide(const SizedBox(height: 16.0))
                          .around(const SizedBox(height: 16.0)),
                    );
                  },
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
