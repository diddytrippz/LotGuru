import '../admin_main/admin_main_widget.dart';
import '../admin_profile/admin_profile_widget.dart';
import '../auth/auth_util.dart';
import '../components/admin_access_denied_widget.dart';
import '../components/logout_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCompWidget extends StatefulWidget {
  const ProfileCompWidget({Key? key}) : super(key: key);

  @override
  _ProfileCompWidgetState createState() => _ProfileCompWidgetState();
}

class _ProfileCompWidgetState extends State<ProfileCompWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 90),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: Material(
                color: Colors.transparent,
                elevation: 30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Container(
                  width: 94,
                  decoration: BoxDecoration(
                    color: Color(0x00EEEEEE),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: Color(0xFFEFEFEF),
                      width: 0.1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          if ((currentUserDocument?.access?.toList() ?? [])
                              .contains('Admin Access')) {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                                reverseDuration: Duration(milliseconds: 0),
                                child: AdminMainWidget(),
                              ),
                            );
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x8B000000),
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: AdminAccessDeniedWidget(),
                                );
                              },
                            );
                          }
                        },
                        child: ListTile(
                          title: Text(
                            'Admin',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          tileColor: Colors.white,
                          dense: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                              reverseDuration: Duration(milliseconds: 0),
                              child: AdminProfileWidget(),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            'Profile',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          tileColor: Colors.white,
                          dense: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0xB2000000),
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: LogoutWidget(),
                              );
                            },
                          );
                        },
                        child: ListTile(
                          title: Text(
                            'Logout',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          tileColor: Colors.white,
                          dense: true,
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: ListTile(
                          title: Text(
                            'Cancel',
                            style: FlutterFlowTheme.of(context).title3,
                          ),
                          tileColor: Colors.white,
                          dense: true,
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
    );
  }
}
