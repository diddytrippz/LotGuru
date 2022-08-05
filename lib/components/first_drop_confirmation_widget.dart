import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/second_drop_confirmation_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstDropConfirmationWidget extends StatefulWidget {
  const FirstDropConfirmationWidget({
    Key? key,
    this.dropGeoInfo,
    this.docToUpdate,
  }) : super(key: key);

  final LatLng? dropGeoInfo;
  final InventoryRecord? docToUpdate;

  @override
  _FirstDropConfirmationWidgetState createState() =>
      _FirstDropConfirmationWidgetState();
}

class _FirstDropConfirmationWidgetState
    extends State<FirstDropConfirmationWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 332,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryColor,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(33, 59, 33, 15),
                    child: Text(
                      'Stock#: 4387',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'PT Sans',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Icon(
                      FFIcons.knounDown11419475,
                      color: Colors.black,
                      size: 75,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(33, 0, 33, 20),
                    child: Text(
                      widget.docToUpdate!.currentLoc!,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'PT Sans',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(33, 0, 33, 30),
                    child: Text(
                      'Are you sure you want to drop?',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'PT Sans',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(67, 0, 67, 49),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            final inventoryUpdateData =
                                createInventoryRecordData(
                              geoLocation: widget.dropGeoInfo,
                            );
                            await widget.docToUpdate!.reference
                                .update(inventoryUpdateData);
                            Navigator.pop(context);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x7F000000),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: SecondDropConfirmationWidget(),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 91,
                            height: 55,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFEC1C24), Color(0xFFA6080D)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0, -1),
                                end: AlignmentDirectional(0, 1),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                'YES',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'PT Sans',
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 91,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Color(0xFF8F8F8F),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'NO',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'PT Sans',
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
