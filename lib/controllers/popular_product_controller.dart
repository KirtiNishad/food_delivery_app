// import 'package:flutter/foundation.dart';
// import 'dart:math';

// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:get/get.dart';
// import 'dart:developer';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      Get.log('got popular product');

      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);

      _isLoaded = true;

      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      Get.log('Increment by $_quantity');
      _quantity = checkQuantity(_quantity + 1);
    } else {
      Get.log('Decrement by $_quantity');
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar(
        "Item count",
        "You can't reduce more.",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 5) {
      Get.snackbar(
        "Item count",
        "You can't add more.",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 5;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;

    var exist = false;
    exist = _cart.existInCart(product);

    Get.log("Item is exist is cart or not.......... : $exist");
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }

    Get.log("the quantity in the cart in.......... $_inCartItems");
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      Get.log(
          ".................the id is : ${value.id} and the quantity is : ${value.quantity}");
    });

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List get getItems {
    return _cart.getItems;
  }
}
