abstract interface class HttpNativeInterface {
  Future<Map<String, dynamic>> fetchPost(String url, String body);
}
