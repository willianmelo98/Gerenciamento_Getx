import 'package:get/get.dart';

class CartaoController extends GetxController {
  var counter = 0.obs;

  void addItem() {
    counter++;
  }

  void removeItem() {
    counter--;
  }
}
