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
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Latest', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                  child: ListView.builder(
                                      itemBuilder: (BuildContext context, int index){
                                        return Container(
                                          child: Text(listPostNews[index].title),
                                        );
                                      },
                                      itemCount: snapshot.data!.length,
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
