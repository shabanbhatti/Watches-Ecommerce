import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/Home%20Screen/watch_container.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({super.key, required this.favouriteList});
  List favouriteList;

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Center(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: mqSize.height * 0.1,
            leading: SizedBox(),
            pinned: true,
            snap: true,
            floating: true,
            backgroundColor: myColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Favourite'),

              centerTitle: true,
            ),
          ),

          (widget.favouriteList.isNotEmpty)
              ? SliverPadding(
                padding: EdgeInsets.only(right: 10, left: 10, top: 20),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: widget.favouriteList.length,

                  itemBuilder: (context, index) {
                    return WatchContainer(
                      watchDetail: widget.favouriteList[index],
                      onPressedLIKED: () {},
                      onPressedUNLIKED: () {
                        setState(() {
                          widget.favouriteList.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              )
              : SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: mqSize.height * 0.37),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,
                          size: 35,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'No Favourite',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
