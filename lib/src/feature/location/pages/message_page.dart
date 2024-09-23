import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_colors.dart';
import 'package:teenage_safety/src/router/routes.dart';

import '../../../common/const/app_images.dart';
import '../../../common/const/global_variable.dart';
import '../../../common/widgets/custom_appbar.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

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
                child: CustomRowWidget(
                  onMenuTap: () {
                    // Handle menu tap
                  },
                  onArrowTap: () {
                    // Handle arrow tap
                  },
                  imageUrl:
                      'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
                  text: 'John Family',
                  isOpen: false,
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
                        Row(
                          children: [
                            Text(
                              'Message',
                              style: textTheme(context).bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: colorScheme(context).onSurface),
                            ),
                            Text(' (John Family circle)',
                                style: textTheme(context).bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.appGrey,
                                    )),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: 3,
                            itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
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
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Vicky',
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
                                              'Checked in @home',
                                              style:
                                                  textTheme(context).bodySmall,
                                            ),
                                            Text(
                                              'Since 4:55 am',
                                              style:
                                                  textTheme(context).bodyLarge,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: AppColors.appGrey.withOpacity(0.3),
                                    ),
                                  ],
                                )),
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
