import 'package:ev_app/screens/choose_metric_screen.dart';
import 'package:ev_app/screens/soecs_results_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddKwhChargedScreen extends StatefulWidget {
  const AddKwhChargedScreen({Key? key}) : super(key: key);

  @override
  State<AddKwhChargedScreen> createState() => _AddKwhChargedScreenState();
}

class _AddKwhChargedScreenState extends State<AddKwhChargedScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      title: Text(
        'Add Kwh Charged',
        style: TextStyle(color: Colors.green),
      ),
      iconTheme: IconThemeData(color: Colors.green),
      leading: Builder(
        builder: (BuildContext context) {
          return RotatedBox(
            quarterTurns: 0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseMetricScreen()),
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
          backgroundColor: Colors.green.withOpacity(0.3),
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
          value: 0.5,
        ),
      ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
            children: <Widget>[


      Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Number of kwh charged",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.green),
                ),
                Text(
                  "*",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.red),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(

                  // hintText: 'User Name',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Charging Point",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.green),
                ),
                Text(
                  "*",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: Colors.red),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(

                  // hintText: 'User Name',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
            ),
            SizedBox(height: 20,),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width /0.2,
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: ElevatedButton(
                  child: const Text(
                    'Calculate SOECS   >',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SoecsResultsScreen(),
                        ));
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )),
          ],
        ),
      ),
    ])));
  }
}
