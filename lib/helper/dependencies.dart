import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/utils/app_constant.dart';
import 'package:get/get.dart';

Future<void> init() async{

  //For API CLinet
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.Base_URL));

  //For Repose
  Get.lazyPut(()=> PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=> RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=> CartRepo());



  //Controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));



}