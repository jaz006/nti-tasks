abstract class EndPoints {
  static const String baseUrl =
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/";
  

  //user endpoints
  static const String register = "register";
  static const String login = "login";
  static const String updateProfile = "update_profile";
  static const String getUserData = "get_user_data";
  static const String deleteUser = "delete_user";

  ///////////////////////////////////////////////////////////////////
  
  //sliders endpoints
  static const String newSlider = "new_slider";
  static const String editSlider = "slider/6";
  static const String deleteSlider= "slider/7";
  static const String getSliders = "sliders";

  /////////////////////////////////////////////////


  //categories endpoints:
  static const String newCategory = "new_category";
  static const String editCategory = "category/5";
  static const String deleteCategory= "category/6";
  static const String getCategory = "categories";
  
  /////////////////////////////////////////////////////
  
  //order endpoints:
  static const String placeOrder = "place_order";
  static const String cancelOrder = "orders/cancel/8";
  static const String completeOrder = "orders/complete/9";
  static const String getOrder = "orders";
  
  //////////////////////////////////////////////////////

  //products endpoints:
   static const String newProduct = "new_product";
   static const String addToFavorite = "add_to_favorite";
   static const String getProduct = "products";
   static const String editProduct = "product/5";
   static const String deleteProduct = "product/6";
   static const String search = "products/search?q=p";
   static const String bestSellerProduct = "best_seller_products";
   static const String topRatedProduct = "top_rated_products";



  //token
  static String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4OTA1NDEwMSwianRpIjoiMzc3NDRiNGItN2MxZi00YWM5LWI5YTMtNGNjMDMwZDRhOTBjIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MTUsIm5iZiI6MTc4OTA1NDEwMSwiY3NyZiI6ImE4ZmJmNzE1LTc3ODQtNGFjYi04YjcyLTIxYTczNmRjMjhiZSIsImV4cCI6MTc4OTA1NTAwMX0.t76Ne6fJ_1Zawzr_rmi1RVLEn-DZ03uttlgxvpiI21w";
}
