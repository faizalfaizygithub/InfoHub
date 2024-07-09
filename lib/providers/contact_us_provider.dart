import 'package:flutter/material.dart';

class ContactUsProvider extends ChangeNotifier {
  List<Map<String, String>> contactFieldsData = [
    {"field_title": "Your Name", "field_icon": "profile"},
    {"field_title": "Your Phone Number", "field_icon": "mobile"},
    {"field_title": "Your Email Address", "field_icon": "sms"},
    {"field_title": "Your Message", "field_icon": "message-add"},
  ];
}
