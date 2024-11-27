import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jio_works/utilities/library.dart';
import 'package:universal_html/html.dart';

class ProjectController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  RxBool isLoading=false.obs;
  RxList<dynamic> teams=[].obs;
  final teamName = TextEditingController();
  RxBool isButtonEnabled = false.obs;
  final databases = Databases(DataInfo.client!);
  showBox({required BuildContext context}) {
    print("hello");
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon:
              Align(alignment: Alignment.centerRight, child: Icon(Icons.close))
                  .onTap(() {
            Navigator.pop(context);
          }),
          title: TextWidget(
            textAlign: TextAlign.start,
            text: "Create New Team",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ).pOnly(right: 200),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: teamName,
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: const TextStyle(fontSize: 12, height: 3),
                  floatingLabelStyle: const TextStyle(height: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: const TextStyle(fontSize: 20, height: 4),
                  labelText: 'Team Name',
                  hintText: "Enter Your Team Name",
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff595959), width: 1.5)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff595959), width: 1.5)),
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    print("yes");
                    isButtonEnabled.value = true;
                    update();
                  } else {
                    print('no');
                    isButtonEnabled.value = false;
                    update();
                  }
                },
              ),
              20.heightBox,
            ],
          ),
          actions: [
            Container(
              child: TextWidget(
                text: "Cancel",
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ).pSymmetric(h: 20, v: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
            ).onTap(() {
              Navigator.pop(context);
            }),
            Obx(() => isButtonEnabled.value
                ? Container(
                    child: TextWidget(
                      text: "Create Team",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ).pSymmetric(h: 20, v: 10),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ).onTap(() {
              createTeam(context: context);
            })
                : Container(
                    child: TextWidget(
                      text: "Create Team",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ).pSymmetric(h: 20, v: 10),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ).opacity(value: 0.5))
          ],
        );
      },
    );
  }
  Future<void> createTeam({required BuildContext context}) async {

    try {
      Navigator.pop(context);
isLoading.value=true;
update();
      teams.any((element)=>element['name']==teamName.text)?showSnackBar(message: "Team Already Exist", context: context):
      await databases.createDocument(
        databaseId: DataInfo.databaseId,
        collectionId: DataInfo.teamCollectionId,
        documentId: ID.unique(),
        data: {
          "id": ID.unique(),
          "name": teamName.text.trim(),
          "created_by": DataInfo.user!.$id,
          "created_date": DateTime.now().toString(),

        },
      ).then((value) async{

        await databases.createDocument(databaseId: DataInfo.databaseId, collectionId: DataInfo.projectCollectionId, documentId: ID.unique(), data: {
          "id": ID.unique(),
          "name": 'Your Project Here',
          "team_id": value.data['id'],
            "dashboard_id":value.data['id'],
          "created_by":DataInfo.user!.$id,
          "created_date": DateTime.now().toString(),

        }).then((value){
          getData();
        });

      showSnackBar(message: "Teams created", context: context);
      teamName.clear();

       // context.go('/login');
      });
      isLoading.value=false;
      update();
    } on AppwriteException catch (e) {

      if (kDebugMode) {
        print(e);
      }
      isLoading.value=false;
      update();
    }

  }
  getData() async {

    Databases databases = Databases(DataInfo.client!);

    try {
isLoading.value=true;
update();
      // Fetch documents from a specific database and collection
      var response = await databases.listDocuments(
        databaseId: DataInfo.databaseId,
        collectionId: DataInfo.teamCollectionId,
        queries: [
          Query.equal('created_by', DataInfo.user!.$id),
        ],
      );

      if (response.documents.isNotEmpty) {
       teams.value=response.documents.map((element)=>element.data).toList();
        print(teams.toString());
      }
      isLoading.value=false;
      update();
    } catch (e) {
      isLoading.value=false;
      update();
      if (kDebugMode) {
        isLoading.value=false;
        update();
        print('Error: $e');
      }
    }
  }
}
