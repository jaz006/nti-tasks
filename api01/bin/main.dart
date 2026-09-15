// ignore_for_file: unused_import

import 'package:api01/category/deleteCategory.dart';
import 'package:api01/category/editCategory.dart';
import 'package:api01/category/getCategory.dart';
import 'package:api01/category/newCategory.dart';
import 'package:api01/order/cancelOrder.dart';
import 'package:api01/order/completeOrder.dart';
import 'package:api01/order/getOrders.dart';
import 'package:api01/order/placeOrder.dart';
import 'package:api01/products/addFavorite.dart';
import 'package:api01/products/bestSellerProduct.dart';
import 'package:api01/products/deleteProduct.dart';
import 'package:api01/products/editProduct.dart';
import 'package:api01/products/getproducts.dart';
import 'package:api01/products/newProduct.dart';
import 'package:api01/products/search.dart';
import 'package:api01/products/topRatedProduct.dart';
import 'package:api01/sliders/deleteSliders.dart';
import 'package:api01/sliders/editSliders.dart';
import 'package:api01/sliders/getSliders.dart';
import 'package:api01/sliders/newSlider.dart';
import 'package:api01/users/getUserData.dart';
import 'package:api01/users/login.dart';
import 'package:api01/users/register.dart';
import 'package:api01/users/updateProfile.dart';

void main() async {
  //user
  // await register();

  //queen:
  await login();

  //await updateProfile();
  //await getUserData();

  /////////////////////////////////////////////////

  //sliders:
  //await newSlider();
  //await editSlider();
  //await getSliders();
  //await deleteSliders();

  ////////////////////////////////////////////////////////////////

  //categories:
  //await newCategory();
  //await getCategory();
  //await editCategory();
  //await deleteCategory();

  ////////////////////////////////////////////////////////////////

  //Orders:
  //await placeOrder();
  //await getOrders();
  // await cancelOrder();
  // await comleteOrder();

  ///////////////////////////////////////////////////////////////////

  //product:
  // await addToFavorie();
  //await bestSellerProduct();
  //await search();
  //await topRatedProduct();
  //await newProduct();
  //await getProduct();
  //await editProduct();
  //await deleteProduct();
}
