import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_nav_admin_widget.dart';
import '../components/stock_added_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddInventoryAdminWidget extends StatefulWidget {
  const AddInventoryAdminWidget({Key? key}) : super(key: key);

  @override
  _AddInventoryAdminWidgetState createState() =>
      _AddInventoryAdminWidgetState();
}

class _AddInventoryAdminWidgetState extends State<AddInventoryAdminWidget> {
  String? dropDownValue;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                        child: Text(
                          'Add',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'PT Sans',
                                    color: Color(0xFF9A0509),
                                    fontSize: 27,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Stock#: XXXXX',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textController2,
                          readOnly: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Vin#:XXXXXXXXXXXXXXXXX',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Make:',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textController4,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Model:',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textController5,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Type:',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: AuthUserStreamWidget(
                          child: StreamBuilder<List<UsersRecord>>(
                            stream: queryUsersRecord(
                              queryBuilder: (usersRecord) => usersRecord.where(
                                  'business',
                                  isEqualTo: valueOrDefault(
                                      currentUserDocument?.business, '')),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
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
                                initialOption: dropDownValue ??= 'Locations',
                                options: dropDownUsersRecord.locationLabel!
                                    .toList()
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => dropDownValue = val),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                hintText: 'Locations',
                                fillColor: Colors.white,
                                elevation: 2,
                                borderColor: Colors.black,
                                borderWidth: 1,
                                borderRadius: 6,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textController6,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Notes',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          maxLines: 5,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40, 30, 40, 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: InkWell(
                                  onTap: () async {
                                    final inventoryCreateData =
                                        createInventoryRecordData(
                                      make: textController3!.text,
                                      notes: textController6!.text,
                                      stock: textController1!.text,
                                      user: currentUserReference,
                                      vin: textController2!.text,
                                      model: textController4!.text,
                                      type: textController5!.text,
                                      currentLoc: dropDownValue,
                                    );
                                    await InventoryRecord.collection
                                        .doc()
                                        .set(inventoryCreateData);
                                    setState(() => FFAppState().inventoryAdded =
                                        textController1!.text);
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0xBA000000),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            child: StockAddedWidget(),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 115,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFEC1C24),
                                          Color(0xFFA6080D)
                                        ],
                                        stops: [0, 1],
                                        begin: AlignmentDirectional(0, -1),
                                        end: AlignmentDirectional(0, 1),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        'ADD',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'PT Sans',
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 115,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8A8A8A),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'CANCEL',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'PT Sans',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomNavAdminWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
