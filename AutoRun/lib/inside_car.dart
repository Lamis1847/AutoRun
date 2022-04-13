import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Location_service.dart';
import 'package:geolocator/geolocator.dart';




class InsideCar extends StatefulWidget {
  @override
  _InsideCarState createState() => _InsideCarState();
}

class _InsideCarState extends State<InsideCar> {
  TextEditingController _searchController = TextEditingController();
  late GoogleMapController _controller;
  late Animation _colorTween,
      _homeTween,
      _workOutTween,
      _iconTween,
      _drawerTween;
  List<Marker> allMarkers = [];

  late PageController _pageController;

  int prevPage = 0;

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicules.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.marque),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.marque, snippet: element.location),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }*/

  /*void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }*/

 

   Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
           onPressed: () {
            Navigator.pop(context);
          },
          icon: CircleAvatar(
            backgroundColor: Colors.white,
           child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
         
        ),
        ),
      ),*/
      body: Stack(children: [
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
          return SizedBox(
          height: constraints.maxHeight / 2,
          child: GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            compassEnabled: false,
            initialCameraPosition: CameraPosition(
                target: LatLng(36.69742546502124, 3.075415949250581),
                zoom: 12.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ));
        }),
       
        DraggableScrollableSheet(
            initialChildSize: 0.5,
            
            builder: (BuildContext context, ScrollController ScrollController) {
              return Container(color: Color.fromARGB(255, 255, 255, 255),
              child : Column(
        children: [
        Expanded(
            flex: 8,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 0,
                        blurRadius: 10),
                ],
                ),
                child: Column(
                children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF4361EE),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            ),
                            child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                            children: [
                                Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Column(
                                 // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  Text("Audi R8", style:TextStyle(
                                fontSize: 18,
                                color:Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold
                                ),
                                
                                ),
                                SizedBox(height: 5,),
                                Image.asset('images/batterie.png'),
                                   
                                    ],
                                ),
                                ),
                                Image.asset(
                                "images/AudiR8.png",
                                width: 150,
                                ),
                               
                                
                                ]),
                                          
                                          )),
                    Expanded(
                        flex: 5,
                        child: Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: Container(
                             
                            margin: EdgeInsets.only(
                                left: 40, top: 20, right: 20),
                            child: Column(children: [
                                SizedBox(
                                height: 10,
                                ),
                                Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                children: [
                                    Text("Localisation",
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold,
                                            fontFamily: 'Nunito',
                                            fontSize: 15,
                                            color: Colors.black)),
                                    Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceAround,
                                    
                                    ),
                                   
                                ],
                                ),
                                SizedBox(height: 5,),
                                 TextFormField(
               
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.edit_location),
                                      border: new OutlineInputBorder(
                                     borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                     borderSide: BorderSide(color: Color.fromARGB(255, 153, 153, 153), width: 0.0) //This is Ignored,
                                    ),
                                    hintText: "Av. Colonel Mellah Ali",
                                         
                                    
                                  ),
                                  
                                  
                                ),
                                SizedBox(
                                height: 15,
                                ),
                                 Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                children: [
                                    Text("Destination",
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold,
                                            fontFamily: 'Nunito',
                                            fontSize: 15,
                                            color: Colors.black)),
                                    Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceAround,
                                    
                                    ),
                                   
                                ],
                                ),
                                SizedBox(height: 5,),
                                TextFormField(
               
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.edit_location),
                                      border: new OutlineInputBorder(
                                     borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                     borderSide: BorderSide(color: Color.fromARGB(255, 153, 153, 153), width: 0.0) //This is Ignored,
                                    ),
                                    hintText: "Oued Smar, Algiers 16000",
                                  ),
                                  
                                  
                                ),
                                
                               /* Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(
                                                5)),
                                    child: Container(
                                    margin: EdgeInsets.all(10),
                                   
                                    )),
                                SizedBox(
                                height: 30,
                                ),
                                 Row(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                children: [
                                    Text("Depart",
                                        style: TextStyle(
                                            fontWeight:
                                                FontWeight.bold,
                                            fontFamily: 'Nunito',
                                            fontSize: 15,
                                            color: Colors.black)),
                                    Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceAround,
                                    
                                    ),
                                   
                                ],
                                ),
                                SizedBox(
                                height: 10,
                                ),
                                 Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(
                                                5)),
                                    child: Container(
                                    margin: EdgeInsets.all(10),
                                   
                                    )),*/
                               
                            ]),
                            ))),
                ],
                ),
            ))
        ],
 )
              /*child: Column(
                children: [
                
                Container(
                
                  height: 200,
                  
                  child:Stack(
                  children: [
                  Positioned(
                  top: 50,
                 
                  child: Material(
                  
                    child: Container(
                    height: 150.0,
                    width: 400,
                     
                    ),
                  )),
                  Positioned(
                  top:0,
                  
                  child: Card(
                  elevation: 10.0,
                  
                  child:Container(
                  
                    height: 60,
                    width: 405,
                     
                    decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(5.0),
                    color: Color.fromARGB(255, 29, 6, 240),
                    
                    image: DecorationImage(
                   
                    image:AssetImage("images/AudiR8.png"),
                    ),
                    
                    ),
                    child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                  Text("Audi R8", style:TextStyle(
                  fontSize: 18,
                  color:Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold
                  ),
                  
                  ),
                  SizedBox(height: 5,),
                  Image.asset('images/batterie.png'),
                  ]),
                  )
                  )
                  ),
                  
                  ],
                  )
                  ),
              ]),*/
              
              
              );
            })
      ]),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
      locatePosition();
    });
  }

  Position? currentPosition;
  GoogleMapController? newGoogleMapController;
  void locatePosition() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentPosition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
  }

 /* moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: vehicules[_pageController.page!.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }*/

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<GoogleMapController>('_controller', _controller));
  }
}
