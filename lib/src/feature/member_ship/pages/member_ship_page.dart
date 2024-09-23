import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/feature/member_ship/pages/gold_page.dart';
import 'package:teenage_safety/src/feature/member_ship/pages/platinum_page.dart';
import 'package:teenage_safety/src/feature/member_ship/pages/sliver_page.dart';

class MemberShipPage extends StatefulWidget {
  const MemberShipPage({super.key});

  @override
  State<MemberShipPage> createState() => _MemberShipPageState();
}

class _MemberShipPageState extends State<MemberShipPage> with SingleTickerProviderStateMixin {

  TabController? _tabController;
  int _currentTabIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController!.addListener(() {
      setState(() {
        _currentTabIndex = _tabController!.index;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bdImage,),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * 0.76,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Container(
                        height: size.height * 0.07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: colorScheme(context).primary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TabBar(
                            dividerColor: colorScheme(context).onPrimary,
                            indicatorColor: Colors.transparent,
                            labelPadding: EdgeInsets.zero,
                            tabAlignment: TabAlignment.fill,
                            // onTap: value.selectTabBarIndex,
                            padding: EdgeInsets.zero,
                            unselectedLabelColor: colorScheme(context).onSurface,
                            labelColor: colorScheme(context).onPrimary,
                            controller: _tabController,
            
                            tabs: [
                              Tab(
                                child:  Container(
                                  padding: EdgeInsets.zero,
                                  width: size.width  * 0.3,
                                  decoration: BoxDecoration(
                                      color: _currentTabIndex == 0 ? colorScheme(context).primary : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Center(
                                    child: Text('Sliver'),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  width: size.width  * 0.3,
                                  decoration: BoxDecoration(
                                      color: _currentTabIndex == 1 ? colorScheme(context).primary : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Center(
                                    child: Text('Gold'),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  width: size.width  * 0.3,
                                  decoration: BoxDecoration(
                                      color: _currentTabIndex == 2 ? colorScheme(context).primary : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: const Center(
                                    child: Text('Platinum'),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Expanded(
                          child: TabBarView(
                          controller: _tabController,
                          children: const[
                             SliverPage(),
                             GoldPage(),
                             PlatinumPage()
                      ]))
                    ],
                  ),
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),

      ),
    );
  }
}
