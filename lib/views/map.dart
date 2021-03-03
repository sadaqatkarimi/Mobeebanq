import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class mapView extends StatefulWidget {
  @override
  mapViewState createState() => mapViewState();
}

class mapViewState extends State<mapView> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(FontAwesomeIcons.arrowLeft),
        //     onPressed: () {
        //       //
        //     }),
        title: Text("New York"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          // _zoomminusfunction(),
          // _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  // Widget _zoomminusfunction() {
  //
  //   return Align(
  //     alignment: Alignment.topLeft,
  //     child: IconButton(
  //         icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
  //         onPressed: () {
  //           zoomVal--;
  //           _minus( zoomVal);
  //         }),
  //   );
  // }
  // Widget _zoomplusfunction() {
  //
  //   return Align(
  //     alignment: Alignment.topRight,
  //     child: IconButton(
  //         icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
  //         onPressed: () {
  //           zoomVal++;
  //           _plus(zoomVal);
  //         }),
  //   );
  // }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.712776, -74.005974), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        // color: Colors.red,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 220.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [

                  _boxes(
                      "images/recipe1.jpg",
                      40.738380, -73.988426,"Gramercy Tavern"),
                  Positioned(
                    top:10,
                    left: 15,
                    child: Container(
                      width: 120,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("images/recipe1.jpg",),
                        ),
                      ),),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  _boxes(
                      "images/recipe3.jpg",
                      40.761421, -73.981667,"Le Bernardin"),
                  Positioned(
                    top:10,
                    left: 15,
                    child: Container(
                      width: 120,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("images/recipe3.jpg",),
                        ),
                      ),),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  _boxes(
                      "images/recipe4.jpg",
                      40.732128, -73.999619,"Blue Hill"),
                  Positioned(
                    top:10,
                    left: 15,
                    child: Container(
                      width: 120,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage( "images/recipe4.jpg",),
                        ),
                      ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return  GestureDetector(
      onTap: () {
        _gotoLocation(lat,long);
      },
      child:Column(
        children: [
          SizedBox(height: 40,),
          Container(
            child: new FittedBox(
              child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(10.0),
                  shadowColor: Color(0x802196F3),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.6,
                        height: MediaQuery.of(context).size.height/5,
                        // color: Colors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: myDetailsContainer1(restaurantName),
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(right:14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.favorite,color: Colors.red,size: 20,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right:8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "1946",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Text(restaurantName,
          style: TextStyle(
              color: Color(0xff6200ee),
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),

        // Container(
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: <Widget>[
        //         Container(
        //             child: Text(
        //               "4.1",
        //               style: TextStyle(
        //                 color: Colors.black54,
        //                 fontSize: 18.0,
        //               ),
        //             )),
        //         Container(
        //           child: Icon(
        //             FontAwesomeIcons.solidStar,
        //             color: Colors.amber,
        //             size: 15.0,
        //           ),
        //         ),
        //         Container(
        //           child: Icon(
        //             FontAwesomeIcons.solidStar,
        //             color: Colors.amber,
        //             size: 15.0,
        //           ),
        //         ),
        //         Container(
        //           child: Icon(
        //             FontAwesomeIcons.solidStar,
        //             color: Colors.amber,
        //             size: 15.0,
        //           ),
        //         ),
        //         Container(
        //           child: Icon(
        //             FontAwesomeIcons.solidStar,
        //             color: Colors.amber,
        //             size: 15.0,
        //           ),
        //         ),
        //         Container(
        //           child: Icon(
        //             FontAwesomeIcons.solidStarHalf,
        //             color: Colors.amber,
        //             size: 15.0,
        //           ),
        //         ),
        //         Container(
        //             child: Text(
        //               "(946)",
        //               style: TextStyle(
        //                 color: Colors.black54,
        //                 fontSize: 18.0,
        //               ),
        //             )),
        //       ],
        //     )),
        // Container(
        //     child: Text(
        //       "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
        //       style: TextStyle(
        //         color: Colors.black54,
        //         fontSize: 18.0,
        //       ),
        //     )),
        Container(
            child: Text(
              "Lorem ipsum dolor sit consetetur sadipscing elitr, sed more find we",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.712776, -74.005974), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          newyork1Marker,newyork2Marker,newyork3Marker,gramercyMarker,bernardinMarker,blueMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker gramercyMarker = Marker(
  markerId: MarkerId('gramercy'),
  position: LatLng(40.738380, -73.988426),
  infoWindow: InfoWindow(title: 'Gramercy Tavern'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('bernardin'),
  position: LatLng(40.761421, -73.981667),
  infoWindow: InfoWindow(title: 'Le Bernardin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker blueMarker = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(40.732128, -73.999619),
  infoWindow: InfoWindow(title: 'Blue Hill'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker newyork1Marker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(40.742451, -74.005959),
  infoWindow: InfoWindow(title: 'Los Tacos'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker newyork2Marker = Marker(
  markerId: MarkerId('newyork2'),
  position: LatLng(40.729640, -73.983510),
  infoWindow: InfoWindow(title: 'Tree Bistro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker newyork3Marker = Marker(
  markerId: MarkerId('newyork3'),
  position: LatLng(40.719109, -74.000183),
  infoWindow: InfoWindow(title: 'Le Coucou'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);