class EndPoints {
  EndPoints._();
  static const baseurl = "https://api.themoviedb.org/3";

  static const String getPopularMovie = "/trending/movie/day";

  static const String upcomingMovie = "/movie/upcoming";

  static const String topRatedMovie = "/movie/top_rated";

  static const String addFavoriteMovie = "/account/20335437/favorite";

  static const String favoriteMovie =
      "/account/20335437/favorite/movies?language=en-US&page=1&sort_by=created_at.asc";

  static const String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmODg4YzRhZGE1MmEwNjk1YzE1ZDhlODg2ODdmYzg0NCIsInN1YiI6IjY0ZTQ5M2VhMWZlYWMxMDBhYjhkZDM4OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6Cdr0Fpf08JBi9Qzp20YH2JnCEfUEbPT84q4CCeC39I';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  static const String imagePath = 'https://image.tmdb.org/t/p/w500';
  // connectTimeout
  static const int connectionTimeout = 15000;
}
