import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/request_move2_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestMoveWidget extends StatefulWidget {
  const RequestMoveWidget({
    Key? key,
    this.moveDetails,
  }) : super(key: key);

  final InventoryRecord? moveDetails;

  @override
  _RequestMoveWidgetState createState() => _RequestMoveWidgetState();
}

class _RequestMoveWidgetState extends State<RequestMoveWidget> {
  String? dropDownValue;

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
                      'Stock# ${widget.moveDetails!.stock}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'PT Sans',
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(33, 0, 33, 25),
                    child: Text(
                      'Move to location',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'PT Sans',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord
                              .where('business',
                                  isEqualTo: valueOrDefault(
                                              currentUserDocument?.business,
                                              '') !=
                                          ''
                                      ? valueOrDefault(
                                          currentUserDocument?.business, '')
                                      : null)
                              .where('isAccountHolder', isEqualTo: true),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> dropDownUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final dropDownUsersRecord =
                              dropDownUsersRecordList.first;
                          return FlutterFlowDropDown(
                            options: dropDownUsersRecord.locationLabel!
                                .toList()
                                .toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue = val),
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'PT Sans',
                                      color: Colors.black,
                                    ),
                            hintText: 'Choose location',
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 35,
                            ),
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderWidth: 1,
                            borderRadius: 2,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          );
                        },
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
                            Navigator.pop(context);
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x8A000000),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: RequestMove2Widget(
                                    requestLocation: dropDownValue,
                                  ),
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
                                'OK',
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
