class EndPoints {
  //configure this
  static const bool HTTPS = true;

  //configure this
  static const String DOMAIN_PATH = "test.com";

  //do not configure these below
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String API_ENDPATH = "/api/v1/";
  static const String RAW_BASE_URL = "$PROTOCOL$DOMAIN_PATH";
  static const String BASE_URL = "$RAW_BASE_URL/$API_ENDPATH";

  // Headers
  static String token = "";
  static const String defaultLanguage = "Language";
  static const String authorization = "Authorization";

  // Api Keys
  static const String apiKey = "Api-key";
  static const String keyForApiKey = "";

  // Payment
  static const String paymentKeyLive = "";
  static const String paymentKeyTest = "";
  static const String paymentKey = paymentKeyTest;
  static const String appleMerchant = "merchant.com.test.test";

  // Apis For Landing
  static const String privacy = "$RAW_BASE_URL/privacy-policy";
  static const String aboutUs = "$RAW_BASE_URL/contact";
  static const String terms = "$RAW_BASE_URL/terms-and-conditions";

  // Apis For Auth
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String verifyOtp = "auth/verify-otp";
  static const String resendOtp = "auth/resend-otp";
  static const String client = "client";
  static const String updateClientAvatar = "update-client-avatar";
  static const String user = "user";

  // Apis For General App
  static const String banners = "banners";
  static const String version = "get-client-version";
  static const String notifications = "notifications";
  static const String packages = "packages";
  static const String lockerOrder = "locker-order";
  static const String zoneCheck = "zone-check";
  static const String categories = "categories";
  static const String subCategories = "sub-categories";
  static const String services = "services";
  static const String orders = "orders";
  static const String complaints = "complaints";
  static const String ordersOperations = "orders-operations/";
  static const String applyCode = "apply-code";
}
