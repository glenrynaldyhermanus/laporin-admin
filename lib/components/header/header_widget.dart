import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/invitation_dialog/invitation_dialog_widget.dart';
import '/modals/new_form_dialog/new_form_dialog_widget.dart';
import '/modals/new_task_dialog/new_task_dialog_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

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
      width: double.infinity,
      height: 120.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 8.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 26.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.tag_faces,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ].divide(const SizedBox(width: 16.0)),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent1,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (functions.canGoBack(FFAppState().selectedMenu.name)) {
                      context.safePop();
                      return;
                    } else {
                      return;
                    }
                  },
                  child: Text(
                    FFAppState().selectedMenu.name,
                    style: FlutterFlowTheme.of(context).bodyLarge,
                  ),
                ),
                Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Builder(
                  builder: (context) {
                    final actions = FFAppState().selectedMenu.actions.toList();
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(actions.length, (actionsIndex) {
                        final actionsItem = actions[actionsIndex];
                        return Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              var shouldSetState = false;
                              if (actionsItem.type == 'page') {
                                _model.form = await FormsTable().insert({
                                  'business_id':
                                      FFAppState().authUser.businessId,
                                  'owner_id': FFAppState().authUser.userId,
                                  'name': 'New Form',
                                });
                                shouldSetState = true;
                                _model.page = await PagesTable().insert({
                                  'form_id': _model.form?.id,
                                  'name': 'Page One',
                                });
                                shouldSetState = true;
                                await FieldsTable().insert({
                                  'field_type_id': 1,
                                  'page_id': _model.page?.id,
                                  'form_id': _model.form?.id,
                                  'question': 'New Question',
                                });
                                await showAlignedDialog(
                                  context: context,
                                  isGlobal: true,
                                  avoidOverflow: false,
                                  targetAnchor: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: NewFormDialogWidget(
                                        form: _model.form!,
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                if (shouldSetState) setState(() {});
                                return;
                              } else {
                                if (actionsItem.type == 'dialog') {
                                  if (actionsItem.action == 'NewTaskDialog') {
                                    await showAlignedDialog(
                                      context: context,
                                      isGlobal: true,
                                      avoidOverflow: false,
                                      targetAnchor: const AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: const AlignmentDirectional(
                                              0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      builder: (dialogContext) {
                                        return Material(
                                          color: Colors.transparent,
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.7,
                                            child: const NewTaskDialogWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));

                                    if (shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    if (actionsItem.action ==
                                        'InvitationDialog') {
                                      await showAlignedDialog(
                                        context: context,
                                        isGlobal: true,
                                        avoidOverflow: false,
                                        targetAnchor:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.7,
                                              child: const InvitationDialogWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));

                                      if (shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  }
                                } else {
                                  if (shouldSetState) setState(() {});
                                  return;
                                }
                              }

                              if (shouldSetState) setState(() {});
                            },
                            text: actionsItem.name,
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
                        );
                      }).divide(const SizedBox(width: 16.0)),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
