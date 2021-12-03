import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kobantitar_mobile/screens/home_screen.dart';
import 'package:local_auth/local_auth.dart';

class BioMetricAuth extends StatefulWidget {
  const BioMetricAuth({Key? key}) : super(key: key);

  @override
  _BioMetricAuthState createState() => _BioMetricAuthState();
}

class _BioMetricAuthState extends State<BioMetricAuth> {
  bool? _hasBioSensor;

  LocalAuthentication authentication = LocalAuthentication();

  Future<void> _checkBio() async {
    try {
      _hasBioSensor = await authentication.canCheckBiometrics;

      print(_hasBioSensor);

      if (_hasBioSensor!) {
        _getAuth();
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _getAuth() async {
    bool isAuth = false;

    //loaded a dialog to scan fingerprint
    try {
      isAuth = await authentication.authenticate(
          localizedReason: 'Scan your finger print to access the app',
          biometricOnly: true,
          useErrorDialogs: true,
          stickyAuth: true);

      //if fingerprint scan match then
      //isAuth = true
      // therefore will navigate user to WelcomePage/HomePage of the App
      if (isAuth) {
        Get.to(() => HomeScreen());
      }

      print(isAuth);
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // call method immediately when app launch
    _checkBio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Flutter Local Fingerprint Auth',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  child: const Text('Check Auth'),
                  onPressed: () {
                    _checkBio();
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(), primary: Colors.green))),
        ],
      ),
    );
  }
}
