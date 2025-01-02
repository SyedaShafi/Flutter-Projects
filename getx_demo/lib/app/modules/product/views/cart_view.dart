import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app/modules/product/controller/cart_controller.dart';
import 'package:getx_demo/app/routes/app_pages.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartController.cartItems[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('\$${item.price}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          Get.defaultDialog(
                            title: 'Remove Item',
                            middleText:
                                'Are you sure you want to remove ${item.name} from the cart?',
                            textConfirm: "Yes",
                            textCancel: "No",
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              cartController.removeFromCart(item);
                              Get.back();
                            },
                            onCancel: () {},
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(6),
              child: Text(
                'Total: \$${cartController.totalAmount}',
                style: const TextStyle(fontSize: 24),
              ),
            );
          }),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.CHECKOUT);
            },
            child: const Text('Proceed to Checkout'),
          ),
        ],
      ),
    );
  }
}
