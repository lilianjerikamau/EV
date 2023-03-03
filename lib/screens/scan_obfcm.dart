import 'dart:async';

import 'package:ev_app/Services/sodo_service.dart';
import 'package:ev_app/screens/choose_vehicle_screen.dart';
import 'package:ev_app/screens/odometer_picture.dart';
import 'package:ev_app/screens/scan_obcem.dart';
import 'package:ev_app/screens/set_new_password_screen.dart';
import 'package:ev_app/screens/sodo_results.dart';
import 'package:ev_app/screens/vehicle_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import '../Services/auth_service.dart';
import '../widget/detail_screen.dart';
import 'package:ev_app/main.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OBFCM extends StatefulWidget {
  final imagePath;
  final vehicleId;
  final issoda;
  final ev_technology;
  final obecm;
  final mileage;
  const OBFCM(
      {super.key,
      this.imagePath,
      required this.vehicleId,
      required this.issoda,
      required this.ev_technology,
      required this.obecm,
      required this.mileage});

  @override
  State<OBFCM> createState() => _OBFCMState();
}

class _OBFCMState extends State<OBFCM> {
  int id = 0;
  String token = '',
      fuel_units = '',
      distance_units = '',
      notification_period = '',
      percentage = '',
      pttwe = '',
      odo_reading = '',
      pusfse = '',
      embp = '',
      bttwe = '',
      busfse = '',
      btpei = '',
      ltee = '',
      pusese = '',
      ptpei = '',
      lte = '',
      lter = '',
      vwwei = '',
      tdp_percentage = '',
      sodo_percentage = '',
      mileage = '',
      gps_location = '';
  String notification = '', regno = '', date = '';
  late final String _imagePath;
  late final TextRecognizer _textDetector;
  Size? _imageSize;
  List<TextElement> _elements = [];

