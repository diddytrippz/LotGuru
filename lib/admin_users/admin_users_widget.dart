import '../admin_edit_users/admin_edit_users_widget.dart';
import '../admin_new_user/admin_new_user_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admin_access_denied_widget.dart';
import '../components/bottom_nav_admin_widget.dart';
import '../components/delete_user_widget.dart';
import '../components/no_result_users_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../queue_full/queue_full_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminUsersWidget extends StatefulWidget {
  const AdminUsersWidget({Key? key}) : super(key: key);

  @override
  _AdminUsersWidgetState createState() => _AdminUsersWidgetState();
}

class _AdminUsersWidgetState extends State<AdminUsersWidget> {
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
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 120, 8, 40),
                          child: InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Text(
                              '<',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'PT Sans',
                                    color: Color(0xFF868788),
                                    fontSize: 35,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 40),
                        child: Text(
                          'Users',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'PT Sans',
                                    color: Color(0xFF9A0509),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                              'business',
                              isEqualTo: valueOrDefault(
                                          currentUserDocument?.business, '') !=
                                      ''
                                  ? valueOrDefault(
                                      currentUserDocument?.business, '')
                                  : null),
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
                          List<UsersRecord> columnUsersRecordList =
                              snapshot.data!;
                          if (columnUsersRecordList.isEmpty) {
                            return Center(
                              child: NoResultUsersWidget(),
                            );
                          }
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnUsersRecordList.length, (columnIndex) {
                                final columnUsersRecord =
                                    columnUsersRecordList[columnIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      40, 10, 40, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FFIcons.kuser1,
                                            color: Color(0xFF9A0509),
                                            size: 24,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 0, 0),
                                            child: Text(
                                              '${columnUsersRecord.firstName} ${columnUsersRecord.lastName}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'PT Sans',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
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
                                                  child: AdminEditUsersWidget(
                                                    currentUserEdit:
                                                        columnUsersRecord,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.edit_outlined,
                                              color: Colors.black,
                                              size: 28,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
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
                                                      child: DeleteUserWidget(
                                                        currentDeleteUser:
                                                            columnUsersRecord,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color: Colors.black,
                                                size: 28,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 120),
                    child: InkWell(
                      onTap: () async {
                        setState(() => FFAppState().Adminbusiness =
                            valueOrDefault(currentUserDocument?.business, ''));
                        setState(() =>
                            FFAppState().adminRole = FFAppState().adminRole);
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                            reverseDuration: Duration(milliseconds: 0),
                            child: AdminNewUserWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: 152,
                        height: 60,
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
                            'ADD USERS',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
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
                ],
              ),
              BottomNavAdminWidget(
                search: FlutterFlowTheme.of(context).customTransp,
                queue: FlutterFlowTheme.of(context).customTransp,
                add: FlutterFlowTheme.of(context).customTransp,
                profile: FlutterFlowTheme.of(context).customTransp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
