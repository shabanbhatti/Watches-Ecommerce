import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/Home%20Screen/class_watch_detail.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';

class WatchContainer extends StatefulWidget {
  WatchContainer({
    super.key,
    required this.watchDetail,
    required this.onPressedLIKED,
    required this.onPressedUNLIKED,
    required this.onTapCont,
  });
  WatchDetail watchDetail;
  void Function()? onPressedLIKED;
  void Function()? onPressedUNLIKED;
  void Function()? onTapCont;
  @override
  State<WatchContainer> createState() => _WatchContainerState();
}

class _WatchContainerState extends State<WatchContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleTween;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    scaleTween = Tween<double>(begin: 0.9, end: 1).animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mqSize = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTapCont,
        child: Container(
          height: mqSize.height * 0.29,
          width: mqSize.width * 0.47,
          decoration: BoxDecoration(
            // color: Colors.grey.withAlpha(100),
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),

            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 7,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Column(
            children: [
              Flexible(
                flex: 60,
                child: ScaleTransition(
                  scale: scaleTween,
                  child: Image.asset(
                    'assets/images/${widget.watchDetail.imgName}.png',
                    height: mqSize.height * 0.15,
                    width: mqSize.width * 0.25,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),

              Flexible(
                flex: 20,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    widget.watchDetail.watchName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Flexible(
                flex: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Text('Price: ')),
                    Flexible(
                      child: Text(
                        widget.watchDetail.watchPrice.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: myColor,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        'k',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: myColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              (widget.watchDetail.isLiked == false)
                  ? Flexible(
                    flex: 20,
                    child: IconButton(
                      onPressed: widget.onPressedLIKED,
                      // onPressed: () {
                      //   setState(() {
                      //     widget.watchDetail.isLiked = true;
                      //   });
                      // },
                      icon: Icon(CupertinoIcons.heart, size: 40),
                    ),
                  )
                  : Flexible(
                    flex: 20,
                    child: IconButton(
                      onPressed: widget.onPressedUNLIKED,
                      // onPressed: () {
                      //   setState(() {
                      //     widget.watchDetail.isLiked = false;
                      //   });
                      // },
                      icon: Icon(
                        CupertinoIcons.heart_fill,
                        color: myColor,
                        size: 40,
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
