import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  List notifications = [
    {
      "title": "Admin Approved",
      "subtitle": " the post that you shared",
      "isRead": false
    },
    {
      "title": "Waiting",
      "subtitle": " for the approval of the post that you shared",
      "isRead": true
    },
    {
      "title": "Maria Thomas",
      "subtitle": " liked post that you shared",
      "isRead": true
    },
    {
      "title": "Arun Krishna",
      "subtitle": " started following you",
      "isRead": true
    },
    {
      "title": "Vishnu Das",
      "subtitle": " liked a post that you shared",
      "isRead": true
    },
    {
      "title": "Fasna Roobina",
      "subtitle": " started following you",
      "isRead": true
    },
    {
      "title": "Anujya Sreedharan",
      "subtitle": " liked a post that you shared",
      "isRead": true
    },
  ];
}
