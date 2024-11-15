import 'package:appwrite/appwrite.dart';

class DataInfo {
  static String projectId = '6732e7f20038e9fc710b';
  static String url = 'https://cloud.appwrite.io/v1';
  static late Account account;
  static String  sessionId='';
  static Client? client;
  static appWriteInfo() {
     client =
        Client().setEndpoint(url).setProject(projectId);

    account = Account(client!);
  }
}
