import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/message_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'in_chat_widget.dart' show InChatWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InChatModel extends FlutterFlowModel<InChatWidget> {
  ///  Local state fields for this page.

  List<ChatStruct> messages = [];
  void addToMessages(ChatStruct item) => messages.add(item);
  void removeFromMessages(ChatStruct item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, ChatStruct item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(ChatStruct) updateFn) =>
      messages[index] = updateFn(messages[index]);

  List<TodosOsChatsStruct> msgs = [];
  void addToMsgs(TodosOsChatsStruct item) => msgs.add(item);
  void removeFromMsgs(TodosOsChatsStruct item) => msgs.remove(item);
  void removeAtIndexFromMsgs(int index) => msgs.removeAt(index);
  void insertAtIndexInMsgs(int index, TodosOsChatsStruct item) =>
      msgs.insert(index, item);
  void updateMsgsAtIndex(int index, Function(TodosOsChatsStruct) updateFn) =>
      msgs[index] = updateFn(msgs[index]);

  ChatStruct? msg;
  void updateMsgStruct(Function(ChatStruct) updateFn) {
    updateFn(msg ??= ChatStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in InChat widget.
  ChatRecord? queryChat;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
