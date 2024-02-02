import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:jum_app/components/snackbars.dart';

import 'package:jum_app/components/text_button.dart';
import 'package:jum_app/controllers/user.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController auth = Get.find();
  UserController user = Get.find();

  MapController map = MapController();

  double? lat;
  double? long;

  bool? isLoading;
  bool? isLoadingMap;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    isLoadingMap = false;
    lat = 51.509364;
    long = -0.128928;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: FlutterMap(
              mapController: map,
              options: MapOptions(
                  center: LatLng(lat!, long!),
                  zoom: 9.0,
                  onLongPress: (tapPos, mapPos) {
                    print('long pressed');
                    print(tapPos.relative);
                    print(mapPos.latitude);
                    print(mapPos.longitude);
                  }),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: Row(
                children: [
                  (isLoadingMap! == false)
                      ? IconButton(
                          icon: const Icon(Icons.location_pin),
                          onPressed: () async {
                            setState(() {
                              isLoadingMap = true;
                            });
                            await _determinePosition().then((value) {
                              setState(() {
                                lat = value.latitude;
                                long = value.longitude;
                                isLoadingMap = false;
                              });
                              map.move(LatLng(lat!, long!), 17.0);
                            });
                          },
                        )
                      : const CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ),
                  const Spacer(),
                  TextStyleButton(
                      text: "Logout",
                      isLoading: isLoading!,
                      function: () async {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          var response = await auth.logout();
                          if (response['success']) {
                            Get.offAllNamed('/login');
                          } else {
                            setState(() {
                              isLoading = false;
                            });

                            AppSnackBar.std('Something Went Wrong',
                                'Please check your connection.');
                          }
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });

                          AppSnackBar.std('Something Went Wrong',
                              'Please check your connection.');
                        }
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
