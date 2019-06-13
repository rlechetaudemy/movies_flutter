class Movie {
  int id;
  String title;
  String tagline;
  String poster_path;
  double vote_average;
  String overview;
  String release_date;
  String homepage;
  String popularity;
  Object production_companies;
  Object production_countries;
  String runtime;
  String vote_count;

  // Tag para controlar o Hero
  String tag;

  get urlFoto => "https://image.tmdb.org/t/p/w300/" + poster_path;

  Movie(
      this.id,
      this.title,
      this.tagline,
      this.vote_average,
      this.poster_path,
      this.overview,
      this.release_date,
      this.homepage,
      this.popularity,
      this.production_companies,
      this.production_countries,
      this.runtime,
      this.vote_count);

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        tagline = json["tagline"],
        poster_path = json["poster_path"],
        vote_average = json["vote_average"] == null
            ? 0
            : double.parse(json["vote_average"].toString()),
        overview = json["overview"],
        release_date = json["release_date"],
        homepage = json["homepage"],
        popularity = json["popularity"].toString(),
        production_companies = json["production_companies"],
        runtime = json["runtime"].toString(),
        vote_count = json["vote_count"].toString();

  Map toMap() {
    var map = {
      "id": id,
      "title": title,
      "tagline": tagline,
      "poster_path": poster_path,
      "vote_average": vote_average,
      "overview": overview,
      "release_date": release_date,
      "homepage": homepage,
      "popularity": popularity,
      "production_companies": production_companies,
      "production_countries": production_countries,
      "runtime": runtime,
      "vote_count": vote_count
    };
    return map;
  }

  @override
  String toString() {
    return title;
  }
}