  List<String> _listEmailStrings = [];
  final _formKey1 = GlobalKey<FormState>();
  var form;
  // Fetching the image size from the image file
  Future<void> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    final Image image = Image.file(imageFile);
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );

    final Size imageSize = await completer.future;
    setState(() {
      _imageSize = imageSize;
    });
  }

  addObfcm(String mileage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      prefs.setString('obcem', mileage);
      print('addObfcm');
      print(mileage);
    });
  }

  // To detect the email addresses present in an image
  void _recognizeEmails() async {
    _getImageSize(File(_imagePath));

    // Creating an InputImage object using the image path
    final inputImage = InputImage.fromFilePath(_imagePath);
    // Retrieving the RecognisedText from the InputImage
    final text = await _textDetector.processImage(inputImage);

    // Pattern of RegExp for matching a general email address
    String pattern = r'\d+$';
    RegExp regEx = RegExp(pattern);

    List<String> emailStrings = [];

    // Finding and storing the text String(s) and the TextElement(s)
    for (TextBlock block in text.blocks) {
      for (TextLine line in block.lines) {
        print('text: ${line.text}');
        if (regEx.hasMatch(line.text)) {
          emailStrings.add(line.text);
          for (TextElement element in line.elements) {
            _elements.add(element);
          }
        }
      }
    }

    setState(() {
      _listEmailStrings = emailStrings;
    });
  }

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  TextEditingController third = TextEditingController();
  late bool hidden;
  late bool hidden2;
  late bool hidden3;

  @override
  void initState() {
    hidden = false;
    hidden2 = false;
    hidden3 = false;
    setState(() {
      _imagePath = widget.imagePath;
      print(_imagePath);
      _textDetector = TextRecognizer();
      _recognizeEmails();
      getUserDetails();
      // print(widget.imagePath);
    });
    print("OBFCM SCREEN");
    print('evtech');
    print(widget.ev_technology);
    print(widget.ev_technology.compareTo('FECV') != true);
    super.initState();
  }

  bool isFirstChecked = false;
  bool isSecondChecked = false;
  bool isThirdChecked = false;

  @override
  void dispose() {
    // Disposing the text detector when not used anymore
    _textDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Process Image',
            style: TextStyle(color: Color(0xFF75A843)),
          ),
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
        body: _listEmailStrings.length != null &&
                _listEmailStrings.isNotEmpty &&
                _listEmailStrings.length >= 3
            ? SingleChildScrollView(
                child: Form(
                  key: _formKey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Align(
                        // alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            _imageSize != null
                                ? Stack(children: [
                                    Container(
                                      width: double.maxFinite,
                                      color: Colors.black,
                                      child: CustomPaint(
                                        foregroundPainter: TextDetectorPainter(
                                          _imageSize!,
                                          _elements,
                                        ),
                                        child: AspectRatio(
                                          aspectRatio: _imageSize!.aspectRatio,
                                          child: Image.file(
                                            File(_imagePath),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])
                                : Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            side: BorderSide(
                              color: Color(0xFF75A843),
                              width: 1, //<-- SEE HERE
                            ),
                          ),
                          elevation: 2,
                          margin: EdgeInsets.all(12.0),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: (widget.ev_technology
                                                            .contains("PHEV") ==
                                                        true) ||
                                                    (widget.ev_technology
                                                            .contains("FCEV") ==
                                                        true)
                                                ? Text(
                                                    'Select OBFCM',
                                                    style: TextStyle(
                                                        color: Color(0xFF75A843)),
                                                  )
                                                : Text('Select OBECM ',
                                                    style: TextStyle(
                                                        color: Color(0xFF75A843))),
                                          ),
                                        ]),
                                  ),
                                  CheckboxListTile(
                                    checkboxShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    title:
                                        Text(_listEmailStrings[2].toString()),
                                    value: isFirstChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isFirstChecked = value!;
                                        if (isFirstChecked = true) {
                                          setState(() {
                                            mileage =
                                                _listEmailStrings[2].toString();
                                            addObfcm(mileage);
                                            isSecondChecked = false;
                                            isThirdChecked = false;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                  Divider(),
                                  CheckboxListTile(
                                    checkboxShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    title:
                                        Text(_listEmailStrings[1].toString()),
                                    value: isSecondChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isSecondChecked = value!;
                                        if (isSecondChecked = true) {
                                          setState(() {
                                            mileage =
                                                _listEmailStrings[1].toString();
                                            addObfcm(mileage);
                                            isFirstChecked = false;
                                            isThirdChecked = false;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                  Divider(),
                                  CheckboxListTile(
                                    checkboxShape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    title:
                                        Text(_listEmailStrings[3].toString()),
                                    value: isThirdChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isThirdChecked = value!;
                                        if (isThirdChecked = true) {
                                          setState(() {
                                            mileage =
                                                _listEmailStrings[3].toString();
                                            addObfcm(mileage);
                                            isSecondChecked = false;
                                            isFirstChecked = false;
                                          });
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: ElevatedButton(
                            child: const Text(
                              'Proceed',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              // getUserDetails();
                              addObfcm(mileage);
                              print(widget.ev_technology);
                              print("Submitting FCEV");
                              String first = firstController.text.trim();
                              String second = secondController.text.trim();
                              String thirdc = third.text.trim();
                              form = _formKey1.currentState;
                              ProgressDialog dial = new ProgressDialog(context,
                                  type: ProgressDialogType.Normal);
                              dial.style(
                                progressWidget: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircularProgressIndicator()),
                                backgroundColor: Colors.white,
                                messageTextStyle: TextStyle(
                                    color: Color(0xFF75A843),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold),
                                message: 'Please wait',
                              );
                              if (mileage != null && mileage != "") {
                                print('mileage');
                                print(mileage);
                                if (widget.ev_technology.contains("FCEV") ==
                                    true) {
                                  if (form.validate()) {
                                    dial.show();
                                    SodoService sodoservice =
                                        SodoService(context);
                                    sodoservice
                                        .createSoda(
                                            double.parse(
                                                widget.obecm.toString()),
                                            double.parse(mileage),
                                            widget.vehicleId,
                                            double.parse(widget.mileage),
                                            location,
                                            state,
                                            country,
                                            fuel_units,
                                            distance_units)
                                        .then((val) => {
                                              form = _formKey1.currentState,
                                              print('regno'),


                                              // String date = val.creation_time,
                                              if (val != null)
                                                {
                                                  if (val.status != "failed")
                                                    {
                                                      setState(() {
                                                        // percentage = val.soda_percent;
                                                        odo_reading = val.odo_reading;
                                                        regno = val.reg_no;
                                                        date = val.creation_time;
                                                        percentage = val.soda_percent;
                                                        regno = val.reg_no;
                                                        date = val.creation_time;
                                                        pttwe = val.pttwe;
                                                        pusfse = val.pusfse;
                                                        embp = val.embp;
                                                        bttwe = val.bttwe;
                                                        busfse = val.busfse;
                                                        btpei = val.btpei;
                                                        ltee = val.ltee;
                                                        pusese = val.pusese;
                                                        ptpei = val.ptpei;
                                                        lte = val.lte;
                                                        lter = val.lter;
                                                        vwwei = val.vwwei;
                                                        tdp_percentage =
                                                            val.tdp_percentage;
                                                        sodo_percentage =
                                                            val.sodo_percentage;
                                                        gps_location = val.gps_location;
                                                        print(widget.issoda);
                                                      }),
                                                      dial.hide(),
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              const SnackBar(
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        content:
                                                            Text("Success!"),
                                                        duration: Duration(
                                                            seconds: 3),
                                                      )),
                                                      Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SodoResultsScreen(
                                                                  issoda: true,
                                                                  val:
                                                                      percentage,
                                                                  regno: regno,
                                                                  odo_reading:
                                                                      odo_reading,
                                                                  date: date,
                                                                  pttwe: pttwe,
                                                                  pusfse:
                                                                      pusfse,
                                                                  embp: embp,
                                                                  bttwe: bttwe,
                                                                  busfse:
                                                                      busfse,
                                                                  btpei: btpei,
                                                                  ltee: ltee,
                                                                  pusese:
                                                                      pusese,
                                                                  ptpei: ptpei,
                                                                  lte: lte,
                                                                  lter: lter,
                                                                  vwwei: vwwei,
                                                                  tdp_percentage:
                                                                      tdp_percentage,
                                                                  sodo_percentage:
                                                                      sodo_percentage,
                                                                  gps_location:
                                                                      gps_location,
                                                                )),
                                                      )
                                                    }
                                                  else
                                                    {
                                                      dial.hide(),
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              SnackBar(
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        content: Text(val
                                                            .message
                                                            .toString()
                                                            .toString()),
                                                        duration: Duration(
                                                            seconds: 3),
                                                      ))
                                                    }
                                                }
                                              else
                                                {
                                                  dial.hide(),
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    content: Text(
                                                        'Null response'),
                                                    duration:
                                                        Duration(seconds: 3),
                                                  ))
                                                }
                                            });
                                  } else {
                                    dial.hide();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                          'Please enter the required fields'),
                                      duration: Duration(seconds: 3),
                                    ));
                                  }
                                } else if (widget.ev_technology
                                    .contains("PHEV")) {
                                  print(
                                      'You are moving to ODOMETER FROM OBFCM USING PHEV');
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return OdometerPicture(
                                        vehicleId: widget.vehicleId,
                                        issoda: true,
                                        ev_technology: widget.ev_technology,
                                        checkMileage: false,
                                        isphev: "null",
                                        mileage: widget.mileage,
                                        obcem: mileage);
                                  }));
                                }
                              } else {
                                dial.hide();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('Please select obfcm'),
                                  duration: Duration(seconds: 3),
                                ));
                              }
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                child: Text('Invalid Photo,Try Again'),
              ));
  }

  Future<void> getUserDetails() async {
    await AuthenticationServices(context)
        .getUserDetails()
        .then((value) async => {
              setState(() {
                id = value.id;
                fuel_units = value.user_settings['fuelUnits'];
                distance_units = value.user_settings['distanceUnits'];
                notification = value.user_settings['notificationPeriod'];
                print('user details');
                print(id);
                print(notification);
                print(distance_units);
                print(value.user_settings['fuelUnits']);
              }),
            });

    await AuthenticationServices(context).getUser().then((value) async => {
          setState(() {
            token = value.access_token;
          }),
        });
  }
}
