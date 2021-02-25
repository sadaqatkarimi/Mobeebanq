import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mobeebanq/components/customButtons.dart';
import 'package:mobeebanq/components/mywalkthrough.dart';
import 'package:mobeebanq/components/textStyles.dart';
import 'package:mobeebanq/size_config.dart';

import '../constants.dart';





class WalkThrough extends StatefulWidget {
  @override
  WalkThroughState createState() {
    return WalkThroughState();
  }
}

class WalkThroughState extends State<WalkThrough> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () => lastPage
                  ? null
                  : Navigator.pushNamed(context, "/phoneVerify"),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(lastPage
                      ? ""
                      : "Skip",
                    style: CustomTextStyle.normal1(context),
                    textAlign: TextAlign.right,)),
            ),
            SizedBox(width: 20,)
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // SizedBox(height: 10,),
              Expanded(
                flex: 4,
                child: PageView(
                  children: <Widget>[
                    myWalkthrough(

                      title: "Scan Your ID Front Side",
                      content: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmotempor invidunt ut labore et dolore",
                      image: "images/idFront.png",
                    ),
                    myWalkthrough(
                      title: "Scan Your ID Back Side",
                      content: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmotempor invidunt ut labore et dolore",
                      image: "images/idBack.png",
                    ),
                    // myWalkthrough(
                    //   title: "Something here Something here",
                    //   content: "Something here, something here, something here",
                    //   image: "images/walkthrough1.png",
                    // ),
                  ],
                  controller: controller,
                  onPageChanged: _onPageChanged,
                ),
              ),
              // SizedBox(height: 40,),
              new DotsIndicator(
                position: currentPage.toDouble(),
                dotsCount: 2,
                decorator: DotsDecorator(

                  activeColor: basicColor, color: Colors.grey,
                  activeSize: Size(10, 10),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
//                      numberOfDot: pageLength,
//                      position: currentIndexPage,
//                      dotColor: Colors.black87,
//                      dotActiveColor: Colors.amber
//
              ),
              SizedBox(height: 40,),
              walkthroghButton(
                iconss: Icon(Icons.arrow_forward,color: Colors.white,),
                  colorss: Colors.black,
                focusColor: basicColor,
                disbaleColor: Colors.white,
                onPressed: () => lastPage
                    ? Navigator.pushNamed(context, "/phoneVerify")
                    : controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn),
              ),
              // SizedBox(height: 60,),
            Expanded(
              flex: 2,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: new Image(
                  image: AssetImage("images/bottom.png"),
                  width:  MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height/6,
                ),
              ),
            )

            ],
          ),
        ),
      ),
    );
  }
}