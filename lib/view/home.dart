// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unused_local_variable, dead_code, unrelated_type_equality_checks

import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_news/models/Uk_news_channel_headlines_model.dart';
import 'package:the_news/models/categories_news_model.dart';
import 'package:the_news/models/news_channel_headlines_model.dart';
import 'package:the_news/view/category.dart';
import 'package:the_news/view/news_detail_screen.dart';
import 'package:the_news/view_models/Uk_news_view_model.dart';
import 'package:the_news/view_models/news_view_model.dart';
import 'package:the_news/repository/news_repository.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

enum Contry { india, uk, canada, australia }

Contry? selectedItem = Contry.india;

class _HomeWidgetState extends State<HomeWidget> {
  final NewsViewModel newsViewModel = NewsViewModel();
  //VARIABLES

  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.height * 7 / 8;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    Color blackWithOpacity = Colors.black.withOpacity(0.5);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Category()));
            },
            icon: Image.asset(
              'Assets/categoryicon.png',
              height: 20,
              width: 20,
            )),
        title: Text(
          'THE NEWS',
          style: GoogleFonts.lora(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // actions: [
        //   DropdownButton<Contry>(
        //     items: Contry.values.map((Contry option) {
        //       return DropdownMenuItem<Contry>(
        //         value: option,
        //         child: Text(option.toString().substring(option.toString().indexOf('.') + 1)), // Display the enum value as a string
        //       );
        //     }).toList(),
        //     onChanged: (Contry? value) {
        //       setState(() {
        //         selectedItem = value;
        //       });
        //       if (selectedItem == "uk") {
        //         UkHeadlines();
        //       }
        //     },
        //     value: selectedItem,
        //   )
        // ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .35,
            width: width,
            child: FutureBuilder<NewsChannelHeadlinesModel>(
              future: newsViewModel.fetchNewsChannelHeadlinesApi(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitFadingCircle(color: Colors.amber, size: 40),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewDetailScreen(
                                          newImage: snapshot
                                              .data!.articles![index].urlToImage
                                              .toString(),
                                          author: snapshot
                                              .data!.articles![index].author
                                              .toString(),
                                          description: snapshot.data!
                                              .articles![index].description
                                              .toString(),
                                          newTitle: snapshot
                                              .data!.articles![index].title
                                              .toString(),
                                          content: snapshot
                                              .data!.articles![index].content
                                              .toString(),
                                          source: snapshot.data!
                                              .articles![index].source!.name
                                              .toString(),
                                        )));
                          },
                          child: SizedBox(
                            child: Stack(
                              children: [
                                Container(
                                  height: height * 0.4,
                                  width: width * 1,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: height * .01,
                                      vertical: width * .06),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      child: CachedNetworkImage(
                                        imageUrl: snapshot
                                            .data!.articles![index].urlToImage
                                            .toString(),
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                            Container(
                                          child: spinKit2,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                          Icons.error_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.4,
                                  width: width * 1,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: height * .01,
                                      vertical: width * .06),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Container(
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // bottom: 0.9,
                                  top: height * 0.2,
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    height: height * 0.3,
                                    width: width * 1,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: height * .01,
                                        vertical: width * .06),
                                    child: Column(
                                      children: [
                                        Container(
                                          // padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                                          color: null,
                                          alignment: Alignment.bottomRight,
                                          width: width * 0.8,
                                          child: Text(
                                            snapshot
                                                .data!.articles![index].title
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.lora(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.08),
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(top: 10),
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  snapshot
                                                      .data!
                                                      .articles![index]
                                                      .source!
                                                      .name
                                                      .toString(),
                                                  maxLines: 2,
                                                  style: GoogleFonts.lora(
                                                      fontSize: 13,
                                                      color: Colors.amber,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
          SizedBox(
            height: height,
            child: FutureBuilder<CategoriesNewsModel>(
              future: newsViewModel.fetchCategoriesNews('General'),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitFadingCircle(color: Colors.amber, size: 40),
                  );
                } else {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NewDetailScreen(
                                          newImage: snapshot
                                              .data!.articles![index].urlToImage
                                              .toString(),
                                          author: snapshot
                                              .data!.articles![index].author
                                              .toString(),
                                          description: snapshot.data!
                                              .articles![index].description
                                              .toString(),
                                          newTitle: snapshot
                                              .data!.articles![index].title
                                              .toString(),
                                          content: snapshot
                                              .data!.articles![index].content
                                              .toString(),
                                          source: snapshot.data!
                                              .articles![index].source!.name
                                              .toString(),
                                        )));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    child: CachedNetworkImage(
                                      imageUrl: snapshot
                                          .data!.articles![index].urlToImage
                                          .toString(),
                                      fit: BoxFit.fill,
                                      height: height * .15,
                                      width: width * .3,
                                      placeholder: (context, url) => Container(
                                        child: SpinKitFadingCircle(
                                            color: Colors.amber, size: 40),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.error_outline,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                height: height * .18,
                                padding: EdgeInsets.only(left: 15, top: 15),
                                child: Column(children: [
                                  Text(
                                    snapshot.data!.articles![index].title
                                        .toString(),
                                    maxLines: 3,
                                    style: GoogleFonts.lora(
                                        fontSize: 20,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          snapshot.data!.articles![index]
                                              .source!.name
                                              .toString(),
                                          maxLines: 3,
                                          style: GoogleFonts.lora(
                                              fontSize: 13,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ]),
                              ))
                            ],
                          ),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

const spinKit2 = SpinKitFadingCircle(
  color: Colors.amber,
  size: 40,
);

// class UkHeadlines extends StatefulWidget {
//   const UkHeadlines({super.key});

//   @override
//   State<UkHeadlines> createState() => _UkHeadlinesState();
// }

// class _UkHeadlinesState extends State<UkHeadlines> {
//   final UkNewsViewModel newsViewModel = UkNewsViewModel();
//   //VARIABLES

//   double getSmallDiameter(BuildContext context) => MediaQuery.of(context).size.width * 2 / 3;
//   double getBigDiameter(BuildContext context) => MediaQuery.of(context).size.height * 7 / 8;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width * 1;
//     final height = MediaQuery.sizeOf(context).height * 1;

//     return Scaffold(
//       body: ListView(
//         children: [
//           SizedBox(
//             height: height * .55,
//             width: width,
//             child: FutureBuilder<UkNewsChannelHeadlinesModel>(
//               future: newsViewModel.fetchNewsChannelHeadlinesApi(),
//               builder: (BuildContext context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: SpinKitCircle(color: Colors.amber, size: 40),
//                   );
//                 } else {
//                   return ListView.builder(
//                       itemCount: snapshot.data!.articles!.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         return SizedBox(
//                           child: Stack(
//                             children: [
//                               Container(
//                                 height: height * 0.4,
//                                 width: width * 1,
//                                 padding: EdgeInsets.symmetric(horizontal: height * .01, vertical: width * .06),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: Container(
//                                     child: CachedNetworkImage(
//                                       imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
//                                       fit: BoxFit.fill,
//                                       placeholder: (context, url) => Container(
//                                         child: spinKit2,
//                                       ),
//                                       errorWidget: (context, url, error) => Icon(
//                                         Icons.error_outline,
//                                         color: Colors.red,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: height * 0.4,
//                                 width: width * 1,
//                                 padding: EdgeInsets.symmetric(horizontal: height * .01, vertical: width * .06),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: Container(
//                                     color: Colors.black.withOpacity(0.4),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 0.9,
//                                 child: Container(
//                                   alignment: Alignment.bottomLeft,
//                                   height: height * 0.3,
//                                   width: width * 1,
//                                   padding: EdgeInsets.symmetric(horizontal: height * .01, vertical: width * .06),
//                                   child: Column(
//                                     children: [
//                                       Container(
//                                         padding: EdgeInsets.symmetric(horizontal: width * 0.05),
//                                         color: null,
//                                         alignment: Alignment.bottomRight,
//                                         width: width * 0.8,
//                                         child: Text(
//                                           snapshot.data!.articles![index].title.toString(),
//                                           maxLines: 3,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: GoogleFonts.lora(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       });
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }