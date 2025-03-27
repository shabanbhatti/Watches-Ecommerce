import 'package:flutter/material.dart';
import 'package:watches_ecommerce_/Animated%20paragraph/animate_paragraph.dart';
import 'package:watches_ecommerce_/Animated%20watches/animated_watches_img.dart';
import 'package:watches_ecommerce_/UI%20helper/app_MAIN_color.dart';
import 'package:watches_ecommerce_/UI%20helper/my_main_button.dart';

void modelBottomSheet(
  BuildContext context, {
  required int watchPrice,
  required int originalWatchPrice,
  required String imgName,
   String isSmartOrAnaLog='',
   String whichParagraph='',
  required String watchName,
}) {
  var mqSize = MediaQuery.of(context).size;
  int addToCartNumber = 1;

  showModalBottomSheet(
    // shape: Border.all(width: 1, color: Colors.white),
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    barrierColor: Colors.grey.withAlpha(100),
    isScrollControlled: false,
    scrollControlDisabledMaxHeightRatio: 0.7,
    enableDrag: true,
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 1,
        maxChildSize: 1,
        minChildSize: 1,

        builder: (context, scrollController) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: mqSize.height * 0.005,
                      width: mqSize.width * 0.2,

                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),

                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: mqSize.height,
                        width: mqSize.width * 0.9,
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              AnimatedWatches(
                                begin: 0.9,
                                end: 1,
                                watchImgName: imgName,
                              ),

                              Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Name: ',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                          watchName,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: myColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Price: ',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        Text(
                                          '${watchPrice.toString()}k',
                                          style: TextStyle(
                                            color: myColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Text(
                                          'Add to Cart: ',
                                          style: TextStyle(fontSize: 17),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (addToCartNumber > 1) {
                                                addToCartNumber--;
                                                watchPrice -=
                                                    originalWatchPrice;
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_circle,
                                            color: myColor,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          height: mqSize.height * 0.04,
                                          width: mqSize.width * 0.1,
                                          child: Center(
                                            child: Text(
                                              addToCartNumber.toString(),
                                              style: TextStyle(color: myColor),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (addToCartNumber < 3) {
                                                addToCartNumber++;
                                                watchPrice +=
                                                    originalWatchPrice;
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add_circle,
                                            color: myColor,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(20),
                                child: myButton(
                                  context,
                                  buttonText: 'Buy now',
                                  onPressed: () {},
                                ),
                              ),
                              (isSmartOrAnaLog.isNotEmpty)?Column(children: [ Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Divider(thickness: 1),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Center(
                                  child: Text(
                                    'What is $isSmartOrAnaLog?',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),],):SizedBox(),
                             
                              Padding(
                                padding: EdgeInsets.only(top: 30),

                                child: AnimatedParagraph(
                                  whichWatchParagraph: whichParagraph,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}
