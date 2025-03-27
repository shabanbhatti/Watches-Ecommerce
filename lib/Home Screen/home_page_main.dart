import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/App%20title%20and%20logo/app_title-watchstylo.dart';
import 'package:watches_ecommerce_/Home%20Screen/class_watch_detail.dart';


import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key, required this.watchDetailList, required this.itemBuilder, required this.digitalWatchDetailList, required this.digitalItemBuilder});
List<WatchDetail> watchDetailList;
List<WatchDetail> digitalWatchDetailList;
 Widget? Function(BuildContext, int) itemBuilder;
 Widget? Function(BuildContext, int) digitalItemBuilder;
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: SizedBox(),
              expandedHeight: mqSize.height * 0.3,
              pinned: true,
              backgroundColor: myColor,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: apptitleForHomeScreens(context, fontSize: 20),
                background: Image.asset(
                  'assets/images/watchwallpaper.jpg',
                  height: mqSize.height,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: TabBar(
                labelColor: myColor,
                indicatorWeight: 5,
                indicatorColor: myColor,
                tabs: [
                  Tab(icon: Icon(Icons.watch_later, size: 40), text: 'Analog'),
                  Tab(icon: Icon(Icons.watch, size: 40), text: 'Digital'),
                ],
              ),
            ),
          ];
        },

        body: TabBarView(children: [CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 20),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.7,
            ),
            itemCount: watchDetailList.length,
itemBuilder: itemBuilder,
           
          ),
        ),
      ],
    ), 
    
    // -------------------2nd index------------

    CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 20),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.7,
            ),
            itemCount: digitalWatchDetailList.length,
itemBuilder: digitalItemBuilder,
           
          ),
        ),
      ],
    ),]),
      ),
    );
  }
}
