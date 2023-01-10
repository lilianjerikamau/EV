import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:getwidget/getwidget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng initialLocation = const LatLng(37.422131, -122.084801);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    // addCustomIcon();
    super.initState();
  }

  // void addCustomIcon() {
  //   BitmapDescriptor.fromAssetImage(
  //           const ImageConfiguration(), "assets/images/Location_marker.png")
  //       .then(
  //     (icon) {
  //       setState(() {
  //         markerIcon = icon;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Hello Muhu',
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          Text('Great to see you back!', style: TextStyle(color: Colors.green))
        ]),
        backgroundColor: Colors.white,
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: initialLocation,
                  zoom: 14,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("marker1"),
                    position: const LatLng(37.422131, -122.084801),
                    draggable: true,
                    onDragEnd: (value) {
                      // value is the new position
                    },
                    icon: markerIcon,
                  ),
                  Marker(
                    markerId: const MarkerId("marker2"),
                    position:
                        const LatLng(37.415768808487435, -122.08440050482749),
                  ),
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Stations near you ',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.settings_suggest_sharp,
                    color: Colors.green,
                  )
                ]),
          ),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Expanded(
                  child: SizedBox(
                    child: GFCard(
                      boxFit: BoxFit.cover,
                      titlePosition: GFPosition.start,
                      image: Image.asset(
                        'assets/images/img.png',
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      showImage: true,
                      content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Nifas Station",
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "2.5 KM",
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.start,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Debra Zeit road,Addis Ababa",
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "Electric Station",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            )
                          ]),
                    ),
                  ),
                ),
                    Expanded(
                      child: SizedBox(
                        child: GFCard(
                          boxFit: BoxFit.cover,
                          titlePosition: GFPosition.start,
                          image: Image.asset(
                            'assets/images/img.png',
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          showImage: true,
                          content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Kulwe Station",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      "2.5 KM",
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.start,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Debra Zeit road,Addis Ababa",
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "Hydrogen filling Station",
                                  style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                                )
                              ]),
                        ),
                      ),
                    ),
              ])),
        ],
      ),
    );
  }
}
