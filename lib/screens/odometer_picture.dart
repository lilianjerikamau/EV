import 'package:ev_app/screens/choose_vehicle_screen.dart';
import 'package:ev_app/screens/process_image.dart';
import 'package:ev_app/screens/scan_obcem.dart';
import 'package:ev_app/screens/scan_obfcm.dart';
import 'package:ev_app/screens/set_new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:camera/camera.dart';
import 'package:ev_app/screens/process_image.dart';
import 'package:flutter/material.dart';
import 'package:ev_app/main.dart';

class OdometerPicture extends StatefulWidget {
  final vehicleId;
  final issoda;
  final ev_technology;
  final checkMileage;
  final mileage;
  final isphev;
  final obcem;
  final obfcm;
  OdometerPicture(
      {super.key,
      this.vehicleId,
      this.issoda,
      required this.ev_technology,
      required this.checkMileage,
      required this.mileage,
      this.isphev,
      this.obcem,
      this.obfcm});

  @override
  State<OdometerPicture> createState() => _OdometerPictureState();
}

class _OdometerPictureState extends State<OdometerPicture> {
  late final CameraController _controller;

  // Initializes camera controller to preview on screen
  void _initializeCamera() async {
    final CameraController cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );
    _controller = cameraController;

    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  // Takes picture with the selected device camera, and
  // returns the image path
  Future<String?> _takePicture() async {
    if (!_controller.value.isInitialized) {
      print("Controller is not initialized");
      return null;
    }

    String? imagePath;

    if (_controller.value.isTakingPicture) {
      print("Processing is progress ...");
      return null;
    }

    try {
      // Turning off the camera flash
      _controller.setFlashMode(FlashMode.off);
      // Returns the image in cross-platform file abstraction
      final XFile file = await _controller.takePicture();
      // Retrieving the path
      imagePath = file.path;
    } on CameraException catch (e) {
      print("Camera Exception: $e");
      return null;
    }

    return imagePath;
  }

  @override
  void initState() {
    _initializeCamera();
    super.initState();
  }

  @override
  void dispose() {
    // dispose the camera controller when navigated
    // to a different page
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.checkMileage == true
            ? Text(
                'Odometer Picture',
                style: TextStyle(color: Color(0xFF75A843)),
              )
            : widget.ev_technology.contains("FCEV")
                ? Text(
                    'OBFCM',
                    style: TextStyle(color: Color(0xFF75A843)),
                  )
                : widget.ev_technology.contains("BEV")
                    ? Text('OBECM ', style: TextStyle(color: Color(0xFF75A843)))
                    : widget.ev_technology.contains("PHEV") &&
                            widget.isphev == false
                        ? Text('OBFCM ', style: TextStyle(color: Color(0xFF75A843)))
                        : widget.ev_technology.contains("PHEV") &&
                                widget.isphev == true
                            ? Text('OBECM cf',
                                style: TextStyle(color: Color(0xFF75A843)))
                            : widget.ev_technology.contains("PHEV") &&
                                    widget.isphev == "null"
                                ? Text('OBECM ',
                                    style: TextStyle(color: Color(0xFF75A843)))
                                : Text('UNDEFINED ',
                                    style: TextStyle(color: Color(0xFF75A843))),
        iconTheme: IconThemeData(color: Color(0xFF75A843)),
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF75A843),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChooseVehicleScreen()),
                  );
                },
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: LinearProgressIndicator(
            backgroundColor: Color(0xFF75A843).withOpacity(0.3),
            valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF75A843)),
            value: 0.5,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              // alignment: Alignment.center,
              child: Column(
                children: [
                  widget.checkMileage == true
                      ? Text(
                          'Take a picture of the odometer capturing the current milage',
                          style: TextStyle(color: Color(0xFF75A843)),
                        )
                      : widget.ev_technology.contains("FCEV")
                          ? Text(
                              'Take a picture of the odometer capturing the current OBFCM',
                              style: TextStyle(color: Color(0xFF75A843)),
                            )
                          : widget.ev_technology.contains("BEV")
                              ? Text(
                                  'Take a picture of the odometer capturing the current OBFCM ',
                                  style: TextStyle(color: Color(0xFF75A843)))
                              : widget.ev_technology.contains("PHEV") &&
                                      widget.isphev == false
                                  ? Text(
                                      'Take a picture of the odometer capturing the current OBFCM ',
                                      style: TextStyle(color: Color(0xFF75A843)))
                                  : Text(
                                      'Take a picture of the odometer capturing the current OBECM ',
                                      style: TextStyle(color: Color(0xFF75A843))),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () async {
                      await _takePicture().then((String? path) {
                        if (path != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProcessImage(
                                issoda: widget.issoda,
                                imagePath: path,
                                vehicleId: widget.vehicleId,
                                ev_technology: widget.ev_technology,
                                checkMileage: widget.checkMileage,
                                mileage: widget.mileage,
                                obfcm: widget.obfcm,
                                obcem: widget.obcem,
                                isphev: widget.isphev,
                              ),
                            ),
                          );
                        } else {
                          print('Image path not found!');
                        }
                      });
                    },
                    child: _controller.value.isInitialized
                        ? Stack(children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 1.3,
                              // width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: CameraPreview(_controller)),
                            ),
                            Positioned(
                              bottom: -18,
                              right: 170,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color(0xFF75A843),
                                    Color(0xFF75A843),
                                    Color(0xFF75A843),
                                    Color(0xFF75A843)
                                  ]),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      color: Color(0xFF75A843),
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ])
                        : Container(
                            color: Colors.black,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
