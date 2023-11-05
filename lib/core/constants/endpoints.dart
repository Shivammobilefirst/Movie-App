class EndPoints {
  EndPoints._();
  static const baseurl = "https://api.themoviedb.org/3";

  static const String getPopularMovie = "/movie/popular";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;
}
