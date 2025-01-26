abstract class BaseApiService {
  final String baseURL = "https://api.bikeshopping.com";

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url, Map<String, String> jsonBody);
}
