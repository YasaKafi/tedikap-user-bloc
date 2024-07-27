import './global_variabel.dart';

class TedikapApiRepository {
  static String mainUrl = GlobalVariables.baseUrl;

  static String getAllProduct = '$mainUrl/api/product';
  static String getAllRewardProduct = '$mainUrl/api/reward-product';
  static String getAllVoucherActive = '$mainUrl/api/voucher/active';
  static String getAllProductFavorite = '$mainUrl/api/product/favorite';
  static String getCart = '$mainUrl/api/cart';
  static String getCartReward = '$mainUrl/api/cart-reward';
  static String getAllOrder = '$mainUrl/api/order/history';
  static String getOrderReward = '$mainUrl/api/order-reward';
  static String getOrderByID = '$mainUrl/api/order';
  static String getUserPoin = '$mainUrl/api/point';
  static String getFilterProduct = '$mainUrl/api/filter/product';
  static String getFilterOrder = '$mainUrl/api/order/history';
  static String getFilterOrderReward = '$mainUrl/api/order-reward/history';
  static String getFilterRewardProduct = '$mainUrl/api/filter/reward-product';
  static String getSearchProduct = '$mainUrl/api/filter/product';

  static String getProductByID = '$mainUrl/api/product/show';
  static String getRewardProductByID = '$mainUrl/api/reward-product/show';
  static String getCheckoutProductByIDUser = '$mainUrl/api/cart/getById';
  static String getDetailVoucher= '$mainUrl/api/voucher/show';
  static String getCartItem= '$mainUrl/api/cart/item';
  static String getCartItemReward= '$mainUrl/api/cart-reward/item';
  static String postProductFavorite = '$mainUrl/api/product/favorite';

  static String getImage = '$mainUrl/storage/product/';
  static String getAvatarProfile = '$mainUrl/storage/avatar/';
  static String getImagePromo = '$mainUrl/storage/voucher/';
  static String getImageRewardProduct = '$mainUrl/storage/reward-product/';

  static String postRegister = '$mainUrl/api/user/register';
  static String postLogin = '$mainUrl/api/user/login';
  static String getCurrentUser = '$mainUrl/api/user/get-user';
  static String postProfile = '$mainUrl/api/user/update-profile';
  static String postLogout = '$mainUrl/api/user/logout';
  static String postPayment = '$mainUrl/api/payment';
  static String postOrder = '$mainUrl/api/order/store';
  static String postOrderReward = '$mainUrl/api/order-reward/store';

  static String putCart = '$mainUrl/api/cart/update';
  static String putCartReward = '$mainUrl/api/cart-reward/update';
  static String postCart = '$mainUrl/api/cart/store';
  static String postCartReward = '$mainUrl/api/cart-reward/store';
  static String deleteCartItem = '$mainUrl/api/cart/delete';
  static String deleteCartItemReward = '$mainUrl/api/cart-reward/delete';
  static String patchUpdateQty = '$mainUrl/api/cart/update-quantity';
  static String patchUpdateQtyReward = '$mainUrl/api/cart-reward/update-quantity';

  static String postApplyVoucher = '$mainUrl/api/cart/apply-voucher';
  static String postRemoveVoucher = '$mainUrl/api/cart/remove-voucher';

}
