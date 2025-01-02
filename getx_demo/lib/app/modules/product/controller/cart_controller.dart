import 'package:get/get.dart';
import 'package:getx_demo/app/modules/product/models/product_model.dart';
import 'package:getx_demo/app/services/cart_service.dart';

// class CartController extends GetxController {
//   var cartItems = <ProductModel>[].obs;
//   var totalAmount = 0.0.obs;

//   void addToCart(ProductModel product) {
//     cartItems.add(product);
//     calculateTotal();
//   }

//   void removeFromCart(ProductModel product) {
//     cartItems.remove(product);
//     calculateTotal();
//   }

//   void calculateTotal() {
//     totalAmount.value = cartItems.fold(0, (sum, item) => sum + item.price);
//   }
// }

class CartController extends GetxController {
  final CartService cartService = Get.find<CartService>();
  
  List<ProductModel> get cartItems => cartService.cartItems;
  double get totalAmount => cartService.totalAmount;

  void addToCart(ProductModel product){
    cartService.addToCart(product);
  }

  void removeFromCart(ProductModel product){
    cartService.removeFromCart(product);
  }
 
}
