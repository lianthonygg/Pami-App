import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> hasInternet() async{
  final conectivityResult = await Connectivity().checkConnectivity();

  return conectivityResult == ConnectivityResult.mobile || conectivityResult == ConnectivityResult.wifi;
}