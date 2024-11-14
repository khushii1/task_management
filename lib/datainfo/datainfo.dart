import 'package:appwrite/appwrite.dart';

class Datainfo{
  static String projectId='6732e7f20038e9fc710b';
  static String url='https://cloud.appwrite.io/v1';
  static late Account account;
 static  appWriteInfo(){
     final client = Client()
        .setEndpoint(Datainfo.url)
        .setProject(Datainfo.projectId);

     account = Account(client);
  }
}