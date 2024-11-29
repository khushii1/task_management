// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'package:get/get.dart';

import 'package:jio_works/utilities/library.dart';

class ProjectController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  RxBool isLoading = false.obs;
  RxList<dynamic> teams = [].obs;
  final teamName = TextEditingController();
  final newProjectName = TextEditingController();
  final projectName = TextEditingController();
  RxBool isButtonEnabled = false.obs;
  RxBool isButtonEnabled1 = false.obs;
  final databases = Databases(DataInfo.client!);
  RxString docuId = ''.obs;
  RxString type = "1".obs;
  RxMap<String, dynamic> teamData = <String, dynamic>{}.obs;
  RxMap<String, dynamic> projectData = <String, dynamic>{}.obs;

  showBox({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Align(
                  alignment: Alignment.centerRight, child: Icon(Icons.close))
              .onTap(() {
            Navigator.pop(context);
          }),
          title: const TextWidget(
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
                decoration: const InputDecoration(
                  isDense: true,
                  hintStyle: TextStyle(fontSize: 12, height: 3),
                  floatingLabelStyle: TextStyle(height: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(fontSize: 20, height: 4),
                  labelText: 'Team Name',
                  hintText: "Enter Your Team Name",
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff595959), width: 1.5)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff595959), width: 1.5)),
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    isButtonEnabled.value = true;
                    update();
                  } else {
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
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: const TextWidget(
                text: "Cancel",
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ).pSymmetric(h: 20, v: 10),
            ).onTap(() {
              Navigator.pop(context);
            }),
            Obx(() => isButtonEnabled.value
                ? Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextWidget(
                      text: "Create Team",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ).pSymmetric(h: 20, v: 10),
                  ).onTap(() {
                    createTeam(context: context);
                  })
                : Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextWidget(
                      text: "Create Team",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ).pSymmetric(h: 20, v: 10),
                  ).opacity(value: 0.5))
          ],
        );
      },
    );
  }

  Future<void> createTeam({required BuildContext context}) async {
    try {
      Navigator.pop(context);
      isLoading.value = true;
      update();
      teams.any((element) => element['name'] == teamName.text)
          ? showSnackBar(message: "Team Already Exist", context: context)
          : await databases.createDocument(
              databaseId: DataInfo.databaseId,
              collectionId: DataInfo.teamCollectionId,
              documentId: ID.unique(),
              data: {
                "id": ID.unique(),
                "name": teamName.text.trim(),
                "created_by": DataInfo.user!.$id,
                "created_date": DateTime.now().toString(),
              },
            ).then((value) async {
              await addProject(value.data['id'], context);

              // showSnackBar(message: "Teams created", context: context);
              teamName.clear();

              // context.go('/login');
            });
      isLoading.value = false;
      update();
    } on AppwriteException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isLoading.value = false;
      update();
    }
  }

  getData() async {
    Databases databases = Databases(DataInfo.client!);

    try {
      isLoading.value = true;
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
        teams.value =
            response.documents.map((element) => element.data).toList();
      }
      isLoading.value = false;
      update();
    } catch (e) {
      isLoading.value = false;
      update();
      if (kDebugMode) {
        isLoading.value = false;
        update();
        print('Error: $e');
      }
    }
  }

  getDocumentIdByTeamId(
      String teamId, String projectName, BuildContext context) async {
    final database = Databases(DataInfo.client!);

    final query = Query.and([
      Query.equal('team_id', teamId),
      Query.equal('name', projectName),
    ]);

    final documents = await database.listDocuments(
      collectionId: DataInfo.projectCollectionId, // Your teams collection ID
      queries: [query], databaseId: DataInfo.databaseId,
    );

    if (documents.documents.isNotEmpty) {
      docuId.value = documents.documents.first.$id;
      changeName(context);
    } else {
      return null;
    }
  }

  changeName(BuildContext context) async {
    Navigator.pop(context);
    final database = Databases(DataInfo.client!);

    try {
      await database
          .updateDocument(
        collectionId: DataInfo.projectCollectionId, // Your teams collection ID
        documentId: docuId.value,
        data: {
          'name': projectName.text,
        },
        databaseId: DataInfo.databaseId,
      )
          .then((value) {
        getData();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  renameProject(
      {required BuildContext context,
      required String id,
      required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Align(
                  alignment: Alignment.centerRight, child: Icon(Icons.close))
              .onTap(() {
            Navigator.pop(context);
          }),
          title: const TextWidget(
            textAlign: TextAlign.start,
            text: "Rename Project",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ).pOnly(right: 200),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: projectName,
                decoration: const InputDecoration(
                  isDense: true,
                  hintStyle: TextStyle(fontSize: 12, height: 3),
                  floatingLabelStyle: TextStyle(height: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(fontSize: 20, height: 4),
                  labelText: 'Enter Project Name',
                  hintText: "Enter Project Namee",
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff595959), width: 1.5)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff595959), width: 1.5)),
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    isButtonEnabled1.value = true;
                    update();
                  } else {
                    isButtonEnabled1.value = false;
                    update();
                  }
                },
              ),
              20.heightBox,
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: const TextWidget(
                text: "Cancel",
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ).pSymmetric(h: 20, v: 10),
            ).onTap(() {
              Navigator.pop(context);
            }),
            Obx(() => isButtonEnabled1.value
                ? Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextWidget(
                      text: "Rename",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ).pSymmetric(h: 20, v: 10),
                  ).onTap(() {
                    getDocumentIdByTeamId(id, name, context);
                  })
                : Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextWidget(
                      text: "Rename",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ).pSymmetric(h: 20, v: 10),
                  ).opacity(value: 0.5))
          ],
        );
      },
    );
  }

  addProjectPopup({required BuildContext context, required String id}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Align(
                  alignment: Alignment.centerRight, child: Icon(Icons.close))
              .onTap(() {
            Navigator.pop(context);
          }),
          title: const TextWidget(
            textAlign: TextAlign.start,
            text: "Create New Project",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ).pOnly(right: 200),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: newProjectName,
                decoration: const InputDecoration(
                  isDense: true,
                  hintStyle: TextStyle(fontSize: 12, height: 3),
                  floatingLabelStyle: TextStyle(height: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: TextStyle(fontSize: 20, height: 4),
                  labelText: 'Enter Project Name',
                  hintText: "Enter Project Namee",
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff595959), width: 1.5)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff595959), width: 1.5)),
                ),
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    isButtonEnabled1.value = true;
                    update();
                  } else {
                    isButtonEnabled1.value = false;
                    update();
                  }
                },
              ),
              20.heightBox,
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: const TextWidget(
                text: "Cancel",
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ).pSymmetric(h: 20, v: 10),
            ).onTap(() {
              Navigator.pop(context);
            }),
            Obx(() => isButtonEnabled1.value
                ? Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextWidget(
                      text: "Create Project",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ).pSymmetric(h: 20, v: 10),
                  ).onTap(() {
                    Navigator.pop(context);
                    addProject(id, context);
                  })
                : Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const TextWidget(
                      text: "Create Project",
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ).pSymmetric(h: 20, v: 10),
                  ).opacity(value: 0.5))
          ],
        );
      },
    );
  }

  addProject(String id, BuildContext context) async {
    try {
      await databases.createDocument(
          databaseId: DataInfo.databaseId,
          collectionId: DataInfo.projectCollectionId,
          documentId: ID.unique(),
          data: {
            "id": ID.unique(),
            "name": newProjectName.text.trim().isNotEmpty
                ? newProjectName.text
                : "Your Project Here",
            "team_id": id,
            "dashboard_id": id,
            "created_by": DataInfo.user!.$id,
            "created_date": DateTime.now().toString(),
          }).then((value) {
        showSnackBar(message: "Project added", context: context);
        getData();
      });
    } on AppwriteException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isLoading.value = false;
      update();
    }
  }

  Future<List<Document>?> getProjectList(String id) async {
    Databases databases = Databases(DataInfo.client!);

    final query = Query.equal('team_id', id);

    final response = await databases.listDocuments(
      collectionId: DataInfo.projectCollectionId, // Your projects collection ID
      queries: [query], databaseId: DataInfo.databaseId,
    );
    if (response.documents.isNotEmpty) {
      return response.documents;
    } else {
      return [];
    }
  }

  Future<void> deleteProject(String projectId, BuildContext context) async {
    Navigator.pop(context);
    await databases
        .deleteDocument(
      collectionId: DataInfo.projectCollectionId,
      documentId: projectId,
      databaseId: DataInfo.databaseId,
    )
        .then((value) {
      getData();
    });
  }

  deleteBox({required BuildContext context, required String projectId}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Align(
                  alignment: Alignment.centerRight, child: Icon(Icons.close))
              .onTap(() {
            Navigator.pop(context);
          }),
          title: const TextWidget(
            textAlign: TextAlign.start,
            text: "Delete Project",
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ).pOnly(right: 200),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextWidget(
                text: "Are you sure you want to Delete this project?",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              20.heightBox,
              const TextWidget(
                text:
                    "You along with your team member will loose access to this project",
              ),
              20.heightBox,
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: const TextWidget(
                text: "Nah,i'll keep it",
                color: Colors.blue,
                fontWeight: FontWeight.w500,
              ).pSymmetric(h: 20, v: 10),
            ).onTap(() {
              Navigator.pop(context);
            }),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(20)),
              child: const TextWidget(
                text: "Delete Project",
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ).pSymmetric(h: 20, v: 10),
            ).onTap(() {
              deleteProject(projectId, context);
            })
          ],
        );
      },
    );
  }

  onChangeScreen(String data, final team, final project) {
    type.value = data;
    if (data == "1") {
      teamData.value = team;
    } else {
      teamData.value = team;
      projectData.value = project;
    }

    update();
  }
}
