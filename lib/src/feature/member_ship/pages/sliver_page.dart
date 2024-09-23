import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/circle_create_page.dart';
import 'package:teenage_safety/src/feature/member_ship/provider/member_ship_provider.dart';
import 'package:teenage_safety/src/router/routes.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({super.key});

  @override
  State<SliverPage> createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> with SingleTickerProviderStateMixin {

  PageController controller = PageController();
  TabController? _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController?.addListener((){
      setState(() {
        _currentIndex = _tabController!.index;
      });
    });
  }

  List<String> images = [
    AppImages.sliver,
    AppImages.sliver,
    AppImages.sliver,
    AppImages.sliver,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme(context).outline),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Column(
                    children: [
                      Image.asset(images[index],fit: BoxFit.cover,height: size.height * 0.14,),
                      SizedBox(height: size.height * 0.007,),
                      Text('30 days location history savings',style: textTheme(context).labelLarge!.copyWith(letterSpacing: 0,fontSize: size.height * 0.02),),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16,top: 10),
            child: SmoothPageIndicator(
              controller: controller,  // Your page controller
              count: 4,                // Number of pages
              effect: const ExpandingDotsEffect(
                expansionFactor: 3,
                radius: 16.0,
                spacing: 1.5,
                dotWidth: 15.0,
                dotHeight: 14.0,
                strokeWidth: 0.1,
                dotColor: Colors.grey,
                activeDotColor: Colors.indigo,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),

          Container(
            height: size.height * 0.06,
            width: size.height * 0.33,
            decoration: BoxDecoration(
              color: colorScheme(context).primary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: TabBar(
                dividerColor: colorScheme(context).onPrimary,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.fill,
                // onTap: value.onTabSelectedPriceTabIndex,
                padding: EdgeInsets.zero,
                unselectedLabelColor: colorScheme(context).onSurface,
                labelColor: colorScheme(context).onPrimary,
                controller: _tabController,
                tabs: [
                  Tab(
                    child:  Container(
                      padding: EdgeInsets.zero,
                      width: size.width  * 0.34,
                      decoration: BoxDecoration(
                          color: _currentIndex == 0 ? colorScheme(context).primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Text('Rs 1,550.00/mo',style: textTheme(context).labelSmall!.copyWith(color: _currentIndex == 0 ? colorScheme(context).onPrimary : colorScheme(context).onSurface),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: EdgeInsets.zero,
                      width: size.width  * 0.34,
                      decoration: BoxDecoration(
                          color: _currentIndex == 1 ? colorScheme(context).primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Text('Rs 1,550.00/Yr',style: textTheme(context).labelSmall!.copyWith(color: _currentIndex == 1 ? colorScheme(context).onPrimary : colorScheme(context).onSurface),),
                      ),
                    ),
                  ),
                ]),
          ),
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: [
                   Center(child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",style: textTheme(context).labelMedium!.copyWith(letterSpacing: 0),)),
                    Center(child: Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",style: textTheme(context).labelMedium!.copyWith(letterSpacing: 0),)),
                  ])),
          CustomElevatedButton(
            height: size.height * 0.055,
              width: double.infinity,
              text: 'Subscribe',
              textStyle: textTheme(context).labelLarge!.copyWith(letterSpacing: 0,fontSize: size.height * 0.02,color: colorScheme(context).onPrimary),
              onPressed: (){
              context.pushNamed(AppRoute.paymentPage);
              }),
        ],
      ),

    );
  }
}
