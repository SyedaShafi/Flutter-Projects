import 'package:get/get.dart';
import 'package:getx_demo/app/modules/product/controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
