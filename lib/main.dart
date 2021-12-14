import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_mac/get_mac.dart';

/*
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Get Mac ID',
    home: Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Center(child: Text('Get Device MAC ID')),
      ),
    ),
  ));
}
*/
void main(){
runApp(MyDeviceID());
}
class MyDeviceID extends StatefulWidget {

  @override
  _MyDeviceIDState createState() => _MyDeviceIDState();


}

class _MyDeviceIDState extends State<MyDeviceID> {
  String Mac_ID='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();

  }

  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      platformVersion = await GetMac.macAddress;
    } on PlatformException {
      platformVersion = 'Failed to get Device MAC Address.';
    }

    if (!mounted) return;

    setState(() {
      Mac_ID = platformVersion;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get Mac ID'),
        ),
        body: Center(
          child: Text('MAC Address : $Mac_ID\n'),
        ),
      ),
    );
  }
}


