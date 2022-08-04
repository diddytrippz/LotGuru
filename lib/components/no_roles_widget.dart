import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoRolesWidget extends StatefulWidget {
  const NoRolesWidget({Key? key}) : super(key: key);

  @override
  _NoRolesWidgetState createState() => _NoRolesWidgetState();
}

class _NoRolesWidgetState extends State<NoRolesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Roles have been created yet',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).title3.override(
                  fontFamily: 'PT Sans',
                  color: Color(0xFFB82925),
                  fontSize: 27,
                ),
          ),
        ],
      ),
    );
  }
}
