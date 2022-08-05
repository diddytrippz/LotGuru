import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_nav_widget.dart';
import '../components/no_results_widget.dart';
import '../components/second_drop_confirmation_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../single_drop_info/single_drop_info_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QueueFullWidget extends StatefulWidget {
  const QueueFullWidget({Key? key}) : super(key: key);

  @override
  _QueueFullWidgetState createState() => _QueueFullWidgetState();
}

class _QueueFullWidgetState extends State<QueueFullWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                        child: Text(
                          'QUEUE',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'PT Sans',
                                    color: Color(0xFF9A0509),
                                    fontSize: 31,
                                  ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<InventoryRecord>>(
                        stream: queryInventoryRecord(),
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
                          List<InventoryRecord> columnInventoryRecordList =
                              snapshot.data!;
                          if (columnInventoryRecordList.isEmpty) {
                            return Center(
                              child: NoResultsWidget(),
                            );
                          }
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnInventoryRecordList.length,
                                  (columnIndex) {
                                final columnInventoryRecord =
                                    columnInventoryRecordList[columnIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      22, 20, 22, 0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(13),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(13),
                                      ),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(13),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(13),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                    reverseDuration: Duration(
                                                        milliseconds: 0),
                                                    child: SingleDropInfoWidget(
                                                      infoFromQueue:
                                                          columnInventoryRecord,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 18,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFF9900),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(10, 18,
                                                                  10, 0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        4),
                                                            child: AutoSizeText(
                                                              'Stock# ${columnInventoryRecord.stock}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'PT Sans',
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: AutoSizeText(
                                                              '${columnInventoryRecord.make}/${columnInventoryRecord.model}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'PT Sans',
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                              child: Text(
                                                                'Vin# ${columnInventoryRecord.vin}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'PT Sans',
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
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
                                          InkWell(
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                  reverseDuration:
                                                      Duration(milliseconds: 0),
                                                  child: SingleDropInfoWidget(
                                                    infoFromQueue:
                                                        columnInventoryRecord,
                                                  ),
                                                ),
                                              );
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        SecondDropConfirmationWidget(),
                                                  );
                                                },
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 5, 10, 5),
                                                    child: Container(
                                                      width: 85,
                                                      height: 77,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (columnInventoryRecord
                                                                  .isClaimed ==
                                                              true)
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.firstName,
                                                                        '') ==
                                                                    columnInventoryRecord
                                                                        .claimedBy)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            8),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kdeleteUser1,
                                                                        color: Color(
                                                                            0xFF9A0509),
                                                                        size:
                                                                            30,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.firstName,
                                                                        '') ==
                                                                    columnInventoryRecord
                                                                        .claimedBy)
                                                                  AuthUserStreamWidget(
                                                                    child: Text(
                                                                      'YOURS',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'PT Sans',
                                                                            color:
                                                                                Color(0xFF9A0509),
                                                                            fontSize:
                                                                                16,
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          if (columnInventoryRecord
                                                                  .isClaimed ==
                                                              false)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                'TAKE',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'PT Sans',
                                                                      color: Color(
                                                                          0xFF9A0509),
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                              ),
                                                            ),
                                                        ],
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
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                BottomNavWidget(
                  search: Colors.transparent,
                  queue: Color(0xFFC60000),
                  add: Colors.transparent,
                  profile: Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
