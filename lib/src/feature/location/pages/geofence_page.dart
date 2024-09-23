import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_colors.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/router/routes.dart';

import '../../../common/const/back_arrow.dart';
import '../../../common/widgets/custom_appbar.dart';

class GeofencePage extends StatelessWidget {
  const GeofencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
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
                          'Geofencing Locations',
                          style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colorScheme(context).onSurface),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.appGrey.withOpacity(
                                        0.3,
                                      ),
                                    ),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.appGrey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Home',
                                style: textTheme(context).bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme(context).onSurface),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.appGrey.withOpacity(0.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.appGrey.withOpacity(
                                        0.3,
                                      ),
                                    ),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.appGrey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Office',
                                style: textTheme(context).bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme(context).onSurface),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.appGrey.withOpacity(0.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.appGrey.withOpacity(
                                        0.3,
                                      ),
                                    ),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.appGrey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'FarmHouse',
                                style: textTheme(context).bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme(context).onSurface),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.appGrey.withOpacity(0.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.appGrey.withOpacity(
                                        0.3,
                                      ),
                                    ),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.appGrey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Green Town',
                                style: textTheme(context).bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme(context).onSurface),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.appGrey.withOpacity(0.3),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.appGrey.withOpacity(
                                        0.3,
                                      ),
                                    ),
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: AppColors.appGrey,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Jym',
                                style: textTheme(context).bodyLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colorScheme(context).onSurface),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColors.appGrey.withOpacity(0.3),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              context.pushNamed(AppRoute.addGeofencePage);
                            },
                            child: Text(
                              'Add Geofence',
                              style: textTheme(context).bodyLarge?.copyWith(
                                  color: colorScheme(context).primary),
                            ),
                          ),
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
    );
  }
}
