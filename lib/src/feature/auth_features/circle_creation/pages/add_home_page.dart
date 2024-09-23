import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/router/routes.dart';

class AddHomePage extends StatefulWidget {
  const AddHomePage({super.key});

  @override
  State<AddHomePage> createState() => _AddHomePageState();
}

class _AddHomePageState extends State<AddHomePage> {
  TextEditingController searchController = TextEditingController();
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng _currentLocation = LatLng(0, 0);
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    _initLocation();
  }

  Future<void> _initLocation() async {
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentLocation =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
      });
      _mapController?.animateCamera(CameraUpdate.newLatLng(_currentLocation));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundOne),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              SizedBox(
                height: 120,
                width: 250,
                child: SvgPicture.asset(
                  AppIcons.logo,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.center,
                  "Permissions required",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                hint: "Enter Loction",
              ),
              const SizedBox(height: 15),
              Container(
                alignment: Alignment.center,
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: colorScheme(context).surface),
                child: GoogleMap(
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _currentLocation,
                    zoom: 14.0,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: "Save",
                  onPressed: () {
                    MyAppRouter.clearAndNavigate(
                        context, AppRoute.bottomNavBar);
                  },
                ),
              ),
              SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  MyAppRouter.clearAndNavigate(context, AppRoute.bottomNavBar);
                },
                child: Text(
                  "Skip",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
