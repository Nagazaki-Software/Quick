import '/components/nav_bar_homes_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'pagina_explore_widget.dart' show PaginaExploreWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaExploreModel extends FlutterFlowModel<PaginaExploreWidget> {
  ///  Local state fields for this page.

  String? direcao = '';

  ///  State fields for stateful widgets in this page.

  // Model for navBarHomesCopy component.
  late NavBarHomesCopyModel navBarHomesCopyModel;

  @override
  void initState(BuildContext context) {
    navBarHomesCopyModel = createModel(context, () => NavBarHomesCopyModel());
  }

  @override
  void dispose() {
    navBarHomesCopyModel.dispose();
  }
}
