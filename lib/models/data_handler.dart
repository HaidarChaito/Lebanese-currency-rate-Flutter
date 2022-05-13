import 'package:flutter/material.dart';
import 'package:lirarate/controllers/fuel_grabber.dart';
import 'package:lirarate/controllers/rate_grabber.dart';

class DataHandler extends ChangeNotifier {
  FuelGrabber fuelGrabber = FuelGrabber();
  RateGrabber rateGrabber = RateGrabber();

  void initRateGrabber() async {
    await rateGrabber.fetchData();
    notifyListeners();
  }

  void initFuelGrabber() async {
    await fuelGrabber.fetchData();
    notifyListeners();
  }
}
