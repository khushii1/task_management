// ignore_for_file: use_build_context_synchronously

import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:jio_works/constants/image_constant.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';
import 'package:jio_works/datainfo/datainfo.dart';
import 'package:jio_works/utilities/custom_field.dart';
import 'package:jio_works/utilities/library.dart';
import 'package:velocity_x/velocity_x.dart';

class AppbarWidget extends StatelessWidget implements PreferredSize {
  final String? title;
  final Function()? onClick;
  const AppbarWidget({super.key, this.title, this.onClick});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        backgroundColor: const Color(0xff0078ad),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            10.widthBox,
            jioLogo.svg(),
            15.widthBox,
            const TextWidget(
              text: "Jio Works",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
              onSelected: (String value) async {
                if (value == "1") {
                  try {
                    await DataInfo.account
                        .deleteSession(sessionId: DataInfo.sessionId);
                    context.go("/login");
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                }
              },
              offset: const Offset(0, 30),
              surfaceTintColor: Colors.white,
              color: Colors.white,
              tooltip: "",
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: '1',
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout_outlined,
                            color: Color(0xff595959),
                          ),
                          TextWidget(
                            text: "Logout",
                            fontSize: 18,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )),
                ];
              },
              child: FutureBuilder<User?>(
                future: getCurrentUser(),
                builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SizedBox();
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const SizedBox();
                  } else {
                    final user = snapshot.data!;
                    return Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffE5F1F7)),
                        child: TextWidget(
                          text: getInitials(user.name),
                          color: const Color(0xff000093),
                          fontWeight: FontWeight.bold,
                        ).p8());
                  }
                },
              )),
          20.widthBox,
          // onClick != null
          //     ? IconButton(
          //         onPressed: onClick, icon: const Icon(Icons.logout_outlined))
          //     : const SizedBox(),
        ],
      ),
    );
  }

  String getInitials(String fullName) {
    List<String> names = fullName.trim().split(' ');
    return names
        .map((name) => name.isNotEmpty ? name[0].toUpperCase() : '')
        .join();
  }

  Future<User?> getCurrentUser() async {
    try {
      final user = await DataInfo.account.get();
      return user;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user details: $e');
      }
      return null; // Return null in case of an error
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget get child => throw UnimplementedError();
}
