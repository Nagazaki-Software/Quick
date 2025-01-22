import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_homes_copy_model.dart';
export 'nav_bar_homes_copy_model.dart';

class NavBarHomesCopyWidget extends StatefulWidget {
  const NavBarHomesCopyWidget({super.key});

  @override
  State<NavBarHomesCopyWidget> createState() => _NavBarHomesCopyWidgetState();
}

class _NavBarHomesCopyWidgetState extends State<NavBarHomesCopyWidget> {
  late NavBarHomesCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarHomesCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/Ativo_7hbk.png',
                              width: 180.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                              alignment: Alignment(-1.0, 0.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(width: 4.0)),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.settings_sharp,
                    color: FlutterFlowTheme.of(context).info,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'configuracoess',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 350),
                        ),
                      },
                    );
                  },
                ),
              ],
            ),
          ].divide(SizedBox(width: 12.0)),
        ),
      ),
    );
  }
}
