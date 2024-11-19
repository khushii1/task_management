import 'package:appwrite/appwrite.dart';
import 'package:get/get.dart';
import 'package:jio_works/utilities/library.dart';

class SettingsController extends GetxController {
  RxInt index = 0.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final title = TextEditingController();
  final email = TextEditingController();
  final birthday = TextEditingController();
  final city = TextEditingController();
  final phone = TextEditingController();
  final aniversary = TextEditingController();

  RxMap<String, dynamic> userDetails = <String, dynamic>{}.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  changeIndex(value) {
    index.value = value;
    update();
  }

  getData() async {
    Databases databases = Databases(DataInfo.client!);

    try {
      // Fetch documents from a specific database and collection
      var response = await databases.listDocuments(
        databaseId: '6735eba3001840aef863',
        collectionId: '6735ebaa003ba5e26526',
      );

      if (response.documents.isNotEmpty) {
        if (response.documents.isNotEmpty) {
          print('Documents: ${response.documents.first.data}');
          userDetails.value = response.documents.first.data;
          firstName.text = userDetails['first_name'];
          lastName.text = userDetails['last_name'];
          email.text = userDetails['email'];
          title.text = userDetails['origanization'];
          update();
        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
