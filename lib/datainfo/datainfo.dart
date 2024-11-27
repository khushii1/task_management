import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataInfo {
  static String projectId = '6732e7f20038e9fc710b';
  static String url = 'https://cloud.appwrite.io/v1';
  static late Account account;
  static String sessionId = '';
  static Client? client;
  static int index = 4;
  static GetStorage box = GetStorage();
  static User? user;
  static String databaseId='6735eba3001840aef863';
  static String userCollectionId='6735ebaa003ba5e26526';
  static String teamCollectionId='6746a4f9000ec5538ccc';
  static String projectCollectionId='6746e4ec002afcaa7211';
  static RxMap<String, dynamic> userDetails = <String,dynamic>{}.obs;

  static appWriteInfo() async {
    try {
      client =
          Client().setEndpoint(DataInfo.url).setProject(DataInfo.projectId);

      account = Account(client!);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
