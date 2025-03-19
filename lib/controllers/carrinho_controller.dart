import 'package:get/get.dart';
import 'package:panucci_delivery_getx/models/item.dart';

class CarrinhoController extends GetxController {
  var itensCarrinho = <Item>[].obs;
  var total = 0.0.obs;

  void addCarrinho(Item item) {
    itensCarrinho.add(item);
    updateTotal();
  }

  void removeCarrinho(Item item) {
    itensCarrinho.remove(item);
    updateTotal();
  }

  void updateTotal() {
    total.value = 0.0;
    for (var i = 0; itensCarrinho.length > i; i++) {
      total.value += itensCarrinho[i].preco;
    }
  }
}
