import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _pages = prefs.getString('ff_pages') ?? _pages;
    });
    _safeInit(() {
      _conversasData = prefs
              .getStringList('ff_conversasData')
              ?.map((x) {
                try {
                  return ChatStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _conversasData;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _pages = '';
  String get pages => _pages;
  set pages(String value) {
    _pages = value;
    prefs.setString('ff_pages', value);
  }

  ChatStruct _conversas = ChatStruct();
  ChatStruct get conversas => _conversas;
  set conversas(ChatStruct value) {
    _conversas = value;
  }

  void updateConversasStruct(Function(ChatStruct) updateFn) {
    updateFn(_conversas);
  }

  TodosOsChatsStruct _todasAsConversas = TodosOsChatsStruct();
  TodosOsChatsStruct get todasAsConversas => _todasAsConversas;
  set todasAsConversas(TodosOsChatsStruct value) {
    _todasAsConversas = value;
  }

  void updateTodasAsConversasStruct(Function(TodosOsChatsStruct) updateFn) {
    updateFn(_todasAsConversas);
  }

  List<ChatStruct> _conversasData = [];
  List<ChatStruct> get conversasData => _conversasData;
  set conversasData(List<ChatStruct> value) {
    _conversasData = value;
    prefs.setStringList(
        'ff_conversasData', value.map((x) => x.serialize()).toList());
  }

  void addToConversasData(ChatStruct value) {
    conversasData.add(value);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  void removeFromConversasData(ChatStruct value) {
    conversasData.remove(value);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromConversasData(int index) {
    conversasData.removeAt(index);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  void updateConversasDataAtIndex(
    int index,
    ChatStruct Function(ChatStruct) updateFn,
  ) {
    conversasData[index] = updateFn(_conversasData[index]);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInConversasData(int index, ChatStruct value) {
    conversasData.insert(index, value);
    prefs.setStringList(
        'ff_conversasData', _conversasData.map((x) => x.serialize()).toList());
  }

  List<TodosOsChatsStruct> _todasConversas = [];
  List<TodosOsChatsStruct> get todasConversas => _todasConversas;
  set todasConversas(List<TodosOsChatsStruct> value) {
    _todasConversas = value;
  }

  void addToTodasConversas(TodosOsChatsStruct value) {
    todasConversas.add(value);
  }

  void removeFromTodasConversas(TodosOsChatsStruct value) {
    todasConversas.remove(value);
  }

  void removeAtIndexFromTodasConversas(int index) {
    todasConversas.removeAt(index);
  }

  void updateTodasConversasAtIndex(
    int index,
    TodosOsChatsStruct Function(TodosOsChatsStruct) updateFn,
  ) {
    todasConversas[index] = updateFn(_todasConversas[index]);
  }

  void insertAtIndexInTodasConversas(int index, TodosOsChatsStruct value) {
    todasConversas.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
