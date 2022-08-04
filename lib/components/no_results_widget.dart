import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoResultsWidget extends StatefulWidget {
  const NoResultsWidget({Key? key}) : super(key: key);

  @override
  _NoResultsWidgetState createState() => _NoResultsWidgetState();
}

class _NoResultsWidgetState extends State<NoResultsWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/MapBackground.jpeg',
            ).image,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nothing in Queue',
                style: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'PT Sans',
                      color: Color(0xFFB82925),
                      fontSize: 27,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
