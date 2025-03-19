import 'package:get/get.dart';

import '../models/item.dart';

class AppSnackBars {
  static addItem(Item item) {
    return Get.showSnackbar(GetSnackBar(
      title: 'Item adicionado',
      message: '${item.nome} inserido na lista de compras',
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    ));
  }

  static removeItem(Item item) {
    return Get.showSnackbar(GetSnackBar(
      title: 'Item removido',
      message: '${item.nome} removido da lista de compras',
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    ));
  }

  static compraFinalizada() {
    return Get.showSnackbar(GetSnackBar(
      title: 'Compra finalizada',
      message: 'Seu pedido chegara em breve',
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.TOP,
    ));
  }
}
