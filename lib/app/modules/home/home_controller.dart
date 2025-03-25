import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var formattedDate = "".obs;

  @override
  void onInit() {
    super.onInit();
    updateDate();
  }

  void updateDate() {
    DateTime today = DateTime.now();
    formattedDate.value = DateFormat('MMM d, y').format(today);
  }
}
