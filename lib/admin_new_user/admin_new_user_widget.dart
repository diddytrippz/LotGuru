import '../admin_users/admin_users_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admin_access_denied_widget.dart';
import '../components/bottom_nav_admin_widget.dart';
import '../flutter_flow/flutter_flow_checkbox_group.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../queue_full/queue_full_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminNewUserWidget extends StatefulWidget {
  const AdminNewUserWidget({Key? key}) : super(key: key);

  @override
  _AdminNewUserWidgetState createState() => _AdminNewUserWidgetState();
}

class _AdminNewUserWidgetState extends State<AdminNewUserWidget> {
  List<String>? checkboxGroupValues;
  String? dropDownLocationValue;
  String? dropDownRoleValue;
  TextEditingController? textFieldCompanyController;
  TextEditingController? textFieldEmailUserController;
  TextEditingController? textFieldPhoneController;
  TextEditingController? textFieldSurnameController;
  TextEditingController? textFieldnameController;
  TextEditingController? textFieldtempPasswordController;
  late bool textFieldtempPasswordVisibility;
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

    textFieldEmailUserController = TextEditingController();
    textFieldPhoneController = TextEditingController();
    textFieldSurnameController = TextEditingController();
    textFieldnameController = TextEditingController();
    textFieldtempPasswordController = TextEditingController();
    textFieldtempPasswordVisibility = false;
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 120, 8, 0),
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
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                              child: Text(
                                'New User',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'PT Sans',
                                      color: Color(0xFF9A0509),
                                      fontSize: 27,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32, 0, 12, 0),
                                child: TextFormField(
                                  controller: textFieldnameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'First Name',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
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
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 32, 0),
                                child: TextFormField(
                                  controller: textFieldSurnameController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
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
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textFieldPhoneController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Phone',
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
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textFieldtempPasswordController,
                          obscureText: !textFieldtempPasswordVisibility,
                          decoration: InputDecoration(
                            hintText: 'Temporary Password',
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
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => textFieldtempPasswordVisibility =
                                    !textFieldtempPasswordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                textFieldtempPasswordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 16,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 12, 32, 0),
                        child: TextFormField(
                          controller: textFieldEmailUserController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Email',
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
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                              'email',
                              isEqualTo: currentUserEmail != ''
                                  ? currentUserEmail
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> textFieldCompanyUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final textFieldCompanyUsersRecord =
                              textFieldCompanyUsersRecordList.first;
                          return TextFormField(
                            controller: textFieldCompanyController ??=
                                TextEditingController(
                              text: textFieldCompanyUsersRecord.business,
                            ),
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Phone',
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              filled: true,
                              fillColor: Color(0x00FFFFFF),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'PT Sans',
                                      color: Colors.transparent,
                                      fontSize: 2,
                                    ),
                            keyboardType: TextInputType.phone,
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                        child: AuthUserStreamWidget(
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
                              List<UsersRecord> dropDownRoleUsersRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the document does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final dropDownRoleUsersRecord =
                                  dropDownRoleUsersRecordList.first;
                              return FlutterFlowDropDown(
                                options: dropDownRoleUsersRecord.role!
                                    .toList()
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => dropDownRoleValue = val),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'PT Sans',
                                      color: Colors.black,
                                    ),
                                hintText: 'Role',
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
                        child: FlutterFlowDropDown(
                          options: ['Option 1'],
                          onChanged: (val) =>
                              setState(() => dropDownLocationValue = val),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'PT Sans',
                                    color: Colors.black,
                                  ),
                          hintText: 'Location',
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Colors.black,
                          borderWidth: 1,
                          borderRadius: 6,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(80, 20, 80, 20),
                          child: FlutterFlowCheckboxGroup(
                            initiallySelected: checkboxGroupValues ??= [],
                            options: [
                              'Perform Drops',
                              'Add/Edit/Delete Inventory',
                              'Request One Ways',
                              'Request Swaps',
                              'Admin Access'
                            ].toList(),
                            onChanged: (val) =>
                                setState(() => checkboxGroupValues = val),
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            checkColor: Colors.white,
                            checkboxBorderColor: Color(0xFF95A1AC),
                            textStyle: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(40, 0, 40, 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  final user = await createAccountWithEmail(
                                    context,
                                    textFieldEmailUserController!.text,
                                    textFieldtempPasswordController!.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  final usersCreateData = {
                                    ...createUsersRecordData(
                                      email: textFieldEmailUserController!.text,
                                      firstName: textFieldnameController!.text,
                                      lastName:
                                          textFieldSurnameController!.text,
                                      phone: int.parse(
                                          textFieldPhoneController!.text),
                                      displayName:
                                          '${textFieldnameController!.text} ${textFieldSurnameController!.text}',
                                      business:
                                          textFieldCompanyController?.text ??
                                              '',
                                    ),
                                    'access': checkboxGroupValues,
                                    'role': [dropDownRoleValue],
                                  };
                                  await UsersRecord.collection
                                      .doc(user.uid)
                                      .update(usersCreateData);

                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child: AdminUsersWidget(),
                                    ),
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
                                      'SAVE',
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                                child: Container(
                                  width: 115,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF8F8F8F),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'DELETE',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'PT Sans',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
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
