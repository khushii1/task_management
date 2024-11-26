import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:jio_works/utilities/library.dart';

String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}

String getFormattedDate() {
  final now = DateTime.now();
  // Format: "Day, Date Month"
  return DateFormat('EEEE, d MMMM').format(now);
}

Widget divider({
  double width = 220,
  double height = 0.5,
}) {
  return Container(
    width: width,
    height: height,
    color: Colors.grey[400],
  );
}

Future<DateTime?> selectCustomDate({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  DateTime? selectedDate = initialDate ?? DateTime.now();

  final DateTime? picked = await showCupertinoModalPopup(
    context: context,
    builder: (context) => DatePickerDialog(
      restorationId: 'date_picker_dialog',
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime(selectedDate.year-18),
      firstDate: DateTime(1950),
      lastDate: DateTime(DateTime.now().year),
    ),
  );
  print("picked date:${picked}");
  return picked;
}