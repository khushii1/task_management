import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:jio_works/utilities/library.dart';

class TableScreenController extends GetxController {
  final Map<String, dynamic> teamData;
  final Map<String, dynamic> projectData;

  TableScreenController({required this.teamData, required this.projectData});

  RxList<dynamic> taskHeadingList = [].obs;


  @override
  void onInit() {
    getHeadingData();
    super.onInit();
  }

  createTaskHeading() async {
    final databases = Databases(DataInfo.client!);

    try {
      List<dynamic> dataList = [
        {
          'id': ID.unique(),
          'name': 'Task Group Name',
          "teamId": teamData['id'],
          "projectId": projectData['id'],
          "createdBy": DataInfo.userDetails['\$id']
        },
        {
          'id': ID.unique(),
          'name': 'Status',
          "teamId": teamData['id'],
          "projectId": projectData['id'],
          "createdBy": DataInfo.userDetails['\$id']
        },
        {
          'id': ID.unique(),
          'name': 'Owner',
          "teamId": teamData['id'],
          "projectId": projectData['id'],
          "createdBy": DataInfo.userDetails['\$id']
        },
        {
          'id': ID.unique(),
          'name': 'Timeline',
          "teamId": teamData['id'],
          "projectId": projectData['id'],
          "createdBy": DataInfo.userDetails['\$id']
        },
      ];

      await Future.wait(dataList.map((data) {
        return databases.createDocument(
          databaseId: DataInfo.databaseId,
          collectionId: DataInfo.taskHeadignCollectionId,
          documentId: ID.unique(),
          data: data,
          permissions: [
            Permission.read(Role.users()),
            Permission.write(Role.users()),
          ],
        );
      }));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  getHeadingData() async {
    final databases = Databases(DataInfo.client!);
    var response = await databases.listDocuments(
      databaseId: DataInfo.databaseId,
      collectionId: DataInfo.taskHeadignCollectionId,
      queries: [
        Query.equal('teamId', teamData['id']),
        Query.equal('projectId', projectData['id']),
      ],
    );
    if (response.documents.isNotEmpty) {
      taskHeadingList.value =
          response.documents.map((element) => element.data).toList();

      update();
    }
  }
}
