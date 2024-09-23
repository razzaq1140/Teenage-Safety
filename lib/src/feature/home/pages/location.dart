import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/drawer.dart';
import 'package:teenage_safety/src/router/routes.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variable.dart';
import '../../../common/widgets/custom_elevated_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool isPeople = true;
  bool isOpen = false;
  final double _value = 0.0;

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
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 130,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(11)),
                          color: colorScheme(context).onPrimary,
                        ),
                        child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Column(children: <Widget>[
                                                                          Text(_value.toString(),
                                      style:
                                          textTheme(context).headlineSmall),
                                                                          const SizedBox(height: 30),
                                                                          const Text('mph',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold))
                                                                        ]),
                                    angle: 90,
                                    positionFactor: 0.75)
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(
                                    value: _value,
                                    needleLength: 0.85,
                                    enableAnimation: true,
                                    animationType: AnimationType.ease,
                                    needleStartWidth: 1.5,
                                    needleEndWidth: 6,
                                    needleColor: Colors.red,
                                    knobStyle: KnobStyle(knobRadius: 0.09))
                              ],
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 200,
                                    sizeUnit: GaugeSizeUnit.factor,
                                    startWidth: 0.03,
                                    endWidth: 0.04,
                                    gradient: const SweepGradient(
                                        colors: <Color>[
                                          Colors.green,
                                          Colors.yellow,
                                          Colors.orange,
                                          Colors.red
                                        ],
                                        stops: <double>[
                                          0.0,
                                          0.4,
                                          0.6,
                                          1
                                        ]))
                              ],
                              minimum: 0,
                              maximum: 200,
                              labelOffset: 15,
                              axisLineStyle: const AxisLineStyle(
                                  thicknessUnit: GaugeSizeUnit.factor,
                                  thickness: 0.03),
                              majorTickStyle: const MajorTickStyle(
                                  length: 6, thickness: 4, color: Colors.black),
                              minorTickStyle: const MinorTickStyle(
                                  length: 3, thickness: 3, color: Colors.black),
                              axisLabelStyle: const GaugeTextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10))
                        ]),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoute.messagePage);
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: colorScheme(context).onPrimary,
                              child: SvgPicture.asset(
                                AppIcons.chatIcon,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushNamed(AppRoute.geofencePage);
                            },
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: colorScheme(context).onPrimary,
                              child: SvgPicture.asset(
                                AppIcons.locationIcon,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.pushNamed(AppRoute.checkInPage);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                          child: Row(
                            children: [
                              Image.asset(AppIcons.checkInIcon),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Check in",
                                  style: textTheme(context)
                                      .titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: colorScheme(context).onPrimary,
                        child: SvgPicture.asset(
                          height: 30,
                          color: colorScheme(context).primary,
                          AppIcons.myPositionIcon,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme(context).onPrimary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                text: "People",
                                onPressed: () {
                                  setState(() {
                                    isPeople = true;
                                  });
                                },
                                icon: Icons.group_outlined,
                                iconColor: isPeople
                                    ? colorScheme(context).onPrimary
                                    : colorScheme(context).onSurface,
                                textStyle:
                                    textTheme(context).bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: isPeople
                                              ? colorScheme(context).onPrimary
                                              : colorScheme(context).onSurface,
                                        ),
                                buttonColor: isPeople
                                    ? colorScheme(context).primary
                                    : colorScheme(context).secondary,
                                height: 40,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomElevatedButton(
                                text: "Places",
                                onPressed: () {
                                  setState(() {
                                    isPeople = false;
                                  });
                                },
                                icon: Icons.apartment_outlined,
                                iconColor: isPeople
                                    ? colorScheme(context).onSurface
                                    : colorScheme(context).onPrimary,
                                textStyle:
                                    textTheme(context).bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: isPeople
                                              ? colorScheme(context).onSurface
                                              : colorScheme(context).onPrimary,
                                        ),
                                buttonColor: isPeople
                                    ? colorScheme(context).secondary
                                    : colorScheme(context).primary,
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                        isPeople
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Circle People",
                                  style: textTheme(context)
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Places",
                                  style: textTheme(context)
                                      .titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                        isPeople
                            ? Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740",
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        radius: 30,
                                        backgroundImage: imageProvider,
                                      ),
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.grey[200],
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.grey[200],
                                        child: const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Vicky",
                                            style: textTheme(context)
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Logged out of Teenage Safety",
                                            style: textTheme(context).bodyMedium,
                                          ),
                                          Text(
                                            "Since 4:55 am",
                                            style: textTheme(context).bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color:
                                                colorScheme(context).outline)),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 30,
                                      child: Icon(
                                        Icons.apartment_outlined,
                                        color: colorScheme(context).primary,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Home Location",
                                            style: textTheme(context)
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "5g+39M, Houston Park House #3",
                                            style: textTheme(context).bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                        Divider(
                          color: colorScheme(context).surface,
                          thickness: 2,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: isPeople
                              ? Text(
                                  "Add a person",
                                  style:
                                      textTheme(context).titleSmall?.copyWith(
                                            color: colorScheme(context).primary,
                                          ),
                                )
                              : Text(
                                  "Add More Location",
                                  style:
                                      textTheme(context).titleSmall?.copyWith(
                                            color: colorScheme(context).primary,
                                          ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          ),
          // SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: CustomRowWidget(
          //       onMenuTap: () {
          //         scaffoldKey.currentState!.openDrawer();
          //       },
          //       onArrowTap: () {
          //         setState(() {
          //           isOpen = !isOpen;
          //         });
          //       },
          //       imageUrl:
          //           'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
          //       text: 'John Family',
          //       isOpen: isOpen,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
