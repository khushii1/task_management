import 'package:flutter/material.dart';
import 'package:jio_works/constants/image_constant.dart';
import 'package:jio_works/custom_widgets/text_widget.dart';
import 'package:jio_works/utilities/custom_field.dart';
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
          onClick != null
              ? IconButton(
                  onPressed: onClick, icon: const Icon(Icons.logout_outlined))
              : const SizedBox(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  
  Widget get child => throw UnimplementedError();
}
