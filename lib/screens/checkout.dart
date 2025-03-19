import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panucci_delivery_getx/components/order_item.dart';
import 'package:panucci_delivery_getx/controllers/carrinho_controller.dart';
import 'package:panucci_delivery_getx/screens/home.dart';
import 'package:panucci_delivery_getx/utils/snackbars.dart';
import '../components/payment_method.dart';
import '../components/payment_total.dart';

class Checkout extends StatelessWidget {
  Checkout({
    Key? key,
  }) : super(key: key);
  final CarrinhoController carrinhoController = Get.find<CarrinhoController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Pedido",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return OrderItem(item: carrinhoController.itensCarrinho[index]);
              }, childCount: carrinhoController.itensCarrinho.length)),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Pagamento",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: PaymentMethod(),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Confirmar",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: PaymentTotal(total: carrinhoController.total.value),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => Home());

                        // Diferente do Get.back, o Get.offAll,
                        // ele encerra toda as paginas que estao na pilha de navegacao e navega para a pagina que vc apontar,
                        // mas detalhe: Ele encerra toda a pilha de navegacao.
                        //Ja o Get.back, faz o mesmo que o  Navigator.of(context).pop();.

                        AppSnackBars.compraFinalizada();
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceTint),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.account_balance_wallet),
                            ),
                            Text(
                              "Pedir",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ]),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
