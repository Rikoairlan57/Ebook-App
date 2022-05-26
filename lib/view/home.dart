import 'package:ebook/controller/con_ebook.dart';
import 'package:ebook/controller/con_latest.dart';
import 'package:ebook/model/model_ebook.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<ModelEbook>>? getSlider;
  List<ModelEbook> listSlider = [];

  Future<List<ModelEbook>>? getPostNews;
  List<ModelEbook> listPostNews = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSlider = fetchEbook(listSlider);
    getPostNews = fetchLatest(listPostNews);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getSlider,
            builder: (BuildContext context, AsyncSnapshot<List<ModelEbook>> snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Slider
                    Container(
                      child: FutureBuilder(
                        future: getSlider,
                        builder: (BuildContext context, AsyncSnapshot<List<ModelEbook>> snapshot) {
                          if(snapshot.connectionState == ConnectionState.done){
                            return SizedBox(
                              height: 27.h,
                              child: Swiper(
                                autoplay: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index){
                                  return GestureDetector(
                                    onTap: (){},
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Container(
                                        child:  Stack(
                                          children: [
                                            ClipRRect(
                                              child: Image.network(
                                                listSlider[index].photo,
                                                fit: BoxFit.cover,
                                                width: 100.w,
                                              ),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.circular(15),
                                                    bottomLeft: Radius.circular(15),
                                                  ),
                                                  gradient: LinearGradient(
                                                    end: Alignment(0.0, -1),
                                                    begin: Alignment(0.0, 0.2),
                                                    colors: [
                                                      Colors.black,
                                                      Colors.black.withOpacity(0.0)
                                                    ]
                                                  )
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text(
                                                    listSlider[index].title, style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }else{
                            return Container();
                          }
                        },
                      ),
                    ),
                    // news
                    Container(
                      child: FutureBuilder(
                        future: getPostNews,
                        builder: (BuildContext context, AsyncSnapshot<List<ModelEbook>> snapshot){
                          if(snapshot.connectionState == ConnectionState.done){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Latest', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                  child: ListView.builder(
                                      itemBuilder: (BuildContext context, int index){
                                        if(index == snapshot.data!.length){
                                          return GestureDetector(
                                            onTap: (){},
                                            child: Container(
                                              width: 25.w,
                                              padding: EdgeInsets.all(10),
                                              child: Text("Learn More", style: TextStyle(
                                                color: Colors.blue
                                              ),textAlign: TextAlign.center,),
                                            ),
                                          );
                                        }else {
                                          return GestureDetector(
                                            onTap: (){},
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  ClipRRect(
                                                    child: Image.network(
                                                      listPostNews[index].photo,
                                                      height: 15.h,
                                                      width: 25.w,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  SizedBox(height: 0.5.h,),
                                                  Container(
                                                    width: 25.w,
                                                    child: Text(
                                                      listPostNews[index].title,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ), maxLines: 2, overflow: TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      itemCount: snapshot.data!.length + 1,
                                      scrollDirection: Axis.horizontal,
                                  ),
                                )
                              ],
                            );
                          }else{
                            return Container();
                          }
                        }
                      ),
                    ),
                    // coming soon
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                        future: getPostNews,
                        builder: (BuildContext context, AsyncSnapshot<List<ModelEbook>> snapshot) {
                          if(snapshot.connectionState == ConnectionState.done){
                            return Container(
                              color: Colors.blueGrey.withOpacity(0.5),
                              padding: EdgeInsets.only(top: 2.0.h),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text("Coming Soon", style: TextStyle(
                                          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32, letterSpacing: 10
                                      ), textAlign: TextAlign.center,),
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(top: 3.h),
                                    ),
                                  ),
                                  SizedBox(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (BuildContext ctx, int index){
                                        return GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            child: Column(
                                              children: [
                                                ClipRRect(
                                                  child: Image.network(
                                                    listPostNews[index].photo,
                                                    height: 15.h,
                                                    width: 25.w,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                    ),
                                  )
                                ],
                              ),
                            );
                          }else {
                            return Container(

                            );
                          }

                        },
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
