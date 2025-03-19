import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:panucci_delivery_getx/components/cartao/cartao_controller.dart';
import 'package:panucci_delivery_getx/controllers/carrinho_controller.dart';
import 'package:panucci_delivery_getx/utils/snackbars.dart';

import '../../models/item.dart';

class Cartao extends StatefulWidget {
  Cartao({Key? key, required this.item}) : super(key: key);
  final Item item;

  @override
  State<Cartao> createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> {
  late CartaoController controller;
  final CarrinhoController carrinhoController = Get.find<CarrinhoController>();

  @override
  void initState() {
    super.initState();
    controller = Get.put(CartaoController(), tag: widget.item.nome);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF6F6F6),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 134),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              image: AssetImage(widget.item.uri),
              width: double.infinity,
              height: 50,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      widget.item.nome,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("R\$ ${widget.item.preco.toStringAsFixed(2)}"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          if (controller.counter > 0) {
                            controller.removeItem();
                            carrinhoController.removeCarrinho(widget.item);
                            AppSnackBars.removeItem(widget.item);
                          }
                        },
                        child: const Icon(
                          Icons.remove_circle_outline,
                          size: 20,
                        ),
                      ),
                      Obx(() => Text(controller.counter.toString())),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          controller.addItem();
                          carrinhoController.addCarrinho(widget.item);
                          AppSnackBars.addItem(widget.item);
                        },
                        child: const Icon(
                          Icons.add_circle_outline,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
