// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NewDetailScreen extends StatefulWidget {
  final String newImage, author, description, newTitle, content, source;

  const NewDetailScreen(
      {super.key,
      required this.newImage,
      required this.author,
      required this.description,
      required this.newTitle,
      required this.content,
      required this.source});

  @override
  State<NewDetailScreen> createState() => _NewDetailScreenState();
}

class _NewDetailScreenState extends State<NewDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'THE NEWS',
          style: GoogleFonts.lora(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Text(
                  widget.newTitle,
                  style: GoogleFonts.lora(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            height: height * .4,
            margin: EdgeInsets.only(top: 150),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: Text(
                  widget.description,
                  maxLines: 8,
                  style: GoogleFonts.lora(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
              ),
            ),
          ),
          Container(
            height: height * 0.6,
            width: width * 1,
            padding: EdgeInsets.symmetric(
                horizontal: height * .01, vertical: width * .06),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                margin: EdgeInsets.only(top: height * 0.3),
                child: CachedNetworkImage(
                  imageUrl: widget.newImage,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    child: SpinKitFadingCircle(
                      color: Colors.amber,
                      size: 40,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error_outline,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
