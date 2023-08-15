import 'package:flutter/material.dart';

class AppTheme {
  static final TEXTFIELD = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
  );
 static final CARD = BoxDecoration(
   image: const DecorationImage(
     image: AssetImage("assets/images/album.png"),
     fit: BoxFit.cover,
   ),
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.grey,
      width: 1.0,
    ),
  );
  static final HEADER_TITLE_STYLE = TextStyle(
    fontSize: 19.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final SUB_HEADER_TITLE_STYLE = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final NORMAL_TEXT = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );
  static final BOLD_TEXT = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const PAGE_PADDING= EdgeInsets.all(15);
  static const TEXTFILED_PADDING = EdgeInsets.all(2);
  static const TEXTFILED_MARGIN = EdgeInsets.only(left: 10,right: 10);
  static const SIZEBOX_HEIGHT_xxSMALL = 10.0;
  static const SIZEBOX_HEIGHT_xSMALL = 20.0;
  static const SIZEBOX_HEIGHT_SMALL = 30.0;
}
