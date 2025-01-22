import '/components/nav_bar_homes_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'score_board_widget.dart' show ScoreBoardWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScoreBoardModel extends FlutterFlowModel<ScoreBoardWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBarHomes component.
  late NavBarHomesModel navBarHomesModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarHomesModel = createModel(context, () => NavBarHomesModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarHomesModel.dispose();
    navBarModel.dispose();
  }
}
