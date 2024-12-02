// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:appwrite/appwrite.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jio_works/utilities/library.dart';

import '../utilities/utilities.dart';

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
  final password = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  late String prevPassword = '';
  late String docuId = '';
  RxInt selectedValue = 8.obs;
  RxInt selectedValues = 8.obs;
  final textFieldKey = GlobalKey();
  final datecontroller = TextEditingController();
  DateTime date = DateTime.now();
  File? file;
  Uint8List? webImage;
  RxString userImage = "".obs;
  RxBool isLoading = false.obs;
  RxList<dynamic> teamsData = [].obs;
RxBool show=false.obs;
  RxMap<String, dynamic> userDetails = <String, dynamic>{}.obs;
  @override
  void onInit() {
    getData();
    getTeams();
    super.onInit();
  }

  changeIndex(value) {
    index.value = value;
    update();
  }
showValue(){
    show.value=!show.value;
    update();
}
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      file = File(image.path);
      final bytes = await image.readAsBytes();
      webImage = bytes;
      update();
    }
    update();
  }

//
  chooseDate(context) async {
    DateTime chooseValue = await selectCustomDate(context: context) as DateTime;
    datecontroller.text = chooseValue.toString().split(' ')[0];
    update();
  }

  choseAniversary(context) async {
    DateTime chooseValue = await selectCustomDate(context: context) as DateTime;

    aniversary.text = chooseValue.toString().split(' ')[0];
    update();
  }

  getData() async {
    Databases databases = Databases(DataInfo.client!);

    try {
      isLoading.value = true;
      update();

      // Fetch documents from a specific database and collection
      var response = await databases.listDocuments(
        databaseId: DataInfo.databaseId,
        collectionId: DataInfo.userCollectionId,
        queries: [
          Query.equal('email', DataInfo.box.read('userDetails')['email']),
        ],
      );

      if (response.documents.isNotEmpty) {
        userDetails.value = response.documents.first.data;
        firstName.text = userDetails['first_name'];
        lastName.text = userDetails['last_name'];
        email.text = userDetails['email'];
        title.text = userDetails['origanization'];
        prevPassword = userDetails['password'];
        docuId = response.documents.first.$id;
        datecontroller.text = userDetails['birthday'] ?? "";
        aniversary.text = userDetails['work_anniversary'] ?? "";
        city.text = userDetails['city'] ?? "";
        phone.text = userDetails['mobile_no'] ?? "";
        if (Check.data(userDetails['image'])) {
          userImage.value = userDetails['image'];
        }
        isLoading.value = false;

        update();
      } else {
        isLoading.value = false;

        update();
      }
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

  changePasswordMethod({required BuildContext context}) async {
    isLoading.value = true;
    update();
    if (password.text.trim().isEmpty ||
        newPassword.text.trim().isEmpty ||
        confirmPassword.text.trim().isEmpty) {
      isLoading.value = false;
      update();
      showSnackBar(
          message: "Please Enter Passwords Properly", context: context);
    } else if (prevPassword != password.text) {
      isLoading.value = false;
      update();
      showSnackBar(
          message: "Current password is wrong Please Enter corrct one ",
          context: context);
    } else if (prevPassword == newPassword.text) {
      isLoading.value = false;
      update();
      showSnackBar(
          message:
              "Please Enter another Passwords its simmilar to your previous password",
          context: context);
    } else if (newPassword.text != confirmPassword.text) {
      isLoading.value = false;
      update();
      showSnackBar(
          message:
              '“Password & Confirm Password do not match” should be “Password & Confirm Password does not match',
          context: context);
    } else if (newPassword.text.trim().length < 8 ||
        confirmPassword.text.trim().length < 8) {
      isLoading.value = false;
      update();
      showSnackBar(
          message: "Please Enter atleast 8 digit password", context: context);
    } else {
      Databases databases = Databases(DataInfo.client!);
      try {
        await databases.updateDocument(
          databaseId: '6735eba3001840aef863',
          collectionId: '6735ebaa003ba5e26526',
          documentId: docuId,
          data: {
            'password': newPassword.text.trim(), // Update the password field
          },
        ).then((value) {
          showSnackBar(
              message: "Password updated successfully", context: context);
        });
        isLoading.value = false;
        update();
      } catch (e) {
        isLoading.value = false;
        update();
        showSnackBar(
            message: 'Failed to update password: $e', context: context);
      }
    }
  }

  updateProfileDetails({required BuildContext context}) async {
    Databases databases = Databases(DataInfo.client!);
    try {
      isLoading.value = true;
      update();
      Map<String, dynamic> data = {};

      if (datecontroller.text.isNotEmpty) {
        data['birthday'] = datecontroller.text.toString();
      }

      if (aniversary.text.isNotEmpty) {
        data['work_anniversary'] = aniversary.text.toString();
      }
      if (city.text.isNotEmpty) {
        data['city'] = city.text.toString();
      }
      if (phone.text.isNotEmpty) {
        data['mobile_no'] = phone.text.toString();
      }

      if (data.isNotEmpty) {
        isLoading.value = true;
        update();
        String filedId = ID.unique();
        if (webImage != null) {
          final Storage storage = Storage(DataInfo.client!);
          data['image'] = filedId;
          await storage.createFile(
            bucketId: '6745af79002818a31afc', // Replace with your bucket ID
            fileId: filedId, // Unique file ID
            file: InputFile.fromBytes(
              filename:
                  "${DateTime.now().millisecondsSinceEpoch.toString()}.png",
              bytes: webImage!,
            ),
          );
        }
        await databases
            .updateDocument(
          databaseId: '6735eba3001840aef863',
          collectionId: '6735ebaa003ba5e26526',
          documentId: docuId,
          data: data,
        )
            .then((value) {
          // Navigator.pop(context);

          showSnackBar(message: "updated successfully", context: context);
        });
        isLoading.value = false;
        update();
      } else {
        isLoading.value = false;
        update();
        showSnackBar(message: "No fields to update", context: context);
      }
    } catch (e) {
      isLoading.value = false;
      update();
      // Navigator.pop(context);
      showSnackBar(message: 'Failed to update profile: $e', context: context);
    }
  }

  updateTimeFormat(value) {
    selectedValue.value = value;
    update();
  }

  updateDateFormat(value) {
    selectedValues.value = value;
    update();
  }

  getTeams() async {
    print("settigs left bar screen");
    Databases databases = Databases(DataInfo.client!);

    try {
      isLoading.value = true;
      update();

      // Fetch documents from a specific database and collection
      var response = await databases.listDocuments(
        databaseId: DataInfo.databaseId,
        collectionId: DataInfo.teamCollectionId,
        queries: [
          Query.equal(
            'created_by',
            DataInfo.box.read('userId'),
          )
        ],
      );

      if (response.documents.isNotEmpty) {
        teamsData.value =
            response.documents.map((element) => element.data).toList();
        print("teamdata are:${teamsData}");
        isLoading.value = false;

        update();
      } else {
        isLoading.value = false;

        update();
      }
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
}
