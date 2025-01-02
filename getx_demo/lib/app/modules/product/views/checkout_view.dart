import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app/modules/product/controller/cart_controller.dart';

class CheckoutView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thank you for your purchase!',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cartController.cartService.clearCart();
                Get.snackbar(
                  'Order Completed',
                  'Your order has been successfully placed',
                  snackPosition: SnackPosition.BOTTOM,
                );
                Get.offAllNamed('/product');
              },
              child: const Text('Place your order'),
            ),
          ],
        ),
      ),
    );
  }
}
