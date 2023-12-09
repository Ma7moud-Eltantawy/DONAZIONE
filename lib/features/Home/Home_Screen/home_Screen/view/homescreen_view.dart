import 'package:badges/badges.dart';
import 'package:blood_donar/core/styles/icons.dart';
import 'package:blood_donar/features/Home/Home_Screen/home_Screen/controller/homescreen_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:badges/badges.dart' as badges;

import '../../../../../core/manager/colors_manager.dart';
import '../../../../../widgets/req_listview.dart';
List <String>Baners=["assets/images/baner1.jpg","assets/images/banner2.jpg","assets/images/baner3.jpeg","assets/images/baner4.png"];

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreen_Controller controller=Get.put(HomeScreen_Controller());

    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      appBar: AppBar(backgroundColor:Colors.transparent,elevation: 0,
      leading: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust the margin values as needed
        child:badges.Badge(child: Icon(IconBroken.Notification,color: Colors.red,

        ),
        position: badges.BadgePosition.topEnd(top:-6,end:-4),
        )
      ),

      actions: [
        Padding(
            padding: EdgeInsets.all(width/50),
            child: Icon(IconBroken.Category,color: Colors.red,))

      ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyCarouselslider(),


            Container(
              alignment: Alignment.center,


              height: height/3,
              padding: EdgeInsets.symmetric(horizontal: width/40,vertical: width/80),
              child: GridView.count(
                dragStartBehavior: DragStartBehavior.start,
                primary: true,
                padding:  EdgeInsets.all(width/40),
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3, // Number of columns in the grid
                children: List.generate(6, (index) {
                  return InkWell(
                    focusColor: Colors.white,
                    onTap: () {
                      final categoryKey = controller.category.keys.toList()[index];
                      final selectedFunction = controller.categoriesFunction[categoryKey];

                      if (selectedFunction != null) {
                        selectedFunction();
                      } else {
                        print('Function not found for category: $categoryKey');
                      }
                    },



                    child: Card(
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width/40), // Adjust the radius value as needed
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsManager.white,
                          border: Border.all(
                            color: Colors.black12,
                            width: width/250,

                          ),
                          borderRadius: BorderRadius.circular(width/40,),

                        ),

                        // Each grid item is wrapped in a container
                        margin: EdgeInsets.all(width/500),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset("${controller.category[controller.category.keys.toList()[index]]}"),
                            Text(
                              '${controller.category.keys.toList()[index].toString()}',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                                fontSize: width/40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Container(
                padding:  EdgeInsets.all(width/40),
                alignment: Alignment.centerRight,
                child: Text("Donation Requests:",textDirection: TextDirection.rtl,)),
            //Requests_Listview(height: height, width: width,scroll: false,)


          ],
        ),
      ),
    );
  }
}


class MyCarouselslider extends StatelessWidget {
  final HomeScreen_Controller myController = Get.put(HomeScreen_Controller());

  MyCarouselslider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 160,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(seconds: 3),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index,reson){
            myController.changecurrentindex(index);


            }


          ),
          items:Baners.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
                  ),

                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(

                      ),
                      child: ClipRRect(borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15)),

                        child: Image.asset(
                          fit: BoxFit.fill,
                          i,

                        ),
                      )),
                );
              },
            );
          }).toList(),
        ),
        GetBuilder<HomeScreen_Controller>(
          builder:(con)=> DotsIndicator(
            dotsCount: Baners.length,
            position: con.current_index.toDouble(),
            decorator: DotsDecorator(
              color: Colors.grey, // Color of the inactive dots
              activeColor: Colors.red, // Color of the active dot
            ),
          ),
        ),
      ],
    );
  }
}

