import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_nav_widget.dart';
import '../components/first_drop_confirmation_widget.dart';
import '../components/release_widget.dart';
import '../components/request_move_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleDropMapWidget extends StatefulWidget {
  const SingleDropMapWidget({
    Key? key,
    this.dataFromInfo,
  }) : super(key: key);

  final InventoryRecord? dataFromInfo;

  @override
  _SingleDropMapWidgetState createState() => _SingleDropMapWidgetState();
}

class _SingleDropMapWidgetState extends State<SingleDropMapWidget> {
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().showMarker = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnTexts,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            FlutterFlowGoogleMap(
              controller: googleMapsController,
              onCameraIdle: (latLng) =>
                  setState(() => googleMapsCenter = latLng),
              initialLocation: googleMapsCenter ??=
                  widget.dataFromInfo!.geoLocation!,
              markers: [
                if (widget.dataFromInfo != null)
                  FlutterFlowMarker(
                    widget.dataFromInfo!.reference.path,
                    widget.dataFromInfo!.geoLocation!,
                    () async {
                      setState(() => FFAppState().showMarker = true);
                    },
                  ),
              ],
              markerColor: GoogleMarkerColor.red,
              mapType: MapType.normal,
              style: GoogleMapStyle.standard,
              initialZoom: 18,
              allowInteraction: true,
              allowZoom: true,
              showZoomControls: false,
              showLocation: false,
              showCompass: false,
              showMapToolbar: true,
              showTraffic: false,
              centerMapOnMarkerTap: true,
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 80),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (FFAppState().showMarker)
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(27, 75, 27, 0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 18,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF9900),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(13),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(13),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 18, 0, 0),
                                            child: Text(
                                              'Take from ${widget.dataFromInfo!.currentLoc} to ${widget.dataFromInfo!.currentLoc}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'PT Sans',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                          if (widget.dataFromInfo!.isClaimed ==
                                              true)
                                            Text(
                                              'Requested by ${widget.dataFromInfo!.claimedBy}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'PT Sans',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 10, 5),
                                            child: Container(
                                              width: 85,
                                              height: 77,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  if (widget.dataFromInfo!
                                                          .isClaimed ==
                                                      true) {
                                                    if (valueOrDefault(
                                                            currentUserDocument
                                                                ?.firstName,
                                                            '') ==
                                                        widget.dataFromInfo!
                                                            .claimedBy) {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child:
                                                                ReleaseWidget(
                                                              releaseDetails: widget
                                                                  .dataFromInfo,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Color(0x8A000000),
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              RequestMoveWidget(
                                                            moveDetails: widget
                                                                .dataFromInfo,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    if (widget.dataFromInfo!
                                                            .isClaimed ==
                                                        true)
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.firstName,
                                                                  '') ==
                                                              widget
                                                                  .dataFromInfo!
                                                                  .claimedBy)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          5),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                child: Icon(
                                                                  FFIcons
                                                                      .kdeleteUser1,
                                                                  color: Color(
                                                                      0xFF9A0509),
                                                                  size: 30,
                                                                ),
                                                              ),
                                                            ),
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.firstName,
                                                                  '') ==
                                                              widget
                                                                  .dataFromInfo!
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
                                                                      color: Color(
                                                                          0xFF9A0509),
                                                                      fontSize:
                                                                          16,
                                                                    ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    if (widget.dataFromInfo!
                                                            .isClaimed ==
                                                        false)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          'TAKE',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'PT Sans',
                                                                color: Color(
                                                                    0xFF9A0509),
                                                                fontSize: 18,
                                                              ),
                                                        ),
                                                      ),
                                                  ],
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
                        ),
                      if (!FFAppState().showMarker)
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(27, 75, 27, 0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                          child: Stack(
                            alignment: AlignmentDirectional(0, 0),
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 1),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            27, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            height: 75,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF8F8F8F),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(7),
                                                bottomRight: Radius.circular(0),
                                                topLeft: Radius.circular(7),
                                                topRight: Radius.circular(0),
                                              ),
                                            ),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(-0.6, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Icon(
                                                      Icons.info_outlined,
                                                      color: Colors.white,
                                                      size: 27,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Text(
                                                      'VIEW INFO',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'PT Sans',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 27, 0),
                                        child: Container(
                                          height: 75,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(7),
                                              topLeft: Radius.circular(0),
                                              topRight: Radius.circular(7),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.45, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .mapMarkedAlt,
                                                    color: Colors.white,
                                                    size: 27,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                                  child: Text(
                                                    'VIEW MAP',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'PT Sans',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x9D000000),
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: FirstDropConfirmationWidget(
                                            dropGeoInfo: googleMapsCenter,
                                            docToUpdate: widget.dataFromInfo,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                      image: DecorationImage(
                                        fit: BoxFit.scaleDown,
                                        image: Image.asset(
                                          'assets/images/image_1.png',
                                        ).image,
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
              ],
            ),
            BottomNavWidget(
              search: Colors.transparent,
              queue: Colors.transparent,
              add: Colors.transparent,
              profile: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
