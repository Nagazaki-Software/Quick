import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/outher_msg_widget.dart';
import '/components/your_msg_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_componente_model.dart';
export 'chat_componente_model.dart';

class ChatComponenteWidget extends StatefulWidget {
  const ChatComponenteWidget({
    super.key,
    required this.chatHistory,
  });

  final DocumentReference? chatHistory;

  @override
  State<ChatComponenteWidget> createState() => _ChatComponenteWidgetState();
}

class _ChatComponenteWidgetState extends State<ChatComponenteWidget> {
  late ChatComponenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatComponenteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChatHistoryRecord>(
      stream: ChatHistoryRecord.getDocument(widget!.chatHistory!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitFadingCube(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }

        final columnChatHistoryRecord = snapshot.data!;

        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, -1.0),
              child: Builder(
                builder: (context) {
                  if (columnChatHistoryRecord.documentUser!.id ==
                      currentUserReference!.id) {
                    return Align(
                      alignment: AlignmentDirectional(1.0, -1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, -1.0),
                            child: wrapWithModel(
                              model: _model.yourMsgModel,
                              updateCallback: () => safeSetState(() {}),
                              child: YourMsgWidget(
                                parameter1: columnChatHistoryRecord.msg,
                                parameter2: dateTimeFormat("relative",
                                    columnChatHistoryRecord.horario!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          wrapWithModel(
                            model: _model.outherMsgModel,
                            updateCallback: () => safeSetState(() {}),
                            child: OutherMsgWidget(
                              parameter1: columnChatHistoryRecord.msg,
                              parameter2: dateTimeFormat(
                                  "relative", columnChatHistoryRecord.horario!),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
