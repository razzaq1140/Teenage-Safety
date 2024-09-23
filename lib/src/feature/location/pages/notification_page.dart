import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_colors.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/drawer.dart';

import '../../../common/const/app_images.dart';
import '../../../common/const/back_arrow.dart';
import '../../../common/const/global_variable.dart';
import '../../../common/widgets/custom_appbar.dart';
import '../../../models/notification_model.dart'; // Import the NotificationModel class

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
      GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    // List of notification data using the model
    final List<NotificationModel> notifications = [
      NotificationModel(
        name: 'Vicky',
        detail: 'Checked in @home',
        time: 'Since 4:55 am',
        imageUrl:
            'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
      ),
      NotificationModel(
        name: 'Vicky',
        detail: 'Over Speeding 95',
        time: 'Since 6:55 am',
        imageUrl:
            'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
      ),
      NotificationModel(
        name: 'John Doe',
        detail: 'Geofence Breach',
        time: 'Since 7:15 am',
        imageUrl:
            'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
      ),
      NotificationModel(
        name: 'Emma',
        detail: 'Harsh Braking Detected',
        time: 'Since 2:30 pm',
        imageUrl:
            'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
      ),
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: AppDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundFive),
            fit: BoxFit.cover,
          ),
        ),
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
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notifications',
                          style: textTheme(context).bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colorScheme(context).onSurface),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: notifications.length,
                            itemBuilder: (context, index) {
                              final notification = notifications[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          child: CachedNetworkImage(
                                            imageUrl: notification.imageUrl,
                                            imageBuilder:
                                                (context, imageProvider) =>
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
                                            errorWidget:
                                                (context, url, error) =>
                                                    CircleAvatar(
                                              radius: 30,
                                              backgroundColor: Colors.grey[200],
                                              child: const Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                notification.name,
                                                style: textTheme(context)
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            colorScheme(context)
                                                                .onSurface),
                                              ),
                                              Text(
                                                notification.detail,
                                                style: textTheme(context)
                                                    .bodySmall
                                                    ?.copyWith(
                                                        color:
                                                            colorScheme(context)
                                                                .error),
                                              ),
                                              Text(
                                                notification.time,
                                                style: textTheme(context)
                                                    .bodyLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (index == notifications.length - 1)
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.appGrey
                                                    .withOpacity(0.3),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Icon(
                                                Icons.location_on_outlined,
                                                color:
                                                    colorScheme(context).error,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Divider(
                                      color: AppColors.appGrey.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              );
                            },
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
