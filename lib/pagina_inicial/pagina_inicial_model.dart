import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/ainda_nao_existe_task_widget.dart';
import '/components/image_inicio_page_view_widget.dart';
import '/components/nav_bar_homes_copy2_widget.dart';
import '/components/nav_bar_tinder_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'pagina_inicial_widget.dart' show PaginaInicialWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaginaInicialModel extends FlutterFlowModel<PaginaInicialWidget> {
  ///  Local state fields for this page.

  String? direcao = '';

  Color heartPress = Color(4279703062);

  bool aceitar = false;

  DocumentReference? taskDocument;

  ///  State fields for stateful widgets in this page.

  // Model for navBarHomesCopy2 component.
  late NavBarHomesCopy2Model navBarHomesCopy2Model;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Model for navBarTinder component.
  late NavBarTinderModel navBarTinderModel;

  @override
  void initState(BuildContext context) {
    navBarHomesCopy2Model = createModel(context, () => NavBarHomesCopy2Model());
    swipeableStackController = CardSwiperController();
    navBarTinderModel = createModel(context, () => NavBarTinderModel());
  }

  @override
  void dispose() {
    navBarHomesCopy2Model.dispose();
    navBarTinderModel.dispose();
  }
}
