import 'package:ev_app/screens/vehicle_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehicleDetailOne extends StatefulWidget {
  final String type;
  final String mileage;
  final String regno;
  const VehicleDetailOne(
      {Key? key,
      required this.type,
      required this.mileage,
      required this.regno})
      : super(key: key);

  @override
  State<VehicleDetailOne> createState() => _VehicleDetailOneState();
}

class _VehicleDetailOneState extends State<VehicleDetailOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    MaterialPageRoute(builder: (context) => VehicleListScreen()),
                  );
                },
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          widget.regno,
          style: TextStyle(color: Color(0xFF75A843), fontWeight: FontWeight.bold,fontSize: 22),
        ),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          side: BorderSide(
            color: Colors.grey,
            width: 0.08, //<-- SEE HERE
          ),
        ),
        elevation: 5,
        margin: EdgeInsets.all(8),
        child: Column(children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Vehicle details', style: TextStyle(color: Color(0xFF75A843), fontWeight: FontWeight.bold,fontSize: 22),), Text('Delete', style: TextStyle(color: Color(0xFF75A843), fontWeight: FontWeight.bold,fontSize: 18),)],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Plate no',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text(widget.regno,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Vehicle Identification number',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                Text('357632KKF',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Country of registration',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('Kenya',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Date of registration',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('22/08/2022',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Vehicle model',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('Toyota Corolla',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('EV Technology',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('PHEV',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Fuel Type ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('Gasoline',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('EV Size',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('Gasoline',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Fuel Type ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('Sedan',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('EV Ownership / Usage ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('Corporate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Carbon reporting programs  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)), Text('N/A',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey))],
            ),
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }
}
