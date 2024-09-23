import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      'title': 'Share your location with your family in real-time',
      'backgroundImage': AppImages.onBoardingOne
    },
    {
      'title': 'Coordinate easily with smart notification',
      'backgroundImage': AppImages.onBoardingTwo
    },
    {
      'title':
          'Encourage safer driving with reports on speed, texting, and more',
      'backgroundImage': AppImages.onBoardingThree
    },
    {
      'title': 'Rest easy with Crash Detection and emergency dispatch',
      'backgroundImage': AppImages.onBoardingFour
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final page = pages[index];
              return Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(page['backgroundImage']),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                    const Spacer(),
                    Text(
                      textAlign: TextAlign.center,
                      page['title'],
                      style: textTheme(context).headlineSmall?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: colorScheme(context).onPrimary),
                    ),
                    const SizedBox(height: 140),
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 80,
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 4,
                      effect: ExpandingDotsEffect(
                        dotHeight: 12,
                        activeDotColor: colorScheme(context).primary,
                        dotWidth: 12,
                        dotColor: colorScheme(context).surface,
                      ),
                      onDotClicked: (index) {},
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: "Skip",
                        onPressed: () {
                          if (currentPage < pages.length - 1) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          } else {
                            context.pushNamed(AppRoute.loginPage);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
