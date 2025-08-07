class UnsplashHelper {
  static List<String> getSampleImages(String style, String occasion) {
    final query = "$style outfit $occasion";

    return [
      "https://source.unsplash.com/400x500/?$query,1",
      "https://source.unsplash.com/400x500/?$query,2",
    ];
  }
}