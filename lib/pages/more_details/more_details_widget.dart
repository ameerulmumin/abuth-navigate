// ignore_for_file: must_be_immutable

import 'dart:collection';

import 'package:a_b_u_t_h_navigate/index.dart';
import 'package:a_b_u_t_h_navigate/pages/model/places_model.dart';
import 'package:a_b_u_t_h_navigate/pages/more_details/mapview.dart';
import 'package:a_b_u_t_h_navigate/pages/more_details/sub_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as google_maps_flutter;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'more_details_model.dart';
export 'more_details_model.dart';

class MoreDetailsWidget extends StatefulWidget {
  String? place_id;
  MoreDetailsWidget({
    Key? key,
    required this.place_id,
  }) : super(key: key);

  @override
  _MoreDetailsWidgetState createState() => _MoreDetailsWidgetState();
}

class _MoreDetailsWidgetState extends State<MoreDetailsWidget>
    with TickerProviderStateMixin {
  late MoreDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoreDetailsModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  void contribution(BuildContext context, Place place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ContributionWidget(),
      ),
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  CameraPosition? _kGooglePlex;

  void setk(double lat, double lang) {
    _kGooglePlex = CameraPosition(
      target: google_maps_flutter.LatLng(11.176243145719374, 7.604854368697713),
      zoom: 17.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('PLACES')
                  .doc(widget.place_id)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data != null && snapshot.data!.exists) {
                  Place placesModel = Place.fromFirestore(snapshot.data!);
                  print(placesModel.latLng.latitude.toString());

                  return Stack(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, -1.00),
                        child: Image.network(
                          placesModel.image.isNotEmpty
                              ? placesModel.image
                              : 'https://images.unsplash.com/photo-1612445076771-7ab7c46780a3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxQTEFDRXxlbnwwfHx8fDE2OTUzMjE4MDN8MA&ixlib=rb-4.0.3&q=80&w=1080',
                          width: double.infinity,
                          height: 340.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, -0.87),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x520E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                              ),
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x520E151B),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.directions_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 100.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 200.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 800.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x320E151B),
                                          offset: Offset(0.0, -2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  placesModel.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    "Lat:" +
                                                        placesModel
                                                            .latLng.latitude
                                                            .toString() +
                                                        " | " +
                                                        "Long:" +
                                                        placesModel
                                                            .latLng.longitude
                                                            .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment(0.0, 0),
                                                    child: TabBar(
                                                      labelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      unselectedLabelColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                      unselectedLabelStyle:
                                                          TextStyle(),
                                                      indicatorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      tabs: [
                                                        Tab(
                                                          text: 'Places',
                                                        ),
                                                        Tab(
                                                          text: 'Map',
                                                        ),
                                                      ],
                                                      controller: _model
                                                          .tabBarController,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: TabBarView(
                                                      controller: _model
                                                          .tabBarController,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      24.0),
                                                          child: SizedBox(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: 500,
                                                            child: StreamBuilder<
                                                                    QuerySnapshot>(
                                                                stream: FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'PLACES')
                                                                    .doc(widget
                                                                        .place_id)
                                                                    .collection(widget.place_id ==
                                                                            "HOSPITAL_FACILITIES"
                                                                        ? 'sub'
                                                                        : 'SUB')
                                                                    .orderBy(
                                                                        'DATE_ADDED')
                                                                    .snapshots(),
                                                                builder: (context,
                                                                    ssnapshot) {
                                                                  if (ssnapshot
                                                                              .data !=
                                                                          null &&
                                                                      ssnapshot
                                                                              .data!
                                                                              .docs
                                                                              .length >
                                                                          0) {
                                                                    return ListView
                                                                        .builder(
                                                                            itemCount:
                                                                                ssnapshot.data!.docs.length,
                                                                            itemBuilder: (context, index) {
                                                                              PlaceSub placeSub = PlaceSub.fromFirestore(ssnapshot.data!.docs[index]);
                                                                              return GestureDetector(
                                                                                onTap: () {
                                                                                  Navigator.of(context).push(
                                                                                    MaterialPageRoute(
                                                                                      builder: (context) => PlaceDetailScreen(
                                                                                        placeSub: placeSub,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 8.0),
                                                                                              child: Text(
                                                                                                placeSub.NAME,
                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              "Lat:" + placeSub.LAT_LNG.latitude.toString() + " | " + "Long:" + placeSub.LAT_LNG.longitude.toString(),
                                                                                              style: FlutterFlowTheme.of(context).labelMedium,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                                                                                        child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          child: Image.network(
                                                                                            placeSub.IMAGES.length > 0 ? placeSub.IMAGES[0] : 'https://images.unsplash.com/photo-1519582149095-fe7d19b2a3d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8d2F0ZXJmYWxsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                                                                            width: 100.0,
                                                                                            height: 100.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            });
                                                                  } else {
                                                                    return SizedBox();
                                                                  }
                                                                }),
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        24.0),
                                                            child: SizedBox(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: 500,
                                                                child:
                                                                    MapView11(
                                                                  place_id:
                                                                      placesModel,
                                                                )))
                                                      ],
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              }),
        ),
      ),
    );
  }
}
