import 'dart:developer';

import 'package:bhart_app/bloc/home_data_bloc.dart';
import 'package:bhart_app/model/home_model.dart';
import 'package:bhart_app/networking/network_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loanding = true;
  List<String> banners = [];
  List<FeaturedCategories> featuredCategories = [];
  List<FeaturedCourses> featuredCourses = [];
  List<PopularCourses> popularCourses = [];

  late HomeDataBloc homeDataBloc;

  @override
  initState() {
    homeDataBloc = HomeDataBloc();
    Featureshow();
    _gethomeData();

    // TODO: implement initState
    super.initState();
  }

//Calling Data
  Featureshow() async {
    await homeDataBloc.gethomeStream.listen((event) {
      if (event != null) {
        //  debugger();
        print(event);
        HomeRepoModel homeRepoModel = HomeRepoModel.fromJson(event);
        featuredCategories.addAll(homeRepoModel.body.featuredCategories);
        banners.addAll(homeRepoModel.body.banners);
        featuredCourses.addAll(homeRepoModel.body.featuredCourses);
        popularCourses.addAll(homeRepoModel.body.popularCourses);
        setState(() {
          loanding = false;
        });
      }
    });
  }

// Call Api Bloc
  _gethomeData() {
    homeDataBloc.callhomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 228, 224, 224),
        body: loanding == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  // color: Colors.white,
                  child: Column(children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                            height: 40.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.9),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ))),
                        Container(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 4.h,
                              ),
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 4.h,
                              ),
                            ],
                          ).p12(),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            "Hello \nPiyush,",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold),
                          ).p12(),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 22.h),
                          child: Row(
                            children: [
                              Container(
                                height: 5.h,
                                width: 75.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    )),
                              ),
                              Container(
                                height: 5.h,
                                width: 13.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    )),
                                child: Icon(Icons.search),
                              ),
                            ],
                          ).p12(),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 32.h, left: 20, right: 20),
                          width: 100.w,
                          child: ImageSlideshow(
                              width: double.infinity,
                              height: 15.h,
                              initialPage: 0,
                              indicatorColor: Colors.blue,
                              indicatorBackgroundColor: Colors.grey,
                              onPageChanged: (value) {},
                              autoPlayInterval: 3000,
                              isLoop: true,
                              children: List.generate(banners.length, (index) {
                                return Container(
                                  height: 18.h,
                                  width: 90.w,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(banners[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              })),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 50.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            NetworkConstant.Image_URL +
                                                featuredCategories[0].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  1.h.heightBox,
                                  Text(
                                    featuredCategories[0].name.toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            NetworkConstant.Image_URL +
                                                featuredCategories[1].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  1.h.heightBox,
                                  Text(
                                    featuredCategories[1].name.toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            NetworkConstant.Image_URL +
                                                featuredCategories[2].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  1.h.heightBox,
                                  Text(
                                    featuredCategories[2].name.toString(),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 65.h,
                          ),
                          child: Text(
                            "Courses",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ).p12(),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 70.h, left: 20, right: 20),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  // height: 20.h,
                                  // width: 20.w,

                                  child: Column(
                                    children: [
                                      Container(
                                        height: 10.h,
                                        width: 27.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(NetworkConstant
                                                    .Image_URL +
                                                featuredCourses[index].image),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      1.h.heightBox,
                                      Text(
                                        featuredCourses[index].level,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: featuredCourses.length),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 102.h,
                          ),
                          child: Text(
                            "Popular Courses",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ).p12(),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 107.h, left: 20, right: 20),
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10)),
                                  // height: 20.h,
                                  // width: 20.w,

                                  child: Column(
                                    children: [
                                      Container(
                                        height: 10.h,
                                        width: 27.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(NetworkConstant
                                                    .Image_URL +
                                                popularCourses[index].image),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      1.h.heightBox,
                                      Container(
                                        height: 2.h,
                                        child: Text(
                                          popularCourses[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold),
                                        ).centered(),
                                      )
                                    ],
                                  ),
                                );
                              },
                              itemCount: popularCourses.length),
                        ),
                      ],
                    ),
                  ]),
                ),
              ));
  }
}
