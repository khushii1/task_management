import 'package:jio_works/utilities/library.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final bool? isLoading;
  const ButtonWidget(
      {super.key, required this.text, this.onTap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    return Container(
      width: context.screenWidth,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(230)),
      child: isLoading == false
          ? TextWidget(
              text: text,
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )
          : const CircularProgressIndicator(),
    ).onTap((){
      onTap!();
    });
  }
}
