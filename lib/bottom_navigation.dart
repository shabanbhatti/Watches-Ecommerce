import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/Favourite%20Page/favourite.dart';
import 'package:watches_ecommerce_/Home%20Screen/class_watch_detail.dart';
import 'package:watches_ecommerce_/Home%20Screen/home_page_main.dart';
import 'package:watches_ecommerce_/Home%20Screen/watch_container.dart';
import 'package:watches_ecommerce_/Setting%20page/setting_page.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int index = 0;
  List<WatchDetail> watchDetailList = [
    WatchDetail(
      watchName: 'Gold Watch',
      watchPrice: '15k',
      imgName: 'watch2',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black&White Watch',
      watchPrice: '15k',
      imgName: 'watch3',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Silver Watch',
      watchPrice: '15k',
      imgName: 'watch4',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black Watch',
      watchPrice: '15k',
      imgName: 'watch5',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Full Silver Watch',
      watchPrice: '15k',
      imgName: 'watch6',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black&Silver Watch',
      watchPrice: '15k',
      imgName: 'watch7',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Deep Black Watch',
      watchPrice: '15k',
      imgName: 'watch8',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Golden Watch',
      watchPrice: '15k',
      imgName: 'watch2',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black&White Watch',
      watchPrice: '15k',
      imgName: 'watch3',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Silver Watch',
      watchPrice: '15k',
      imgName: 'watch4',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Mat Black Watch',
      watchPrice: '15k',
      imgName: 'watch5',
      isLiked: false,
    ),
  ];

  List<WatchDetail> digitalWatchDetailList = [
    WatchDetail(
      watchName: 'Gold Watch',
      watchPrice: '15k',
      imgName: 'smartwatch2',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black&White Watch',
      watchPrice: '15k',
      imgName: 'smartwatch3',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Silver Watch',
      watchPrice: '15k',
      imgName: 'smartwatch4',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black Watch',
      watchPrice: '15k',
      imgName: 'watch5',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Full Silver Watch',
      watchPrice: '15k',
      imgName: 'smartwatch5',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black&Silver Watch',
      watchPrice: '15k',
      imgName: 'smartwatch6',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Deep Black Watch',
      watchPrice: '15k',
      imgName: 'smartwatch7',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Golden Watch',
      watchPrice: '15k',
      imgName: 'smartwatch2',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black&White Watch',
      watchPrice: '15k',
      imgName: 'smartwatch3',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Silver Watch',
      watchPrice: '15k',
      imgName: 'smartwatch4',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Mat Black Watch',
      watchPrice: '15k',
      imgName: 'smartwatch5',
      isLiked: false,
    ),
  ];

  bool isLiked = false;

  var favouriteList = [];
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: mqSize.height * 0.0001,
        backgroundColor: myColor,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // color: Theme.of(context).colorScheme.onSecondary,
        color: myColor,

        buttonBackgroundColor: myColor,
        items: [
          Icon(
            Icons.home,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 35,
          ),
          Icon(
            Icons.favorite,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 35,
          ),
          Icon(
            Icons.person,
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 35,
          ),
        ],
        animationCurve: Curves.bounceOut,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),

      body: Center(
        child:
            (index == 0)
                ? HomePage(
                  // ---------------Index 1----------------
                  watchDetailList: watchDetailList,
                  itemBuilder: (context, index) {
                    return WatchContainer(
                      watchDetail: watchDetailList[index],
                      onPressedLIKED: () {
                        setState(() {
                          watchDetailList[index].isLiked = true;
                          favouriteList.add(watchDetailList[index]);
                          
                        });
                        print('Liked');
                        print(favouriteList);
                      },
                      onPressedUNLIKED: () {
                        setState(() {
                          watchDetailList[index].isLiked = false;
                          
                           
                              favouriteList.remove(watchDetailList[index]); 
                            
                         
                        });
                        
                        print('UnLiked');
                      },
                    );
                  },

                  // ------------Index 2------------------------
                  digitalWatchDetailList: digitalWatchDetailList,
                  digitalItemBuilder: (context, index) {
                    return WatchContainer(
                      watchDetail: digitalWatchDetailList[index],
                      onPressedLIKED: () {
                        setState(() {
                          digitalWatchDetailList[index].isLiked = true;
                          favouriteList.add(digitalWatchDetailList[index]);
                        });
                      },
                      onPressedUNLIKED: () {
                        setState(() {
                          digitalWatchDetailList[index].isLiked = false;
                          if (favouriteList.length==1) {
                              favouriteList.clear();
                            }else{
                              favouriteList.remove(digitalWatchDetailList[index]); 
                            }
                        });
                      },
                    );
                  },
                )
                : (index == 1)
                ? FavouritePage(favouriteList: favouriteList)
                : (index == 2)
                ? SettingPage()
                : SizedBox(),
      ),
    );
  }
}
