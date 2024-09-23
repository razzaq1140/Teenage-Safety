import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/back_arrow.dart';
import '../../../common/widgets/custom_appbar.dart';
import '../../../common/widgets/custom_textformfield.dart';
import '../../../router/routes.dart';

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  TextEditingController searchController = TextEditingController();
  List<String> locations = [
    'Home',
    'Office',
    'FarmHouse',
    'Green Town',
    'Gym',
    'School',
    'College'
  ];
  List<String> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all locations
    filteredLocations = locations;
    // Listen to changes in the search field
    searchController.addListener(_filterLocations);
  }

  @override
  void dispose() {
    // Dispose of the controller when not needed
    searchController.dispose();
    super.dispose();
  }

  void _filterLocations() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredLocations = locations
          .where((location) => location.toLowerCase().contains(query))
          .toList();
    });
  }

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
            const SizedBox(height: 10),
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
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check in',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomTextFormField(
                            controller: searchController,
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: AppColors.appGrey,
                            ),
                            hint: 'Search location...',
                          ),
                        ),
                        Divider(
                          color: AppColors.appGrey.withOpacity(0.3),
                        ),
                        // Display filtered results
                        Column(
                          children: filteredLocations.map((location) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('Selected: $location');
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.appGrey
                                                    .withOpacity(0.3),
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
                                          location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: AppColors.appGrey.withOpacity(0.3),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: InkWell(
                            onTap: () {
                              context.pushNamed(AppRoute.addLocationPage);
                            },
                            child: Text(
                              'Add Location',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
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
