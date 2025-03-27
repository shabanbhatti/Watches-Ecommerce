import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/Favourite%20Page/favourite.dart';
import 'package:watches_ecommerce_/Home%20Screen/class_watch_detail.dart';
import 'package:watches_ecommerce_/Home%20Screen/class_watch_paragraph.dart';
import 'package:watches_ecommerce_/Home%20Screen/home_page_main.dart';
import 'package:watches_ecommerce_/Home%20Screen/watch_container.dart';
import 'package:watches_ecommerce_/Model%20Bottom%20Sheet/model_bottom_sheet.dart';
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
      watchPrice: 260,
      imgName: 'watch2',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Black&White Watch',
      watchPrice: 110,
      imgName: 'watch3',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Silver Watch',
      watchPrice: 20,
      imgName: 'watch4',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Black Watch',
      watchPrice: 30,
      imgName: 'watch5',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Full Silver Watch',
      watchPrice: 85,
      imgName: 'watch6',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Black&Silver Watch',
      watchPrice: 90,
      imgName: 'watch7',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Deep Black Watch',
      watchPrice: 20,
      imgName: 'watch8',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Golden Watch',
      watchPrice: 330,
      imgName: 'watch2',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Black&White Watch',
      watchPrice: 230,
      imgName: 'watch3',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Silver Watch',
      watchPrice: 100,
      imgName: 'watch4',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
    WatchDetail(
      watchName: 'Mat Black Watch',
      watchPrice: 10,
      imgName: 'watch5',
      isLiked: false,
      isSmartOrAnalog: 'Analog Watch'
    ),
  ];

  List<WatchDetail> digitalWatchDetailList = [
    WatchDetail(
      watchName: 'Silver SmartWatch',
      watchPrice: 70,
      imgName: 'smartwatch2',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'White SmartWatch',
      watchPrice: 320,
      imgName: 'smartwatch3',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'Green SmartWatch',
      watchPrice: 55,
      imgName: 'smartwatch4',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'MatBlack SmartWatch',
      watchPrice: 230,
      imgName: 'smartwatch5',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'MatBlack SmartWatch',
      isSmartOrAnalog: 'Smart Watch',
      watchPrice: 230,
      imgName: 'smartwatch5',
      isLiked: false,
    ),
    WatchDetail(
      watchName: 'Black&White SmartWatch',
      watchPrice: 40,
      imgName: 'smartwatch6',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'Golden Steel SmartWatch',
      watchPrice: 30,
      imgName: 'smartwatch7',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'Silver Steel SmartWatch',
      watchPrice: 55,
      imgName: 'smartwatch2',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'Silver SmartWatch',
      watchPrice: 70,
      imgName: 'smartwatch2',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'White SmartWatch',
      watchPrice: 320,
      imgName: 'smartwatch3',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
    ),
    WatchDetail(
      watchName: 'Green SmartWatch',
      watchPrice: 55,
      imgName: 'smartwatch4',
      isLiked: false,
      isSmartOrAnalog: 'Smart Watch'
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
                      onTapCont: () {
                        modelBottomSheet(
                          context,
                          watchPrice: watchDetailList[index].watchPrice,
                          originalWatchPrice: watchDetailList[index].watchPrice,
                          imgName: watchDetailList[index].imgName,
                          watchName: watchDetailList[index].watchName,
                          isSmartOrAnaLog: watchDetailList[index].isSmartOrAnalog,
                          whichParagraph: analogWatch
                        );
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
                          if (favouriteList.length == 1) {
                            favouriteList.clear();
                          } else {
                            favouriteList.remove(digitalWatchDetailList[index]);
                          }
                        });
                      },
                      onTapCont: () {
                        modelBottomSheet(
                          context,
                          watchPrice: digitalWatchDetailList[index].watchPrice,
                          originalWatchPrice:
                              digitalWatchDetailList[index].watchPrice,
                          imgName: digitalWatchDetailList[index].imgName,
                          watchName: digitalWatchDetailList[index].watchName,
                          isSmartOrAnaLog: digitalWatchDetailList[index].isSmartOrAnalog,
                          whichParagraph: smartWatchParagraph
                        );
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
