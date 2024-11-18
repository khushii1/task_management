import 'package:appwrite/appwrite.dart';

class DataInfo {
  static String projectId = '6732e7f20038e9fc710b';
  static String url = 'https://cloud.appwrite.io/v1';
  static late Account account;
  static String  sessionId='';
  static Client? client;
  static int index=4;
  static appWriteInfo()async {
   try{
     print("printed");
     client =
         Client().setEndpoint(DataInfo.url).setProject(DataInfo.projectId);
     print(client!.config.toString());
     account = Account(client!);
   }catch(e){
     print("de:${e}");
   }
  }
}
