import 'package:go_router/go_router.dart';
import 'package:jio_works/screens/profile_details.dart';
import 'package:jio_works/utilities/custom_field.dart';
import 'package:jio_works/utilities/library.dart';

class JioScreen extends StatelessWidget {
  const JioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppbarWidget(
        onClick: () async {
          await DataInfo.account.deleteSessions();
          context.go("/login");
        },
      ),
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child:
                                      workspace.image(color: Colors.white).p8(),
                                ),
                                10.heightBox,
                                const TextWidget(
                                  text: "My Space",
                                  color: Color(0xff595959),
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            )).pOnly(bottom: 10.0),
                        IconButton(
                            onPressed: () {},
                            icon: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff5f5f5),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child:
                                      project.image(color: Colors.black54).p8(),
                                ),
                                10.heightBox,
                                const TextWidget(
                                  text: "Project",
                                  color: Color(0xff595959),
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            )).pOnly(bottom: 10.0),
                        IconButton(
                            onPressed: () {},
                            icon: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff5f5f5),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: dashboard
                                      .image(color: Colors.black54)
                                      .p8(),
                                ),
                                10.heightBox,
                                const TextWidget(
                                  text: "Dashboard",
                                  color: Color(0xff595959),
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            )).pOnly(bottom: 10.0),
                        IconButton(
                            onPressed: () {},
                            icon: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff5f5f5),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child:
                                      archive.image(color: Colors.black54).p8(),
                                ),
                                10.heightBox,
                                const TextWidget(
                                  text: "Archive",
                                  color: Color(0xff595959),
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            )).pOnly(bottom: 10.0),
                        IconButton(
                            onPressed: () {},
                            icon: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff5f5f5),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child:
                                      setting.image(color: Colors.black54).p8(),
                                ),
                                10.heightBox,
                                const TextWidget(
                                  text: "Settings",
                                  color: Color(0xff595959),
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            )).pOnly(bottom: 10.0),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child:
                                  deleteIcon.image(color: Colors.black54).p8(),
                            ),
                            10.heightBox,
                            const TextWidget(
                              text: "Delete",
                              color: Color(0xff595959),
                              fontWeight: FontWeight.w700,
                            )
                          ],
                        )).pOnly(bottom: 10.0),
                  ],
                )).pSymmetric(v: 15.0),
            ProfileDetails(),
          ],
        ),
      ),
    );
  }
}
