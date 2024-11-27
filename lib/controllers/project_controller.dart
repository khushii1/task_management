import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jio_works/utilities/library.dart';

class ProjectController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
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

print(DataInfo.user!.$id);
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
      ).then((value) {

      showSnackBar(message: "Teams created", context: context);
      teamName.clear();
      Navigator.pop(context);
       // context.go('/login');
      });
    } on AppwriteException catch (e) {

      if (kDebugMode) {
        print(e);
      }
    }
    // try {
    //   final user = await Datainfo.account
    //       .create(
    //     userId: ID.unique(),
    //     email: email.text,
    //     password: password.text,
    //   )
    //       .then((value) {
    //     clearData();
    //     context.go('/login');
    //   });

    //   //  print('User created: ${user!.$id}');
    // } catch (e) {
    //   print("error comes");
    //   print(e.toString());
    //   showSnackBar(message: e.toString(), context: context);
    // }
  }
  getData() async {

    Databases databases = Databases(DataInfo.client!);

    try {

      // Fetch documents from a specific database and collection
      var response = await databases.listDocuments(
        databaseId: DataInfo.databaseId,
        collectionId: DataInfo.teamCollectionId,
        queries: [
          Query.equal('created_by', DataInfo.user!.$id),
        ],
      );

      if (response.documents.isNotEmpty) {

      }
    } catch (e) {

      if (kDebugMode) {

        print('Error: $e');
      }
    }
  }
}
