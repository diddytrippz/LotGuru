import '../admin_main/admin_main_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admin_access_denied_widget.dart';
import '../components/bottom_nav_admin_widget.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../queue_full/queue_full_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminRolesWidget extends StatefulWidget {
  const AdminRolesWidget({Key? key}) : super(key: key);

  @override
  _AdminRolesWidgetState createState() => _AdminRolesWidgetState();
}

class _AdminRolesWidgetState extends State<AdminRolesWidget> {
  List<String>? checkboxGroupValues;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(currentUserDocument?.access?.toList() ?? [])
          .contains('Admin Access')) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Color(0x84000000),
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: AdminAccessDeniedWidget(),
            );
          },
        );
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
            reverseDuration: Duration(milliseconds: 0),
            child: QueueFullWidget(),
          ),
        );
      } else {
        return;
      }
    });

    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 30),
                        child: Text(
                          'Roles',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'PT Sans',
                                    color: Color(0xFF9A0509),
                                    fontSize: 27,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      AuthUserStreamWidget(
                        child: StreamBuilder<List<UsersRecord>>(
                          stream: queryUsersRecord(
                            queryBuilder: (usersRecord) => usersRecord
                                .where('isAccountHolder', isEqualTo: true)
                                .where('business',
                                    isEqualTo: valueOrDefault(
                                                currentUserDocument?.business,
                                                '') !=
                                            ''
                                        ? valueOrDefault(
                                            currentUserDocument?.business, '')
                                        : null),
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
                            List<UsersRecord> columnUsersRecordList =
                                snapshot.data!;
                            // Return an empty Container when the document does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnUsersRecord =
                                columnUsersRecordList.first;
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30, 0, 30, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Icon(
                                              FFIcons.kuser1,
                                              color: Color(0xFF9A0509),
                                              size: 22,
                                            ),
                                          ),
                                          Container(
                                            width: 200,
                                            decoration: BoxDecoration(),
                                            child: FlutterFlowCheckboxGroup(
                                              initiallySelected:
                                                  checkboxGroupValues ??= [],
                                              options: columnUsersRecord.role!
                                                  .toList()
                                                  .toList(),
                                              onChanged: (val) => setState(() =>
                                                  checkboxGroupValues = val),
                                              activeColor: Color(0x0014181B),
                                              checkColor: Color(0x00FFFFFF),
                                              checkboxBorderColor:
                                                  Color(0x0095A1AC),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.edit_outlined,
                                            color: Colors.black,
                                            size: 28,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Icon(
                                              Icons.clear,
                                              color: Colors.black,
                                              size: 28,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: Text(
                          'Add Role',
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
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'New Roles',
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
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40, 20, 40, 30),
                          child: AuthUserStreamWidget(
                            child: StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                queryBuilder: (usersRecord) => usersRecord
                                    .where('isAccountHolder', isEqualTo: true)
                                    .where('business',
                                        isEqualTo: valueOrDefault(
                                                    currentUserDocument
                                                        ?.business,
                                                    '') !=
                                                ''
                                            ? valueOrDefault(
                                                currentUserDocument?.business,
                                                '')
                                            : null),
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
                                List<UsersRecord> rowUsersRecordList =
                                    snapshot.data!;
                                final rowUsersRecord = rowUsersRecordList.first;
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        final usersUpdateData = {
                                          'role': FieldValue.arrayUnion(
                                              [textController!.text]),
                                        };
                                        await currentUserReference!
                                            .update(usersUpdateData);
                                        setState(() {
                                          textController?.clear();
                                        });
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
                                          borderRadius:
                                              BorderRadius.circular(6),
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          14, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                              reverseDuration:
                                                  Duration(milliseconds: 0),
                                              child: AdminMainWidget(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 115,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8F8F8F),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              'Cancel',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'PT Sans',
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
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
