import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class DataInfo {
  static String projectId = '6732e7f20038e9fc710b';
  static String url = 'https://cloud.appwrite.io/v1';
  static late Account account;
  static String sessionId = '';
  static Client? client;
  static int index = 4;
  static GetStorage box = GetStorage();

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
