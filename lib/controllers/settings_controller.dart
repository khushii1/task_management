import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jio_works/utilities/library.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

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
  final password=TextEditingController();
  final newPassword=TextEditingController();
  final confirmPassword=TextEditingController();
  late String prevPassword='';
  late String docuId='';
  RxInt selectedValue=8.obs;
  RxInt selectedValues=8.obs;
  final textFieldKey = GlobalKey();
  final datecontroller=TextEditingController();
  DateTime date=DateTime.now();
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
chooseDate()async{
  final pickedDate = await showWebDatePicker(
    context: textFieldKey.currentContext!,
    initialDate: date,
    firstDate: DateTime.now().subtract(const Duration(days: 7)),
    lastDate: DateTime.now().add(const Duration(days: 14000)),
    // width: 400,
    // withoutActionButtons: true,
    weekendDaysColor: Colors.red,
    // selectedDayColor: Colors.brown
    // firstDayOfWeekIndex: 1,
    // asDialog: _asDialog,
  );
  if (pickedDate != null) {
    date = pickedDate;
    datecontroller.text = pickedDate.toString().split(' ')[0];
  }
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
         prevPassword=userDetails['password'];
         docuId=response.documents.first.$id;
        


          update();

        }
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  changePasswordMethod({required BuildContext context})async{
    if(password.text.trim().isEmpty || newPassword.text.trim().isEmpty || confirmPassword.text.trim().isEmpty){
      showSnackBar(message: "Please Enter Passwords Properly", context: context);
    }
    else if(prevPassword!=password.text){
      showSnackBar(message: "Current password is wrong Please Enter corrct one ", context: context);
    }
    else if(prevPassword==newPassword.text){
      showSnackBar(message: "Please Enter another Passwords its simmilar to your previous password", context: context);
    }
    else if(newPassword.text!=confirmPassword.text){
      showSnackBar(message: '“Password & Confirm Password do not match” should be “Password & Confirm Password does not match', context: context);
    }
    else if(newPassword.text.trim().length<8 || confirmPassword.text.trim().length<8){
      showSnackBar(message: "Please Enter atleast 8 digit password", context: context);
    }
    else{
      Databases databases = Databases(DataInfo.client!);
      try{
         await databases.updateDocument(
            databaseId: '6735eba3001840aef863',
            collectionId: '6735ebaa003ba5e26526'
            ,
            documentId: docuId,
          data: {
            'password': newPassword.text.trim(), // Update the password field
          },
        ).then((value){
          showSnackBar(message: "Password updated successfully", context: context);
        });
        print('Password updated successfully');
      } catch (e) {
        showSnackBar(message: 'Failed to update password: $e',context: context);
      }
    }
  }
  updateTimeFormat(value){
    selectedValue.value=value;
    update();
  }
  updateDateFormat(value){
    selectedValues.value=value;
    update();
  }
}
