import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:teenage_safety/src/common/const/app_colors.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';

import '../../../common/const/back_arrow.dart';
import '../../../common/widgets/custom_appbar.dart';

class AddGeofencePage extends StatefulWidget {
  const AddGeofencePage({super.key});

  @override
  State<AddGeofencePage> createState() => _AddGeofencePageState();
}

class _AddGeofencePageState extends State<AddGeofencePage> {
  TextEditingController searchController = TextEditingController();
  GoogleMapController? _mapController;
  final Location _location = Location();
  LatLng _currentLocation = const LatLng(0, 0);
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
      if (mounted) {
        setState(() {
          _currentLocation =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
        _mapController?.animateCamera(CameraUpdate.newLatLng(_currentLocation));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.backgroundFive,
                  ),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      CustomBackButton(onTap: (){
                                      context.pop();
                                    }),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Add Geofence',
                            style: textTheme(context).bodyLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: colorScheme(context).onSurface),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: colorScheme(context)
                                    .outline
                                    .withOpacity(0.4),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    'Circle',
                                    style: textTheme(context)
                                        .bodyLarge
                                        ?.copyWith(
                                            color:
                                                colorScheme(context).onSurface),
                                  ),
                                  const Spacer(),
                                  PopupMenuButton<String>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.appGrey,
                                    ),
                                    onSelected: (value) {
                                      // Handle the selection here
                                      print('Selected: $value');
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        const PopupMenuItem<String>(
                                          value: 'Circle',
                                          child: Text('Circle'),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'Rectangle',
                                          child: Text('Rectangle'),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'Square',
                                          child: Text('Square'),
                                        ),
                                      ];
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: CustomTextFormField(
                              hint: 'Home',
                            ),
                          ),
                          CustomTextFormField(
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: AppColors.appGrey,
                            ),
                            hint: '5g+39M, Houston Park House #3',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SizedBox(
                                height: height * 0.4,
                                child: GoogleMap(
                                  onMapCreated:
                                      (GoogleMapController controller) {
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
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButton(
                            width: double.infinity,
                            text: 'Save',
                            onPressed: () {
                              context.pop();
                            },
                          )
                        ],
                      ),
                    ),
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
